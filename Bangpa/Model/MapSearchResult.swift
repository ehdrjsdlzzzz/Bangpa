//
//  MapSearchResult.swift
//  Bangpa
//
//  Created by 이동건 on 24/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var items: [MapSearchResult]
}

struct MapSearchResult: Decodable {
    private var title: String?
    var telephone: String?
    private var mapx: String?
    private var mapy: String?
    
    var presentableTitle: String? {
        var title = self.title
        title = title?.replacingOccurrences(of: "<b>", with: "")
        title = title?.replacingOccurrences(of: "</b>", with: "")
        return title
    }
}
