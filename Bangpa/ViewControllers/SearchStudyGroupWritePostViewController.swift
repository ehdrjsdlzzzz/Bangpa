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
