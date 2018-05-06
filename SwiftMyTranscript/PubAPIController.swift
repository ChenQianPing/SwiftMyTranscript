//
//  PubAPIController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation
import TTReflect

protocol PubAPIControllerDelegate {
    func didFinishPubSearch(_ queryType:Int,result: AnyObject?)
}

class PubAPIController {
    
    var delegate : PubAPIControllerDelegate?
    
    init(delegate : PubAPIControllerDelegate?) {
        self.delegate = delegate

    }
    
    // MARK: - 根据学生ID取得考试列表.110
    func getExamList(studentId:String) {
        
        let dict = ["StudentId":studentId,"QueryType":110] as [String : Any]
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in

                        let student110 = Reflect<Student110>.mapObject(json: responseObject)
                        
                        if (student110.count > 0) {

                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishPubSearch(110,result: student110.rows)
                                }
                            }
                        }
                        
            }, failure: { (error) -> Void in
                AlertHelper.showAlert("网络连接失败！建议到信号好的地方或者WiFi。")
        })
        
    }
    
    // MARK: - 根据EXAM_ID取得考试科目.111
    func getExamCourseList(examId:String) {
        
        let dict = ["ExamId":examId,"QueryType":111] as [String : Any]
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student111 = Reflect<Student111>.mapObject(json: responseObject)
                        
                        if (student111.count > 0) {
                            
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishPubSearch(111,result: student111.rows)
                                }
                            }
                        }
                        
            }, failure: { (error) -> Void in
                AlertHelper.showAlert("网络连接失败！建议到信号好的地方或者WiFi。")
        })
        
    }
    
    // MARK: - 学生登录.112
    func login(studentCode: String,userPass: String) {
        
        let dict = ["StudentCode":studentCode,"UserPass":userPass,"QueryType":112] as [String : Any]
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student112 = Reflect<Student112>.mapObject(json: responseObject)
                        
                        if (student112.count > 0) {
                            
                            var jsonResult = Dictionary<String, String>()
                            
                            for i in 0...student112.rows.count-1 {
                                
                                jsonResult["studentId"] = student112.rows[i].studentId
                                jsonResult["studentCode"] = student112.rows[i].studentCode
                                jsonResult["studentName"] = student112.rows[i].studentName
                                jsonResult["userPass"] = student112.rows[i].userPass
                                jsonResult["classId"] = student112.rows[i].classId
                                jsonResult["className"] = student112.rows[i].className
                                jsonResult["orgId"] = student112.rows[i].orgId
                                jsonResult["orgName"] = student112.rows[i].orgName
                                jsonResult["tenantId"] = student112.rows[i].tenantId
                                jsonResult["areaId"] = student112.rows[i].areaId
                                jsonResult["areaName"] = student112.rows[i].areaName
                                
                            }
                            
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishPubSearch(112,result: jsonResult)
                                }
                            }
                        }
                        
            }, failure: { (error) -> Void in
                AlertHelper.showAlert("网络连接失败！建议到信号好的地方或者WiFi。")
        })
        
    }
}
