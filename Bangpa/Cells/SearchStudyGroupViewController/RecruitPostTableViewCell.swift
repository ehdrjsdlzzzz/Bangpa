//
//  RecruitPostTableViewCell.swift
//  Bangpa
//
//  Created by RAK on 2018. 8. 7..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class RecruitPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var recruitNumberLabel: UILabel!
    @IBOutlet weak var postWriterLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 16, 0, 16))
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
