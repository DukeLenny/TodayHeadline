//
//  MyNotLoginTableHeaderView.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/23.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgImageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: kBgImageViewHeight)
        
        phoneButton.theme_setImage("images.cellphoneicon_login_profile", forState: .normal)
        qqButton.theme_setImage("images.qqicon_login_profile", forState: .normal)
        weixinButton.theme_setImage("images.weixinicon_login_profile", forState: .normal)
        weiboButton.theme_setImage("images.sinaicon_login_profile", forState: .normal)
        collectionButton.theme_setImage("images.favoriteicon_profile", forState: .normal)
        historyButton.theme_setImage("images.history_profile", forState: .normal)
        nightButton.theme_setImage("images.nighticon_profile", forState: .normal)
        
        nightButton.setTitle("日间", for: .selected)
        nightButton.isSelected = getIsNight()
    }
    
    @objc @IBAction private func collectionButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func historyButtonClicked(_ sender: UIButton) {
        
    }
    
    @objc @IBAction private func nightButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        THTheme.switchToNight(sender.isSelected)
        
        saveIsNight(sender.isSelected)
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
