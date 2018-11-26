//
//  StudyGroupTableViewCell.swift
//  Bangpa
//
//  Created by 이동건 on 19/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class StudyGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var studyLeaderLabel: UILabel!
    @IBOutlet weak var postingTimeLabel: UILabel!
    @IBOutlet weak var hashtagStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupShadow()
        
        hashtagStackView.addArrangedSubview(generateHashtagButton(with: "#swift"))
        hashtagStackView.addArrangedSubview(generateHashtagButton(with: "#iOS"))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
//        titleLabel.text = nil
//        memberCountLabel.text = nil
//        studyLeaderLabel.text = nil
//        postingTimeLabel.text = nil
    }
    
    private func setupShadow(){
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = .zero
    }
    
    private func generateHashtagButton(with text: String) -> UIButton {
        let button = UIButton()
        button.accessibilityTraits = UIAccessibilityTraits.staticText
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = false
        button.backgroundColor = UIColor.themeBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(text, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        return button
    }
}
