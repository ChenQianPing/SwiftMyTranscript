//
//  TranscriptDetailViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/19.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class TranscriptDetailViewController: UIViewController {
    
    lazy fileprivate var apiController : StudentAPIController = StudentAPIController(delegate: self)

    var name:String = ""
    let chartTitle:String = "图表"
    var queryType:Int = 0
    var queryResult: AnyObject?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor(red:0.2, green:0.38, blue:0.8, alpha:1)
        let start = UIImage(named: "start")
        let image1 = UIImage(named: "icon-exam")
        let image2 = UIImage(named: "icon-course")
        let image3 = UIImage(named: "icon-chart")
        let images:[UIImage] = [image1!,image2!,image3!]

        let menu = SphereMenu(startPoint: CGPoint(x: AppWidth/2, y: AppHeight-35), startImage: start!, submenuImages:images, tapToDismiss:true)
        menu.delegate = self
        self.view.addSubview(menu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = name
        
        // 添加观察者
        NotificationCenter.default.addObserver(self, selector:#selector(TranscriptDetailViewController.getExamId(_:)), name: NSNotification.Name(rawValue: "examDidChanged"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(TranscriptDetailViewController.getExamCourseId(_:)), name: NSNotification.Name(rawValue: "examCourseDidChanged"), object: nil)

        getStudentReport()
        
    }
    
    deinit {
        // 记得移除通知监听
        // 如果不需要的话,记得把相应的通知注册给取消,避免内存浪费或崩溃
        NotificationCenter.default.removeObserver(self)
    }
    
    func getExamId(_ notification:Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let examId = userInfo["examId"] as! String
        let examName = userInfo["examName"] as! String

        print("\(name) 获取到通知,用户数据是［\(examId),\(examName)］")
        NSUserDefaultsHelper().setDefault("examId", value: examId)
        NSUserDefaultsHelper().setDefault("examName", value: examName)
        
        getStudentReport()
        
    }

    func getExamCourseId(_ notification:Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let examCourseId = userInfo["examCourseId"] as! String
        let courseName = userInfo["courseName"] as! String
        
        print("\(name) 获取到通知,用户数据是［\(examCourseId),\(courseName)］")
        NSUserDefaultsHelper().setDefault("examCourseId", value: examCourseId)
        
        getStudentReport()        
    }
    
    func getStudentReport() {
        
        let studentId = NSUserDefaultsHelper().getDefault("userInfo")!["studentId"] as! String
        let classId = NSUserDefaultsHelper().getDefault("userInfo")!["classId"] as! String
        let orgId = NSUserDefaultsHelper().getDefault("userInfo")!["orgId"] as! String
        
        let examId:String = NSUserDefaultsHelper().getDefault("examId") as! String
        let examCourseId:String = NSUserDefaultsHelper().getDefault("examCourseId") as! String

        switch queryType {
        case 101:
            self.apiController.student101(studentId: studentId, examId: examId)
        case 102:
            self.apiController.student102(studentId: studentId, examId: examId)
        case 103:
            self.apiController.student103(studentId: studentId, examId: examId)
        case 104:
            self.apiController.student104(studentId: studentId, examId: examId)
        case 105:
            self.apiController.student105(studentId: studentId, examId: examId)
        case 106:
            self.apiController.studentGeneral(studentId: studentId, examCourseId: examCourseId, classId: classId, orgId: orgId)
        default:
            break
        }
    }
}

extension TranscriptDetailViewController : StudentAPIControllerDelegate {
    func didFinishStudentSearch(_ queryType:Int,result: AnyObject?) {
        
        queryResult = result
        
        let html_str = TranscriptHelper.generateHtml(queryType, result: result)
        self.webView.scalesPageToFit = false
        self.webView.loadHTMLString(html_str, baseURL: nil)
    }
}

extension TranscriptDetailViewController : SphereMenuDelegate {
    func sphereDidSelected(_ index: Int) {
        switch index {
        case 0:
            let viewController:PopView = PopView()
            viewController.popType = 0
            viewController.lblTitle = "考试名称"
            viewController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.present(viewController, animated: true, completion: nil)
        case 1:
            let viewController = PopView()
            viewController.popType = 1
            viewController.lblTitle = "考试科目"
            viewController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.present(viewController, animated: true, completion: nil)
        case 2:

            switch queryType {
            case 101:
                let view:BarChartViewController = BarChartViewController()
                view.name = chartTitle
                view.queryResult = queryResult
                self.navigationController?.pushViewController(view, animated: true)
            case 102:
                let view:ChartViewController = ChartViewController()
                view.name = chartTitle
                view.queryType = 102
                view.queryResult = queryResult
                self.navigationController?.pushViewController(view, animated: true)
            case 103:
                break
            case 104:
                break
            case 105:
                let view:ChartViewController = ChartViewController()
                view.name = chartTitle
                view.queryType = 105
                view.queryResult = queryResult
                self.navigationController?.pushViewController(view, animated: true)
            case 106:
                let view:ChartViewController = ChartViewController()
                view.name = chartTitle
                view.queryType = 106
                view.queryResult = queryResult
                self.navigationController?.pushViewController(view, animated: true)
            default:
                break
            }
            
            
            
        default:
            break
        }
    }
}





