//
//  StudentModel.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/20.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation

// MARK: - 个人成绩单.101
class Student101 : NSObject {
    var message: String  = ""
    var rows = [Student101Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student101Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student101Detail : NSObject {
    var courseName: String = ""
    var fullScore:Float = 0.00
    var score:Double = 0.00
    
    var classAvg:Float = 0.00
    var classMax:Float = 0.00
    var cLassStandardScore:Float = 0.00
    var classPercent:Float = 0.00
    
    var gradeAvg:Float = 0.00
    var gradeMax:Float = 0.00
    var gradeStandardScore:Float = 0.00
    var gradePercent:Float = 0.00
    
    var examAvg:Float = 0.00
    var examMax:Float = 0.00
    var examStandardScore:Float = 0.00
    var examPercent:Float = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName",
                "fullScore": "FullScore",
                "score":"Score",
                "classAvg":"ClassAvg",
                "classMax":"ClassMax",
                "cLassStandardScore":"CLassStandardScore",
                "classPercent":"ClassPercent",
                "gradeAvg":"GradeAvg",
                "gradeMax":"GradeMax",
                "gradeStandardScore":"GradeStandardScore",
                "gradePercent":"GradePercent",
                "examAvg":"ExamAvg",
                "examMax":"ExamMax",
                "examStandardScore":"ExamStandardScore",
                "examPercent":"ExamPercent"]
    }
}

// MARK: - 成绩组成.102
class Student102 : NSObject {
    var message: String  = ""
    var rows = Array<Student102Detail>()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student102Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student102Detail : NSObject {
    var courseName: String = ""
    var score:Float = 0.00
    var precent:Double = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName", "score": "Score", "precent":"Precent"]
    }
}

// MARK: - 学业评价.103
class Student103 : NSObject {
    var message: String  = ""
    var rows = [Student103Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student103Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student103Detail : NSObject {
    var courseName: String = ""
    var fullScore:Int = 0
    var score:Float = 0.00
    
    var classAvg:Float = 0.00
    var classDeviation:Float = 0.00
    
    var gradeAvg:Float = 0.00
    var gradeDeviation:Float = 0.00
    
    var examAvg:Float = 0.00
    var examDeviation:Float = 0.00
    
    var higherClassAvg:Float = 0.00
    var lowerClassAvg:Float = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName",
                "fullScore": "FullScore",
                "score":"Score",
                "classAvg":"ClassAvg",
                "classDeviation":"ClassDeviation",
                "gradeAvg":"GradeAvg",
                "gradeDeviation":"GradeDeviation",
                "examAvg":"ExamAvg",
                "examDeviation":"ExamDeviation",
                "higherClassAvg":"HigherClassAvg",
                "lowerClassAvg":"LowerClassAvg"]
    }
}

// MARK: - 学习水平分布分析.104
class Student104 : NSObject {
    var message: String  = ""
    var rows = [Student104Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student104Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student104Detail : NSObject {
    var courseName: String = ""
    var fullScore:Int = 0
    var score:Float = 0.00
    
    var cLassCnt:Int = 0
    var classAvg:Float = 0.00
    var classMax:Float = 0.00
    
    var gradeCnt:Int = 0
    var gradeAvg:Float = 0.00
    var gradeMax:Float = 0.00
    
    var examCnt:Int = 0
    var examAvg:Float = 0.00
    var examMax:Float = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName",
                "fullScore": "FullScore",
                "score":"Score",
                "cLassCnt":"CLassCnt",
                "classAvg":"ClassAvg",
                "classMax":"ClassMax",
                "gradeCnt":"GradeCnt",
                "gradeAvg":"GradeAvg",
                "gradeMax":"GradeMax",
                "examCnt":"ExamCnt",
                "examAvg":"ExamAvg",
                "examMax":"ExamMax"]
    }
}


// MARK: - 偏科分析.105
class Student105 : NSObject {
    var message: String  = ""
    var rows = [Student105Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student105Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student105Detail : NSObject {
    var courseName: String = ""
    var fullScore:Int = 0
    var score:Float = 0.00
    
    var classAvg:Float = 0.00
    var classPrecent:Float = 0.00
    
    var gradeAvg:Float = 0.00
    var gradePrecent:Float = 0.00
    
    var examAvg:Float = 0.00
    var examPrecnt:Float = 0.00
    
    var positivePrecent:Float = 0.00
    var negativePrecent:Float = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName",
                "fullScore": "FullScore",
                "score":"Score",
                "classAvg":"ClassAvg",
                "classPrecent":"ClassPrecent",
                "gradeAvg":"GradeAvg",
                "gradePrecent":"GradePrecent",
                "examAvg":"ExamAvg",
                "examPrecnt":"ExamPrecnt",
                "positivePrecent":"PositivePrecent",
                "negativePrecent":"NegativePrecent"]
    }
}

