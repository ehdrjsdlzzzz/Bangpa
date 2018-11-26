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
    private let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var googleSignInButton: GIDSignInButton! {
        didSet {
            googleSignInButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleGoogleSignIn)))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
        
        setUpGoogleLogin()
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
            
            self.idLabel.text = email
            print(result)
        }
    }

}
