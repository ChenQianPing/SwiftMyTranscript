//
//  StudentAPIController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/21.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation
import TTReflect

protocol StudentAPIControllerDelegate {
    func didFinishStudentSearch(_ queryType:Int,result: AnyObject?)
}

class StudentAPIController {
    
    var delegate : StudentAPIControllerDelegate?

    init(delegate : StudentAPIControllerDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - 个人成绩单.101
    func student101(studentId: String,examId: String) {
        let dict = ["StudentId":studentId,"ExamId":examId,"QueryType":101] as [String : Any]
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student101 = Reflect<Student101>.mapObject(json: responseObject)
                        
                        if (student101.count > 0) {
                            
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishStudentSearch(101,result: student101.rows)
                                }
                            }
                            
                        }
                        
            }, failure: { (error) -> Void in
                print(error)
        })
    }
    
    
    // MARK: - 成绩组成.102
    func student102(studentId: String,examId: String) {
        
        let dict = ["StudentId":studentId,"ExamId":examId,"QueryType":102] as [String : Any]
        
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student102 = Reflect<Student102>.mapObject(json: responseObject)
                        
                        if (student102.count > 0) {
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishStudentSearch(102,result: student102.rows)
                                }
                            }
                            
                        }
                        
            }, failure: { (error) -> Void in
                print(error)
        })  
    }
    
    
    // MARK: - 学业评价.103
    func student103(studentId: String,examId: String) {
        
        let dict = ["StudentId":studentId,"ExamId":examId,"QueryType":103] as [String : Any]
        
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student103 = Reflect<Student103>.mapObject(json: responseObject)
                        
                        if (student103.count > 0) {
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishStudentSearch(103,result: student103.rows)
                                }
                            }
                            
                        }
                        
            }, failure: { (error) -> Void in
                print(error)
        })
    }
    
    
    // MARK: - 学习水平分布分析.104
    func student104(studentId: String,examId: String) {
        
        let dict = ["StudentId":studentId,"ExamId":examId,"QueryType":104] as [String : Any]
        
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student104 = Reflect<Student104>.mapObject(json: responseObject)
                        
                        if (student104.count > 0) {
                            
                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishStudentSearch(104,result: student104.rows)
                                }
                            }
                            
                        }
                        
            }, failure: { (error) -> Void in
                print(error)
        })
    }
    
    // MARK: - 偏科分析.105
    func student105(studentId: String,examId: String) {
        
        let dict = ["StudentId":studentId,"ExamId":examId,"QueryType":105] as [String : Any]
        
        NetManager.GET(API_HOST, parameters: dict as? [String : NSObject],
                       success: { (responseObject) -> Void in
                        
                        let student105 = Reflect<Student105>.mapObject(json: responseObject)
                        
                        if (student105.count > 0) {

                            if let apiDelegate = self.delegate {
                                DispatchQueue.main.async {
                                    apiDelegate.didFinishStudentSearch(105,result: student105.rows)
                                }
                            }
                            
                        }
                        
            }, failure: { (error) -> Void in
                print(error)
        })
    }
    
    
    // MARK: - 综合评价.106
    func studentGeneral(studentId: String,examCourseId: String,classId :String,orgId :String) {
        
        let dict = ["StudentId":studentId,"ExamCourseId":examCourseId,"ClassId":classId,"OrgId":orgId]
        
        NetManager.GET(API_HOST01, parameters: dict,
                       success: { (responseObject) -> Void in
                        
                        let studentGeneral = Reflect<StudentGeneral>.mapObject(json: responseObject)

                        if let apiDelegate = self.delegate {
                            DispatchQueue.main.async {
                                apiDelegate.didFinishStudentSearch(106,result: studentGeneral)
                            }
                        }
      
                            
            }, failure: { (error) -> Void in
                print(error)
        })
    }
    

    
}
