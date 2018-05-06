//
//  PopView.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/22.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class PopView: UIViewController {
    
    @IBOutlet weak var popView: UIView!              // popView
    @IBOutlet weak var coverView: UIView!            // 黑色半透明遮盖层
    @IBOutlet weak var popIMgview: UIImageView!      // 弹出列表背景
    @IBOutlet weak var popTableView: UITableView!    // 弹出列表
    @IBOutlet weak var popLabel: UILabel!            // 弹出视图标题
    
    var lblTitle:String = ""
    var popType:Int = 0
    var examCourseListInfo = []
    var examListInfo = []
    
    lazy fileprivate var apiController : PubAPIController = PubAPIController(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .custom
        
        popLabel.text = lblTitle
        
        popTableView?.dataSource = self
        popTableView?.delegate = self
        
        popTableView.register(UINib(nibName: "PopTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")

        switch popType {
        case 0:
            let userInfo = NSUserDefaultsHelper().getDefault("userInfo")
            let studentId = userInfo!["studentId"] as! String
            self.apiController.getExamList(studentId: studentId)
        case 1:
            let examId:String = NSUserDefaultsHelper().getDefault("examId") as! String
            self.apiController.getExamCourseList(examId: examId)
        default:
            break
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        var nibNameOrNil = String?("PopView")
        // 考虑到xib文件可能不存在或被删,故加入判断
        if Bundle.main.path(forResource: nibNameOrNil, ofType: "xib") == nil {
            nibNameOrNil = nil
        }
        self.init(nibName: nibNameOrNil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func cancelBtnClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okBtnClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PopView : PubAPIControllerDelegate {
    
    func didFinishPubSearch(_ queryType:Int,result: AnyObject?) {
        
        switch popType {
        case 0:
            examListInfo = (result as! NSArray) as! [Any]
        case 1:
            examCourseListInfo = (result as! NSArray) as! [Any]
        default:
            break
        }
        
        popTableView.reloadData()

    }
}

extension PopView : UITableViewDataSource,UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    // 返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch popType {
        case 0:
            return examListInfo.count
        case 1:
            return examCourseListInfo.count
        default:
            return 0
        }
        
    }
    
    // 设置每一行单元格内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PopTableViewCell
        
        switch popType {
        case 0:
            let examInfo:Student110Detail = examListInfo[indexPath.row] as! Student110Detail
            cell.lblTitle.text = examInfo.examName
        case 1:
            let examCoureseInfo:Student111Detail = examCourseListInfo[indexPath.row] as! Student111Detail
            cell.lblTitle.text = examCoureseInfo.courseName
        default:
            break
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    // 表格点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch popType {
        case 0:
            let examInfo:Student110Detail = examListInfo[indexPath.row] as! Student110Detail

            // 发送通知
            NotificationCenter.default.post(name: Notification.Name(rawValue: "examDidChanged"),
                                                                      object: self, userInfo: ["examId":examInfo.examId,"examName":examInfo.examName])
            self.dismiss(animated: true, completion: nil)

        case 1:
            let examCoureseInfo:Student111Detail = examCourseListInfo[indexPath.row] as! Student111Detail
            
            // 发送通知
            NotificationCenter.default.post(name: Notification.Name(rawValue: "examCourseDidChanged"),
                                                                      object: self, userInfo: ["examCourseId":examCoureseInfo.examCourseId,"courseName":examCoureseInfo.courseName])
            self.dismiss(animated: true, completion: nil)

        default:
            break
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