// MARK: - 学生登录,并取得学生信息.112
class Student112 : NSObject {
    var message: String  = ""
    var rows = [Student112Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student112Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student112Detail : NSObject {
    var studentId: String = ""
    var studentCode: String = ""
    var studentName: String = ""
    var userPass: String = ""

    var classId: String = ""
    var className: String = ""
    
    var orgId: String = ""
    var orgName: String = ""
    var tenantId: String = ""
    var areaId: String = ""
    var areaName: String = ""

    func setupMappingReplaceProperty() -> [String : String] {
        return ["studentId": "StudentId",
                "studentCode": "StudentCode",
                "studentName":"StudentName",
                "userPass":"UserPass",
                "classId":"ClassId",
                "className":"ClassName",
                "orgId":"OrgId",
                "orgName":"OrgName",
                "tenantId":"TenantId",
                "areaId":"AreaId",
                "areaName":"AreaName"]
    }
}

// MARK: - 根据学生ID取得考试列表.110
class Student110 : NSObject {
    var message: String  = ""
    var rows = [Student110Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student110Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student110Detail : NSObject {
    var examId: String = ""
    var examName: String = ""
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["examId": "ExamId",
                "examName":"ExamName"]
    }
}


// MARK: - 根据EXAM_ID取得考试科目.111
class Student111 : NSObject {
    var message: String  = ""
    var rows = [Student111Detail]()
    var count: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows": Student111Detail.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message": "Message", "rows": "Rows", "count":"Count"]
    }
}

class Student111Detail : NSObject {
    var examCourseId: String = ""
    var courseId:Int = 0
    var courseName: String = ""
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["examCourseId": "ExamCourseId",
                "courseId": "CourseId",
                "courseName":"CourseName"]
    }
}

// MARK: - 综合报告 1.基础成绩 2.各小题分析 3.知识点明细 4.任课老师评价
class StudentGeneral : NSObject {
    var message1: String  = ""
    var message2: String  = ""
    var message3: String  = ""
    var message4: String  = ""
    var rows1 = [StudentBasicResult]()
    var rows2 = [StudentQuestions]()
    var rows3 = [StudentKnowledge]()
    var rows4 = [TeacherEvaluation?]()
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    var count4: Int = 0
    
    func setupMappingElementClass() -> [String : AnyClass] {
        return ["Rows1": StudentBasicResult.self,
                "Rows2": StudentQuestions.self,
                "Rows3": StudentKnowledge.self,
                "Rows4": TeacherEvaluation.self]
    }
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["message1": "Message1",
                "message2": "Message2",
                "message3": "Message3",
                "Message4": "Message4",
                "rows1": "Rows1",
                "rows2": "Rows2",
                "rows3": "Rows3",
                "rows4": "Rows4",
                "count1": "Count1",
                "count2": "Count2",
                "count3": "Count3",
                "count4":"Count4"]
    }
}

class StudentBasicResult : NSObject {
    var courseName: String = ""
    var fullScore:Int = 0
    var yourScore: Float = 0.00
    
    var classAvg: Float = 0.00
    var classMax: Float = 0.00
    var classStandardScore: Float = 0.00
    var classPercent: Float = 0.00
    
    var gradeAvg: Float = 0.00
    var gradeMax: Float = 0.00
    var gradeStandardScore: Float = 0.00
    var gradePercent: Float = 0.00
    
    var examAvg: Float = 0.00
    var examMax: Float = 0.00
    var examStandardScore: Float = 0.00
    var examPercent: Float = 0.00
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["courseName": "CourseName",
                "fullScore": "FullScore",
                "yourScore": "YourScore",
                "classAvg": "ClassAvg",
                "classMax": "ClassMax",
                "classStandardScore": "ClassStandardScore",
                "classPercent": "ClassPercent",
                "gradeAvg": "GradeAvg",
                "gradeMax": "GradeMax",
                "gradeStandardScore": "GradeStandardScore",
                "gradePercent": "GradePercent",
                "examAvg": "ExamAvg",
                "examMax": "ExamMax",
                "examStandardScore": "ExamStandardScore",
                "examPercent":"ExamPercent"]
    }
}


class StudentQuestions : NSObject {
    var itemId:Int = 0
    var questionsName:String = ""
    var difficulty: Float = 0.00
    var fullScore: Float = 0.00
    var score: Float = 0.00
    
    var classAvg: Float = 0.00
    var gradeAvg: Float = 0.00
    var examAvg: Float = 0.00
    
    var mastery: String = ""
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["itemId": "ItemId",
                "questionsName": "QuestionsName",
                "difficulty": "Difficulty",
                "fullScore": "FullScore",
                "score": "Score",
                "classAvg": "ClassAvg",
                "gradeAvg": "GradeAvg",
                "examAvg": "ExamAvg",
                "mastery":"Mastery"]
    }
}

class StudentKnowledge : NSObject {
    var knowledgeName:String = ""
    var fullScore: Float = 0.00
    var score: Float = 0.00
    
    var scoreRate: Float = 0.00
    var classRate: Float = 0.00
    var schoolRate: Float = 0.00
    var examRate: Float = 0.00
    
    var mastery: String = ""
    var questionsNumber: Int = 0
    var questionsDetail: String = ""
    
    func setupMappingReplaceProperty() -> [String : String] {
        return ["knowledgeName": "KnowledgeName",
                "fullScore": "FullScore",
                "score": "Score",
                "scoreRate": "ScoreRate",
                "classRate": "ClassRate",
                "schoolRate": "SchoolRate",
                "examRate": "ExamRate",
                "mastery": "Mastery",
                "questionsNumber": "QuestionsNumber",
                "questionsDetail":"QuestionsDetail"]
    }
}


class TeacherEvaluation : NSObject {
    var content:String = ""
    func setupMappingReplaceProperty() -> [String : String] {
        return ["content": "Content"]
    }
}

