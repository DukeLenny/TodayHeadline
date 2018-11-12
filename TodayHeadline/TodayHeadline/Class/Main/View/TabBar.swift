//
//  TabBar.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/12.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    private lazy var publishButton: UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.setImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publishButton.setImage(UIImage(named: "feed_publish_press_44x44_"), for: .highlighted)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = bounds.width
        let height = tabBarHeight()
        
        publishButton.center = CGPoint(x: width / 2.0, y: height / 2.0 - 7.0)
        
        let buttonWidth = width / 5.0
        var index = 0
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) { continue }
            
            let buttonX = CGFloat(index > 1 ? index + 1 : index) * buttonWidth
            button.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: height)
            
            index += 1
        }
    }
    
}
