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
    
    var tmiGeoPoint: (x: Double, y: Double) {
        let converter = GeoConverter()
        if let mapX = mapx,  let mapY = mapy, let x = Double(mapX), let y = Double(mapY) {
            let katectPoint = GeographicPoint(x: x, y: y)
            print("KATEC : \(katectPoint.x), \(katectPoint.y)")
            if let geoPoint = converter.convert(sourceType: .KATEC, destinationType: .WGS_84, geoPoint: katectPoint) {
                print("WSG_84 : \(geoPoint.x), \(geoPoint.y)")
                return (geoPoint.x, geoPoint.y)
            }
        }
        
        return (0,0)
    }
}
