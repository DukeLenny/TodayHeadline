//
//  MineCellModel.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/14.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import Foundation
import HandyJSON

struct MineCellModel: HandyJSON {
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
}

struct MineConcernModel: HandyJSON {
    var name: String?
    var url: String?
    var total_count: Int?
    var description: String?
    var time: String?
    var type: String?
    var icon: String?
    var userid: Int?
    var is_verify: Bool = false
    var media_id: Int?
    var tips: Bool = false
    var id: Int?
    var user_auth_info: String?
    var userAuthInfo: UserAuthInfo? {
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int?
    var auth_info: String?
}

