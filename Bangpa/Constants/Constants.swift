//
//  Constants.swift
//  Bangpa
//
//  Created by 이동건 on 27/11/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

enum BangpaNotificationName {
    case loginSuccess
    
    var value: Notification.Name {
        switch self {
        case .loginSuccess:
            return Notification.Name.init("LoginSuccess")
        }
    }
}

enum BangpaSegueType {
    case signInSuccess
    
    var identifier: String {
        switch self {
        case .signInSuccess:
            return "signInSuccess"
        }
    }
}
