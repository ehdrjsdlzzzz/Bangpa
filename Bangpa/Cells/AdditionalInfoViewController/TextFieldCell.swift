//
//  TextFieldCell.swift
//  Bangpa
//
//  Created by 이동건 on 07/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectionStyle = .none
    }
}
