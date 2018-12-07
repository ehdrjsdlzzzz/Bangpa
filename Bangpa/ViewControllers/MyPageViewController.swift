//
//  MyPageViewController.swift
//  Bangpa
//
//  Created by 이동건 on 07/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    static let notification = Notification.Name(rawValue: "MyPageViewController.didLoggedIn")
    private var isLoggedIn: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
        checkIsLoggedIn()
    }
    
    private func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleLoggedIn), name: MyPageViewController.notification, object: nil)
    }
    
    @objc func handleLoggedIn(_ notification: Notification) {
        self.isLoggedIn = true
    }
    
    private func checkIsLoggedIn() {
        if !isLoggedIn {
            let loginVC = UIStoryboard(name: LoginViewController.reusableIdentifier, bundle: nil).instantiateViewController(withIdentifier: LoginViewController.reusableIdentifier)
            
            present(UINavigationController(rootViewController: loginVC), animated: true, completion: nil)
        }
    }
}
