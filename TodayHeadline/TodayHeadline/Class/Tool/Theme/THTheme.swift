//
//  THTheme.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2019/1/14.
//  Copyright © 2019年 LiDinggui. All rights reserved.
//

import Foundation
import SwiftTheme

enum THTheme: Int {
    case day = 0
    case night = 1
    
    static var before = day
    static var current = day
    
    static func switchToTheme(_ theme: THTheme) {
        before = current
        current = theme
        
        var plistName: String!
        switch theme {
        case .day:
            plistName = "Default_Theme"
        case .night:
            plistName = "Night_Theme"
        }
        ThemeManager.setTheme(plistName: plistName, path: .mainBundle)
    }
    
    static func isNight() -> Bool {
        return current == night 
    }
}
