//
//  CheckBox.swift
//  Bangpa
//
//  Created by RAK on 2018. 8. 23..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    let checkedImage = UIImage(named: "CheckBoxChecked")
    let unCheckedImage = UIImage(named: "CheckBoxUnChecked")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(unCheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        isChecked = !isChecked
    }

}
