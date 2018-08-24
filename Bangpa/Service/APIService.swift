//
//  APIService.swift
//  Bangpa
//
//  Created by 이동건 on 24/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    static let shard = APIService()
    private init() {}
    
    func fetchResult(from text: String, completion: @escaping ([MapSearchResult])->()) {
        let rawURL = "https://openapi.naver.com/v1/search/local.json?query=\(text)"
        if let encoded  = rawURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let encodedURL = URL(string: encoded){
            let headers: [String:String] = [
                "X-Naver-Client-Id" : "A9L2FC3umEXG5OKmJJNA",
                "X-Naver-Client-Secret": "IBJVrbXylh"
            ]
            DispatchQueue.global().async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                Alamofire.request(encodedURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                    guard let result = response.data else { return }
                    do {
                        let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: result)
                        let result = decodedResponse.items
                        DispatchQueue.main.async {
                            completion(result)
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    }catch let err {
                        print(err.localizedDescription)
                    }
                }
            }
            
        }
    }
}
