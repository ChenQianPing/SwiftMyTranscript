//
//  BarChartViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit
// import Charts

class BarChartViewController: UIViewController {
    
    var name:String = ""
    var queryResult: AnyObject?
    
    var chartView = BarChartView()
    
    // 柱状图横坐标
    var xAxis = [String]()
    // 柱状的高度值
    var seriesData = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.title = name
        
        // 生成数据
        let modelInfo = queryResult as! NSArray
        if (modelInfo.count > 0) {
            for i in 0...modelInfo.count-1 {
                let model:Student101Detail = modelInfo[i] as! Student101Detail
                xAxis.append(model.courseName)
                seriesData.append(model.score)
            }
        }

        self.createBarChartView()
        self.setChart(xAxis, values: seriesData)
    }
    
    func createBarChartView() {
        chartView = BarChartView.init(frame: CGRect(x: 0, y: 64, width: AppWidth, height: AppHeight - 64))
        chartView.setExtraOffsets(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0)
        chartView.backgroundColor = UIColor.white
        self.view.addSubview(chartView)
    }
    
    func setChart(_ dataPoints: [String], values: [Double]) {
        
        chartView.descriptionText = ""
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "成绩")
        let chartData = BarChartData(xVals: xAxis, dataSet: chartDataSet)

        chartView.data = chartData
        // 自定义颜色
        // 例子中有十二个柱状图
        // colors 是一个数组, 可以给相应的颜色
        //        chartDataSet.colors = [UIColor.blueColor(), UIColor.redColor(), UIColor.cyanColor()]
        // API 自带颜色模板
        // ChartColorTemplates.liberty()
        // ChartColorTemplates.joyful()
        // ChartColorTemplates.pastel()
        // ChartColorTemplates.colorful()
        // ChartColorTemplates.vordiplom()
        //        chartDataSet.colors = ChartColorTemplates.liberty()
        
        chartDataSet.colors = ChartColorTemplates.joyful()
        /**
         // 动画效果, 简单列举几个, 具体请看API
         case EaseInBack
         case EaseOutBack
         case EaseInOutBack
         case EaseInBounce
         case EaseOutBounce
         case EaseInOutBounce
         */
        chartView.animate(yAxisDuration: 1.0, easingOption: .easeInBounce)
    }
}
