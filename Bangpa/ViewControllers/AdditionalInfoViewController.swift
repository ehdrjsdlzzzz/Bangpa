//
//  AdditionalInfoViewController.swift
//  Bangpa
//
//  Created by 이동건 on 27/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit
import Alamofire

class AdditionalInfoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var placeholders: [String] = ["Email", "Username", "Kakao ID"]
    private var data: [String : String] = [:]
    
    var userInfo: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTableView()
    }
    
    func setupData() {
        guard let email = userInfo?["email"] else { return }
        guard let name = userInfo?["name"] else { return }
        
        data["email"] = email
        data["nick"] = "최성흠"
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: TextFieldCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: TextFieldCell.reusableIdentifier)
        tableView.register(UINib(nibName: ButtonCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: ButtonCell.reusableIdentifier)
    }
}

extension AdditionalInfoViewController: UITableViewDelegate {
    
}

extension AdditionalInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TextField Cell
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reusableIdentifier) as! TextFieldCell
            cell.textField.placeholder = placeholders[indexPath.row]
            return cell
        }
        // Button Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reusableIdentifier) as! ButtonCell
        cell.setupButton(title: "완료")
        cell.buttonDidTapped = { (button) in
            guard let url = URL(string: "http://192.168.0.89:8002/v1/auth/join") else { return }
            self.data["job"] = "Student"
            self.data["provider"] = "naver"
            self.data["password"] = "123123"
            self.data["snsId"] = "manu06244"
            
            
            
            Alamofire.request(url, method: .post, parameters: self.data, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                
                if let error = response.error {
                    print("Error \(error.localizedDescription)")
                    return
                }
                
            })
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 50 : 40
    }
}
