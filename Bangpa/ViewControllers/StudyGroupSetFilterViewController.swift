//
//  StudyGroupSetFilterViewController.swift
//  Bangpa
//
//  Created by 이동건 on 03/12/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class StudyGroupSetFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var segueIdentifier: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        self.navigationItem.title = "게시물 필터설정"
        self.modalPresentationStyle = .overCurrentContext
        
        print(segueIdentifier)
        
        setupBarButtons()
    }
    
    
    fileprivate func setupBarButtons() {
        if segueIdentifier == "showFilter" {
            let resetButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 68, height: 32))
            resetButton.setTitle("초기화", for: .normal)
            resetButton.setTitleColor(UIColor.darkGray, for: .normal)
            resetButton.backgroundColor = UIColor.white
            let resetBarButtonItem = UIBarButtonItem(customView: resetButton)
            self.navigationItem.rightBarButtonItem = resetBarButtonItem
        }
    }
    
    @objc func handleSetting() {
        print("Setting")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 175
        case 2:
            return 125
        case 3:
            return 300
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "studyRegionCell", for: indexPath) as? StudyRegionTableViewCell else { return UITableViewCell()}
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "studyDayCell", for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "studyNumberCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memberJobCell", for: indexPath)
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil}
            return UIColor(cgColor: color)
        }
    }
}
