//
//  StudyRegionTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 03/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class StudyRegionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recruitLabel: UILabel!
    @IBOutlet weak var recruitButton: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
