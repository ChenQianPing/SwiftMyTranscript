//
//  ChartViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit


class ChartViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var name:String = ""
    var queryType:Int = 0
    var queryResult: AnyObject?

    fileprivate var chart_str:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = name
        
        
        switch queryType {
        case 101:
            break

        case 102:
            var seriesData:String = ""
            
            let modelInfo = queryResult as! NSArray
            if (modelInfo.count > 0) {
                for i in 0...modelInfo.count-1 {
                    let model:Student102Detail = modelInfo[i] as! Student102Detail
                    seriesData = seriesData + "{ value: \(model.score) ,name: '\(model.courseName)' },"
                }
            }
            
            seriesData = seriesData.substring(to: seriesData.characters.index(seriesData.endIndex, offsetBy: -1))
            
            chart_str = TranscriptHelper.createPieChartView(text: "成绩组成分析", seriesName: "成绩组成", seriesData: seriesData)
            
        case 103:
            break
        case 104:
            break
        case 105:
            
            var xAxis:String = ""
            
            var seriesFirst:String = ""
            var seriesSecond:String = ""
            
            let modelInfo = queryResult as! NSArray
            if (modelInfo.count > 0) {
                for i in 0...modelInfo.count-1 {
                    let model:Student105Detail = modelInfo[i] as! Student105Detail
                    
                    xAxis = xAxis + "'\(model.courseName)',"
                    
                    seriesFirst = seriesFirst + "'\(model.positivePrecent)',"
                    seriesSecond = seriesSecond + "'\(model.negativePrecent)',"
                }
            }
            
            xAxis = xAxis.substring(to: xAxis.characters.index(xAxis.endIndex, offsetBy: -1))
            seriesFirst = seriesFirst.substring(to: seriesFirst.characters.index(seriesFirst.endIndex, offsetBy: -1))
            seriesSecond = seriesSecond.substring(to: seriesSecond.characters.index(seriesSecond.endIndex, offsetBy: -1))

            chart_str = TranscriptHelper.createBarChartView(text: "偏科分析", xAxis: xAxis, seriesFirst: seriesFirst, seriesSecond: seriesSecond)
            
        case 106:
            
            var xAxisData:String = ""
            var yAxisDataFirst:String = ""
            var yAxisDataSecond:String = ""
            var yAxisDataThird:String = ""
            
            let modelInfo = queryResult as! StudentGeneral
            
            if modelInfo.count2 > 0 {

                for i in 0...modelInfo.rows2.count-1 {
                    
                    let model:StudentQuestions = modelInfo.rows2[i]
                    
                    xAxisData = xAxisData + "'\(model.questionsName)',"
                    
                    yAxisDataFirst = yAxisDataFirst + "'\(model.score)',"
                    yAxisDataSecond = yAxisDataSecond + "'\(model.classAvg)',"
                    yAxisDataThird = yAxisDataThird + "'\(model.gradeAvg)',"
                }
                
            }
            
            xAxisData = xAxisData.substring(to: xAxisData.characters.index(xAxisData.endIndex, offsetBy: -1))
            yAxisDataFirst = yAxisDataFirst.substring(to: yAxisDataFirst.characters.index(yAxisDataFirst.endIndex, offsetBy: -1))
            yAxisDataSecond = yAxisDataSecond.substring(to: yAxisDataSecond.characters.index(yAxisDataSecond.endIndex, offsetBy: -1))
            yAxisDataThird = yAxisDataThird.substring(to: yAxisDataThird.characters.index(yAxisDataThird.endIndex, offsetBy: -1))
            
            
            chart_str = TranscriptHelper.createLineChartView(text: "各小题分析", xAxisData: xAxisData, yAxisDataFirst: yAxisDataFirst, yAxisDataSecond: yAxisDataSecond, yAxisDataThird: yAxisDataThird)
        default:
            break
        }
        
        self.webView.scalesPageToFit = false
        self.webView.loadHTMLString(chart_str, baseURL: nil)
    }
    
    
    
}
