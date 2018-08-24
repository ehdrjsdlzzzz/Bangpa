//
//  SearchStudyGroupViewController.swift
//  Bangpa
//
//  Created by 이동건 on 31/07/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class SearchStudyGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let postCellIdentifier = "postCell"
    
//    var post: RecruitPost = RecruitPost(title: "iOS(스위프트) 스터디 모집합니다.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])

        // Do any additional setup after loading the view.
        
        setUpNavigationBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecruitPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.postCellIdentifier, for: indexPath) as! RecruitPostTableViewCell
        
        return cell
    }
    
    func setUpNavigationBar() {
        
        self.navigationItem.title = nil
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
    }
    
}
