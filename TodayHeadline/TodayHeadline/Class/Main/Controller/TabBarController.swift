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
        addChild(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
        addChild(VideoViewController(), title: "西瓜视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_")
        addChild(HuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
        addChild(MineViewController(style: .grouped), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
    }
    
    private func addChild(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        let navigationController = NavigationController(rootViewController: childController)
        childController.navigationItem.title = title
        addChild(navigationController)
    }
}
