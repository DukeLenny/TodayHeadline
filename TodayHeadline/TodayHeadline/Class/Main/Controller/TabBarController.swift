//
//  TabBarController.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/8.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        addChildControllers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(nightThemeUpdate), name: NSNotification.Name(rawValue: NightThemeUpdateNotification), object: nil)
    }
    
    @objc private func nightThemeUpdate(notification: NSNotification) {
        let isNight = notification.object as! Bool
        if isNight {
            // FIXME
        } else {
            
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

// MARK: - SetUI
extension TabBarController {
    private func setUI() {
        UITabBar.appearance().tintColor = UIColor.rgb(245.0, 90.0, 93.0)
        
        setValue(TabBar(), forKey: "tabBar")
    }
}

// MARK: - 添加子视图控制器
extension TabBarController {
    private func addChildControllers() {
        addChild(HomeViewController(), title: "首页", imageName: "home")
        addChild(VideoViewController(), title: "西瓜视频", imageName: "video")
        addChild(HuoshanViewController(), title: "小视频", imageName: "huoshan")
        addChild(MineViewController(style: .grouped), title: "未登录", imageName: "no_login")
    }
    
    private func addChild(_ childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.title = title
//        childController.tabBarItem.image = UIImage(named: imageName)
//        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        self.setChild(childController, imageName: imageName)
        let navigationController = NavigationController(rootViewController: childController)
        childController.navigationItem.title = title
        addChild(navigationController)
    }
    
    private func setChild(_ childController: UIViewController, imageName: String) {
        let wholeImageName = self.wholeImageName(imageName, isSelected: false)
        let wholeSelectedImageName = self.wholeImageName(imageName, isSelected: true)
        childController.tabBarItem.image = UIImage(named: wholeImageName)
        childController.tabBarItem.selectedImage = UIImage(named: wholeSelectedImageName)
    }
    
    private func wholeImageName(_ imageName: String, isSelected: Bool) -> String {
        var wholeImageName = imageName + "_tabbar_"
        if isSelected {
            wholeImageName += "press_"
        }
        if getIsNight() {
            wholeImageName += "night_"
        }
        wholeImageName += "32x32_"
        return wholeImageName
    }
}
