//
//  MyNotLoginTableHeaderView.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/23.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit
import IBAnimatable

class MyNotLoginTableHeaderView: UIView {
    
    @IBOutlet weak var bgImageView: UIImageView!

    @IBOutlet private weak var collectionButton: UIButton!
    @IBOutlet private weak var historyButton: UIButton!
    @IBOutlet private weak var nightButton: UIButton!
    @IBOutlet private weak var moreLoginWaysButton: AnimatableButton!
    @IBOutlet private weak var phoneButton: UIButton!
    @IBOutlet private weak var qqButton: UIButton!
    @IBOutlet private weak var weixinButton: UIButton!
    @IBOutlet private weak var weiboButton: UIButton!
    
    class func instance() -> MyNotLoginTableHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! MyNotLoginTableHeaderView
    }
    
    @objc @IBAction private func collectionButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func historyButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func nightButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func moreLoginWaysButtonClicked(_ sender: AnimatableButton) {
        
    }
    
    @objc @IBAction private func phoneButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func qqButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func weixinButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func weiboButtonClicked(_ sender: UIButton) {
        
    }
}
