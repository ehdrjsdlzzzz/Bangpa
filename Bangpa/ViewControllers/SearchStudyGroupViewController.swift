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

    @IBOutlet weak var bookMarkFilterButton: UIButton!
    
    let postCellIdentifier = "postCell"
    
    var recruitPosts: [RecruitPost] = [
        RecruitPost(postTitle: "첫번째포스트입니다", postWriter: "이형락"),
        RecruitPost(postTitle: "두번째포스트입니다", postWriter: "이동건"),
        RecruitPost(postTitle: "세번째포스트입니다", postWriter: "장순호"),
        RecruitPost(postTitle: "네번째포스트입니다", postWriter: "최성흠"),
        RecruitPost(postTitle: "마지막포스트입니다", postWriter: "우승민"),
        RecruitPost(postTitle: "첫번째포스트입니다", postWriter: "이형락"),
        RecruitPost(postTitle: "두번째포스트입니다", postWriter: "이동건"),
        RecruitPost(postTitle: "세번째포스트입니다", postWriter: "장순호"),
        RecruitPost(postTitle: "네번째포스트입니다", postWriter: "최성흠"),
        RecruitPost(postTitle: "마지막포스트입니다", postWriter: "우승민")
    ]
    
    var isCheckedBookMarkFilterButton = false
    
    @objc func bookMarkFilterButtonTapped() {
        isCheckedBookMarkFilterButton = !isCheckedBookMarkFilterButton
        
        if isCheckedBookMarkFilterButton {
            bookMarkFilterButton.setImage(#imageLiteral(resourceName: "SelectedBookmark"), for: .normal)
        } else {
            bookMarkFilterButton.setImage(#imageLiteral(resourceName: "Bookmark"), for: .normal)
        }
        
        self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    func setUpViews() {
        bookMarkFilterButton.addTarget(self, action: #selector(bookMarkFilterButtonTapped), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.layer.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dummyPostGenerate()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
        
        setUpNavigationBar()
        setUpViews()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recruitPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecruitPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.postCellIdentifier, for: indexPath) as! RecruitPostTableViewCell
        
        cell.postTitleLabel.text = recruitPosts[indexPath.row].postTitle
        cell.postWriterLabel.text = recruitPosts[indexPath.row].postWriter
        
        if isCheckedBookMarkFilterButton {
            if cell.isCheckedBookMark {
                cell.isHidden = false
            } else {
                cell.isHidden = true
            }
        } else {
            cell.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func setUpNavigationBar() {
        
        self.navigationItem.title = nil

        let searchBarWrapper = SearchBarContainerView(customSearchBar: UISearchBar())
        searchBarWrapper.frame = CGRect(x: 0, y: 0, width: 294, height: 32)
        self.navigationItem.titleView = searchBarWrapper
        
        let navigationLoginButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationLoginButton.setBackgroundImage(UIImage(named: "Write"), for: .normal)
//
        navigationLoginButton.addTarget(self, action: #selector(touchUpLoginButton), for: .touchUpInside)
//
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationLoginButton)
        
    }
    
    @objc func touchUpLoginButton() {
//        코드로 스토리보드에 있는 뷰컨트롤러 띄우기
        let storyBoard: UIStoryboard = UIStoryboard(name: "SearchStudyGroupViewController", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SearchStudyGroupWritePostViewController") as! SearchStudyGroupWritePostViewController
        viewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(viewController, animated: true)
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
    }
    
    
    class SearchBarContainerView: UIView {
        let searchBar: UISearchBar
        init(customSearchBar: UISearchBar) {
            searchBar = customSearchBar
            super.init(frame: CGRect.zero)
            searchBar.layer.cornerRadius = 18
            searchBar.clipsToBounds = true
            addSubview(searchBar)
        }
        
        override convenience init(frame: CGRect) {
            self.init(customSearchBar: UISearchBar())
            self.frame = frame
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            searchBar.frame = bounds

        }
    }
    
    func dummyPostGenerate() {
        for _ in 0...10 {
            let dummyTitle = String(arc4random())
            let dummyContent = String(arc4random())
            recruitPosts.append(RecruitPost(postTitle: dummyTitle, postWriter: dummyContent))
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showFilter" {
            let vc = segue.destination as! StudyGroupSetFilterViewController
            vc.hidesBottomBarWhenPushed = true
            vc.segueIdentifier = "showFilter"
        } else {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let vc = segue.destination as! SearchStudyGroupPostViewController
            vc.recruitPost = recruitPosts[indexPath.row]
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
        
    }
    
}
