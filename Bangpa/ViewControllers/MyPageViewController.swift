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

class MyPageViewController: UIViewController {
    
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
}

extension MyPageViewController: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print("Present")
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print("Dismiss")
    }
}
