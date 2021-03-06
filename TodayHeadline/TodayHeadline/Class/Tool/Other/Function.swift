//
//  Function.swift
//  Weibo
//
//  Created by LiDinggui on 2017/9/29.
//  Copyright © 2017年 DAQSoft. All rights reserved.
//

import UIKit

//MARK:- 像素（pixel/设备分辨率）转点（point/逻辑分辨率）
func pt(_ px: CGFloat) -> CGFloat { return px * 1.15 / 3 * (UIScreen.main.bounds.size.width / 414) } // ≈ px * 0.383 ≈ px / 3.0

//MARK:- PS字体大小（像素）转iOS字体大小（磅值/pt）
func fontSize(_ px: CGFloat) -> CGFloat { return px / 2 / 96 * 72 } // = px * 0.375 ≈ px / 3.0

//MARK:- automaticallyAdjustsScrollViewInsets
func setAutomaticallyAdjustsScrollViewInsetsFalse(scrollView: UIScrollView, vc: UIViewController) {
//    if UIScrollView.propertyList().contains("contentInsetAdjustmentBehavior") {
//        scrollView.setValue(2, forKey: "contentInsetAdjustmentBehavior") // .never
//    } else {
//        vc.automaticallyAdjustsScrollViewInsets = false
//    }
    if #available(iOS 11.0, *) {
        scrollView.contentInsetAdjustmentBehavior = .never
    } else {
        vc.automaticallyAdjustsScrollViewInsets = false
    }
}

//MARK:- 获取导航栏的高度
func navigationBarHeight() -> CGFloat {
    let viewController = UIViewController()
    let navigationController = UINavigationController(rootViewController: viewController)
    return navigationController.navigationBar.bounds.height
}

//MARK: - 获取选项卡的高度
func tabBarHeight() -> CGFloat {
    let viewController = UIViewController()
    let tabBarController = UITabBarController()
    tabBarController.addChild(viewController)
    return tabBarController.tabBar.bounds.height
}

/// 在UserDefaults中获取是否是夜间模式
///
/// - Returns: Bool
func getIsNight() -> Bool {
    return StandardUserDefaults.bool(forKey: kIsNight)
}

/// 将是否是夜间模式存储到UserDefaults中
///
/// - Parameter isNight: 是否是夜间模式
func saveIsNight(_ isNight: Bool) {
    StandardUserDefaults.set(isNight, forKey: kIsNight)
    StandardUserDefaults.synchronize()
}


