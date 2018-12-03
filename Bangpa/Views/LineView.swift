//
//  LineView.swift
//  Bangpa
//
//  Created by 이동건 on 03/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(displayP3Red: 240, green: 240, blue: 240, alpha: 0.7).cgColor
    }
}
