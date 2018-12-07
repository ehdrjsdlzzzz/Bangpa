//
//  MyPageViewController.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import NaverThirdPartyLogin
import Alamofire

class MyPageViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var kakoSignInButton: KOLoginButton!
    private let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    @IBOutlet weak var googleSignInButton: GIDSignInButton! {
        didSet {
            googleSignInButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleGoogleSignIn)))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
        
        setUpGoogleLogin()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSignInProcess), name: BangpaNotificationName.loginSuccess.value, object: nil)

    }
    
    @objc func handleGoogleSignIn(_ sender: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    private func setUpGoogleLogin() {
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func handleNaverSignIn(_ sender: Any) {
        loginInstance?.delegate = self
        loginInstance?.requestThirdPartyLogin()
    }
    
    @IBAction func handleKakaoSignIn(_ sender: Any) {
        guard let session = KOSession.shared() else { return }
        
        if session.isOpen() {
            session.close()
        }
        
        session.open { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "에러")
                return
            }

            if session.isOpen() {
                KOSessionTask.userMeTask(completion: { (error, profile) in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    
                    guard let name = profile?.nickname else { return }
                    guard let email = profile?.account?.email else { return }
                    print(name)
                    print(email)
                    let userInfo = ["name":name, "email":email]
                    NotificationCenter.default.post(name: BangpaNotificationName.loginSuccess.value, object: nil, userInfo: userInfo)
                })
            }else {
                print("로그인 실패")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfo = sender as? [String:String] else { print("no userInfo"); return }
        guard let destination = segue.destination as? AdditionalInfoViewController else { print("No destination"); return }
        print(userInfo)
        destination.userInfo = userInfo
    }
    
    @objc func handleSignInProcess(_ notification: Notification) {
        performSegue(withIdentifier: BangpaSegueType.signInSuccess.identifier, sender: notification.userInfo)
    }
}

extension MyPageViewController: NaverThirdPartyLoginConnectionDelegate {
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        let naverSignInViewController = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
        present(naverSignInViewController, animated: true, completion: nil)
    }
    // ---- 4
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success oauth20ConnectionDidFinishRequestACTokenWithAuthCode")
        getNaverEmailFromURL()
    }
    // ---- 5
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("Success oauth20ConnectionDidFinishRequestACTokenWithRefreshToken")
        getNaverEmailFromURL()
    }
    // ---- 6
    func oauth20ConnectionDidFinishDeleteToken() {
        
    }
    
    // ---- 7
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print(error.localizedDescription)
        print(error)
    }
    // ---- 8
    func getNaverEmailFromURL(){
        guard let loginConn = NaverThirdPartyLoginConnection.getSharedInstance() else {return}
        guard let tokenType = loginConn.tokenType else {return}
        guard let accessToken = loginConn.accessToken else {return}
        
        let authorization = "\(tokenType) \(accessToken)"
        Alamofire.request("https://openapi.naver.com/v1/nid/me", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization" : authorization]).responseJSON { (response) in
            guard let result = response.result.value as? [String: Any] else {return}
            guard let object = result["response"] as? [String: Any] else {return}
            guard let name = object["name"] as? String else {return}
            guard let email = object["email"] as? String else {return}
            
            let userInfo = ["name":name, "email":email]
            NotificationCenter.default.post(name: BangpaNotificationName.loginSuccess.value, object: nil, userInfo: userInfo)
        }
    }

}
