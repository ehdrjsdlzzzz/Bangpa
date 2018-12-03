//
//  RecruitPost.swift
//  Bangpa
//
//  Created by RAK on 2018. 9. 28..
//  Copyright © 2018년 이동건. All rights reserved.
//

import Foundation

struct RecruitPost {
    var postTitle: String
    var postWriter: String
//    var numberOfPeople: Int?
    var hashTags: Array<String>?
//    var writedTime: String?
    
    init(postTitle: String, postWriter: String) {
        self.postTitle = postTitle
        self.postWriter = postWriter
    }
    
}


