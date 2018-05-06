//
//  RadarChartController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit
import Charts

class RadarChartController: UIViewController {
    
    var name:String = ""
    var queryResult: AnyObject?
    var radarBarChartView = RadarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.title = name
        
        self.createRadarChartView()
        
    }
    
    func createRadarChartView() {
        radarBarChartView = RadarChartView.init(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight))
        
        radarBarChartView.setExtraOffsets(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0)
        
        // 描述文字
        radarBarChartView.descriptionText = ""
        
        // 指向定点线的宽度
        radarBarChartView.webLineWidth = 2.0
        radarBarChartView.innerWebColor = UIColor.black
        radarBarChartView.innerWebLineWidth = 0.75
        radarBarChartView.webAlpha = 1.0
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(radarBarChartView)
        
        var yValues1 = [ChartDataEntry]()
        var yValues2 = [ChartDataEntry]()
        var xValues = [String]()
        
        // 生成数据
        let modelInfo = queryResult as! NSArray
        if (modelInfo.count > 0) {
            for i in 0...modelInfo.count-1 {
                let model:Student101Detail = modelInfo[i] as! Student101Detail
                
                yValues1.append(ChartDataEntry(value: (Double)(model.score), xIndex: i))
                yValues2.append(ChartDataEntry(value: (Double)(model.classAvg), xIndex: i))
                let str = model.courseName
                xValues.append(str)
            }
        }
        
        let dataSet = RadarChartDataSet.init(yVals: yValues1, label: "成绩")
        dataSet.drawFilledEnabled = true
        dataSet.setColor(UIColor ( red: 46 / 255.0, green: 199 / 255.0, blue: 201 / 255.0, alpha: 1.0 ))
        dataSet.fillColor = UIColor ( red: 46 / 255.0, green: 199 / 255.0, blue: 201 / 255.0, alpha: 1.0 )
        dataSet.lineWidth = 1.0
        
        let dataSet1 = RadarChartDataSet.init(yVals: yValues2, label: "班级平均分")
        dataSet1.drawFilledEnabled = true
        dataSet1.setColor(UIColor ( red: 182 / 255.0, green: 162 / 255.0, blue: 222 / 255.0, alpha: 1.0 ))
        dataSet1.fillColor = UIColor ( red: 182 / 255.0, green: 162 / 255.0, blue: 222 / 255.0, alpha: 1.0 )
        dataSet1.lineWidth = 1.5
        
        let data = RadarChartData.init(xVals: xValues, dataSets: [dataSet, dataSet1])
        radarBarChartView.data = data
    }

    
}
    



