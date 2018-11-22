//
//  NetworkTool.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/14.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import Foundation
import HandyJSON
import SwiftyJSON

private let kDeviceId: Int = 6096495334
private let kIid: Int = 5034850950

protocol NetworkToolProtocol {
    
    /// "我的"界面普通数据
    ///
    /// - Parameter completionHandler: 成功获取到数据后的回调
    static func requestMineCellData(_ completionHandler: @escaping (_ sections: [[MineCellModel]]) -> ())
    
    /// "我的"界面我的关注数据
    ///
    /// - Parameter completionHandler: 成功获取到数据后的回调
    static func requestMyConcernData(_ completionHandler: @escaping ([MineConcernModel]) -> ())
    
}

extension NetworkToolProtocol {
    static func requestMineCellData(_ completionHandler: @escaping (_ sections: [[MineCellModel]]) -> ()) {
        Network.request(urlString: UserTabsURL, parameters: ["device_id": kDeviceId]) { (value, error) in
            guard let value = value else { return }
            let json = JSON(value)
            guard json["message"] == "success" else { return }
            guard let sections = json["data"]["sections"].array else { return }
            var modelArrays = [[MineCellModel]]()
            for section in sections {
                guard let rows = section.array else { continue }
                var modelArray = [MineCellModel]()
                for row in rows {
                    guard let model = MineCellModel.deserialize(from: row.dictionaryObject) else { continue }
                    modelArray.append(model)
                }
                modelArrays.append(modelArray)
            }
            completionHandler(modelArrays)
        }
    }
    
    static func requestMyConcernData(_ completionHandler: @escaping ([MineConcernModel]) -> ()) {
        Network.request(urlString: MyFollowURL, parameters: ["device_id": kDeviceId]) { (value, error) in
            guard let value = value else { return }
            let json = JSON(value)
            guard json["message"] == "success" else { return }
            guard let data = json["data"].array else { return }
            var models = [MineConcernModel]()
            for element in data {
                let model = MineConcernModel.deserialize(from: element.dictionaryObject)
                models.append(model!)
            }
            completionHandler(models)
        }
    }
}

struct NetworkTool: NetworkToolProtocol {}
