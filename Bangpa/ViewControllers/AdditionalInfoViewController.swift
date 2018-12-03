//
//  AdditionalInfoViewController.swift
//  Bangpa
//
//  Created by 이동건 on 27/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userInfo: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = userInfo?["name"]
        emailLabel.text = userInfo?["email"]
    }
}
