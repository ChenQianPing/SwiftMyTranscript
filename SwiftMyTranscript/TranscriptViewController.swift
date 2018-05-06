//
//  TranscriptViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/19.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class Menu : NSObject {
    
    var icon:String = ""
    var name:String = ""
    var intro:String = ""
    var queryType:Int = 0

    init(icon:String,name:String,intro:String,queryType:Int) {
        self.icon = icon
        self.name = name
        self.intro = intro
        self.queryType = queryType
    }
    
}

class TranscriptViewController : UIViewController {

    lazy fileprivate var pubAPIController : PubAPIController = PubAPIController(delegate: self)
    
    lazy fileprivate var infos = [Menu]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userInfo = NSUserDefaultsHelper().getDefault("userInfo")
        let studentId = userInfo!["studentId"] as! String
        self.pubAPIController.getExamList(studentId: studentId)
        
        let menu1:Menu = Menu(icon: "menu_icons_1_01.png", name: "个人成绩单", intro: "总分-个人成绩单", queryType: 101)
        let menu2:Menu = Menu(icon: "menu_icons_1_02.png", name: "成绩组成", intro: "个人成绩组成", queryType: 102)
        let menu3:Menu = Menu(icon: "menu_icons_1_03.png", name: "学业评价", intro: "个人学业评价", queryType: 103)
        let menu4:Menu = Menu(icon: "menu_icons_1_04.png", name: "学习水平分布分析", intro: "学习水平分布分析", queryType: 104)
        let menu5:Menu = Menu(icon: "menu_icons_1_05.png", name: "偏科分析", intro: "偏科分析", queryType: 105)
        let menu6:Menu = Menu(icon: "menu_icons_1_06.png", name: "综合报告", intro: "综合报告", queryType: 106)
        
        infos.append(menu1)
        infos.append(menu2)
        infos.append(menu3)
        infos.append(menu4)
        infos.append(menu5)
        infos.append(menu6)
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "Reusecell")

    }

}


extension TranscriptViewController : UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    
    // 返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    // 设置每一行单元格内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let menu:Menu = infos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reusecell", for: indexPath) as! MenuCell
        
        cell.icon.image = UIImage(named: menu.icon as String)
        cell.name.text = menu.name as String
        cell.intro.text = menu.intro as String
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator

        return cell
    }
    
    // MARK: - UITableViewDelegate
    // 表格点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = infos[indexPath.row].name as String
        let queryType = infos[indexPath.row].queryType as Int

        let view:TranscriptDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as! TranscriptDetailViewController
        
        view.name = name
        view.queryType = queryType
        
        self.navigationController?.pushViewController(view, animated: true)

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

extension TranscriptViewController : PubAPIControllerDelegate {
    func didFinishPubSearch(_ queryType:Int,result: AnyObject?) {
        if queryType == 110 {
            let examListInfo = result as! NSArray
            if !(examListInfo.count == 0) {
                let examInfo:Student110Detail = examListInfo[0] as! Student110Detail
                let examId:String = examInfo.examId
                let examName:String = examInfo.examName
                NSUserDefaultsHelper().setDefault("examId", value: examId)
                NSUserDefaultsHelper().setDefault("examName", value: examName)
                
                self.pubAPIController.getExamCourseList(examId: examId)
            }
        } else if queryType == 111 {
            let examCourseListInfo = result as! NSArray
            if !(examCourseListInfo.count == 0) {
                let examCoureseInfo:Student111Detail = examCourseListInfo[0] as! Student111Detail
                let examCourseId:String = examCoureseInfo.examCourseId
                NSUserDefaultsHelper().setDefault("examCourseId", value: examCourseId)
            }
        }

    }
}

