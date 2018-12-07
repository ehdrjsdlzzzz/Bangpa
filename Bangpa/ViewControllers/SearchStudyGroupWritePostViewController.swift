//
//  SearchStudyGroupWritePostViewController.swift
//  Bangpa
//
//  Created by RAK on 26/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class SearchStudyGroupWritePostViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBAction func touchUpWriteButton(_ sender: UIButton) {
        if titleTextField.text != "", contentTextField.text != "" {
            let newPost = RecruitPost(postTitle: titleTextField.text!, postWriter: "아무개")
            
            print(newPost)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
    
    func setUpNavigationBar() {
        let navigationDeleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationDeleteButton.setBackgroundImage(UIImage(named: "Delete"), for: .normal)
        navigationDeleteButton.addTarget(self, action: #selector(deleteButtonDidTapped), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationDeleteButton)
    }
    
    @objc func deleteButtonDidTapped() {
        print("send delete message")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let vc = segue.destination as! StudyGroupSetFilterViewController
//
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        print("필터설정떠라")
        
    }

}
