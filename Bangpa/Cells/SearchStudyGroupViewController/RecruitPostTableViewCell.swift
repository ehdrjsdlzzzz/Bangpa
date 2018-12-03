//
//  RecruitPostTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 03/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class RecruitPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var recruitNumberLabel: UILabel!
    @IBOutlet weak var postWriterLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var bookMarkButton: UIButton!
    
    
    var isCheckedBookMark = false
    @IBAction func bookMarkButtonTapped(_ sender: Any) {
        isCheckedBookMark = !isCheckedBookMark
        
        setUpViews()
    }
    
    private func setUpViews() {
        if isCheckedBookMark {
            bookMarkButton.setImage(#imageLiteral(resourceName: "SelectedBookmark"), for: .normal)
        } else {
            bookMarkButton.setImage(#imageLiteral(resourceName: "NoneSelectedBookmark"), for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
        //        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postTitleLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
