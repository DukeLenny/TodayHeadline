//
//  MineViewController.swift
//  TodayHeadline
//
//  Created by LiDinggui on 2018/11/8.
//  Copyright © 2018年 LiDinggui. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
    
    private lazy var sections: [[MineCellModel]] = [[MineCellModel]]()
    private lazy var concerns: [MineConcernModel] = [MineConcernModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        requestData()
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
//        tableView.register(UINib(nibName: String(describing: MineNormalTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineNormalTableViewCell.self))
        tableView.registerCell(MineNormalTableViewCell.self)
//        tableView.register(UINib(nibName: String(describing: MineConcernTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineConcernTableViewCell.self))
        tableView.registerCell(MineConcernTableViewCell.self)
    }
}

// MARK: - 网络请求
extension MineViewController {
    private func requestData() {
        NetworkTool.requestMineCellData { (sections) in
            if !self.sections.isEmpty { self.sections.removeAll() }
            var model0 = MineCellModel()
            model0.text = "我的关注"
            var models = [MineCellModel]()
            models.append(model0)
            self.sections.append(models)
            self.sections += sections
            
            self.tableView.reloadData()
            
            self.requestMyConcernData()
        }
    }
    
    private func requestMyConcernData() {
        NetworkTool.requestMyConcernData { (concerns) in
            if !self.concerns.isEmpty { self.concerns.removeAll() }
            self.concerns += concerns
            
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }
}

// MARK: - UITableViewDataSource
extension MineViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // section == 1表示消息通知
        return section == 1 ? CGFloat.leastNormalMagnitude : 10.0
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
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            // 我的关注
            return concerns.count <= 1 ? 44.0 : 44.0 + 74.0
        }
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        let model = sections[indexPath.section][indexPath.row]
//        cell.textLabel?.text = model.text
//        return cell
        let model = sections[indexPath.section][indexPath.row]
        if indexPath.section == 0 && indexPath.row == 0 {
            // 我的关注
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MineConcernTableViewCell
            cell.model = model
            cell.concerns = concerns
            return cell
        }
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as MineNormalTableViewCell
        cell.model = model
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
