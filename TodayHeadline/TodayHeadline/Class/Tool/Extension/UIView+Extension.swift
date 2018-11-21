//
//  UIView+Extension.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/21.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

protocol RegisterReusableViewOrNib {
    
}

extension RegisterReusableViewOrNib {
    static var identifier: String {
        return "\(self)"
    }
    
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
