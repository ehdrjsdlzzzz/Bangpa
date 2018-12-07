//
//  ButtonCell.swift
//  Bangpa
//
//  Created by 이동건 on 07/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 5
        }
    }
    var buttonDidTapped: ((UIButton)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupButton(title: String) {
        self.button.setTitle(title, for: .normal)
    }
    @IBAction func buttonDidTapped(_ sender: UIButton) {
        buttonDidTapped?(sender)
    }
}
