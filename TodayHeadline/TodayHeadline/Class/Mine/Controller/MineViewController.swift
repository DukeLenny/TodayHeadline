//
//  MineViewController.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/8.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }

}

// MARK: - SetUI
extension MineViewController {
    private func setUI() {
        automaticallyAdjustsScrollViewInsets = false
        setTableView()
    }
    
    private func setTableView() {
        tableView.backgroundColor = GlobalBackgroundColor
//        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        if #available(iOS 11.0, *) {
            tableView.contentInset = UIEdgeInsets(top: TopBarHeight, left: 0, bottom: BottomBarHeight, right: 0)
        }
    }
}

// MARK: - UITableViewDataSource
extension MineViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10.0))
        view.backgroundColor = GlobalBackgroundColor
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.section)-\(indexPath.row)"
        return cell
    }
}
