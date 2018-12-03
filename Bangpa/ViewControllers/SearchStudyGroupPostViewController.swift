//
//  SearchStudyGroupPostViewController.swift
//  Bangpa
//
//  Created by RAK on 2018. 11. 23..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

class SearchStudyGroupPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let commentCellIdentifier = "commentCell"
    
    var recruitPost: RecruitPost?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postWriterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        settingViews()
        
        self.navigationItem.title = " "
        self.tabBarController?.tabBar.layer.isHidden = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
    func setUpNavigationBar() {
//        self.navigationItem.title = nil
        
        let navigationSettingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationSettingButton.setBackgroundImage(UIImage(named: "Setting"), for: .normal)
        //
        navigationSettingButton.addTarget(self, action: #selector(touchUpSettingButton), for: .touchUpInside)
        //
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationSettingButton)
        
    }
    
    @objc func touchUpSettingButton() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "SearchStudyGroupViewController", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SearchStudyGroupWritePostViewController") as! SearchStudyGroupWritePostViewController
        viewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(viewController, animated: true)
//        let backItem = UIBarButtonItem()
//        backItem.title = " "
//        navigationItem.backBarButtonItem = backItem
    }
    
    func settingViews() {
        titleLabel.text = recruitPost?.postTitle
        postWriterLabel.text = recruitPost?.postWriter
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentCellIdentifier, for: indexPath)
        return cell
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        self.tabBarController?.tabBar.layer.isHidden = false
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
