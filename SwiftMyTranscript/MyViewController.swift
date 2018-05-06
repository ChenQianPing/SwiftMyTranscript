//
//  MyViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/19.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var infos = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userInfo = NSUserDefaultsHelper().getDefault("userInfo")
        
        let studentCode = userInfo!["studentCode"] as! String
        let studentName = userInfo!["studentName"] as! String
        let orgName = userInfo!["orgName"] as! String

        infos = [
            [
                ["icon":"menu_icons_male","name":"\(studentName) \(orgName)","indicator":false],
                ["icon":"menu_icons_account","name":"我的学号:\(studentCode)","indicator":false]
            ],
            [
                ["icon":"menu_icons_logout","name":"退出登录","indicator":true],
            ]
        ]
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
}


extension MyViewController : UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    // 返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return infos.count
    }
    
    // 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrSection = infos[section]
        return (arrSection as AnyObject).count

    }
    
    // 设置每一行单元格内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 设置单元格重用标识
        let identifier = "Reusecell"
        
        // 首先从队列中去取
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as UITableViewCell?
        
        // 如果没有从队列中获取到,那么重新创建一个
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        
        // 获取模型数据
        let arrSection = infos[indexPath.section] as! NSArray
        let dict = arrSection[indexPath.row] as! NSDictionary

        // 设置单元格内容
        cell!.imageView?.image = UIImage(named: (dict["icon"] as? String)!)
        cell!.textLabel!.text = dict["name"] as? String
        
        let indicator:Bool = dict["indicator"] as! Bool
        
        if (indicator) {
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        else {
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        
        // 返回重用单元格
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    // 表格点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.section == 0) {
            
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {                
                let view = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
                self.present(view!, animated: true, completion: nil)
            }
        }

    }
    
    // 每组的头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    // 每组的底部高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    // 返回行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    
}
