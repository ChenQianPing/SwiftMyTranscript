//
//  PieChartViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit
// import Charts

class PieChartViewController: UIViewController {
    
    var name:String = ""
    var queryResult: AnyObject?
    
    var pieChartView = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.title = name
        
        self.createPieChartView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("切换到横屏")
    }

    func createPieChartView() {
        pieChartView = PieChartView.init(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight))
        // 可以调整大小, 位置
        pieChartView.setExtraOffsets(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0)
        self.view.addSubview(pieChartView)
        
        var yValues = [BarChartDataEntry]()
        var xValues = [String]()
        
        // 生成数据
        let modelInfo = queryResult as! NSArray
        if (modelInfo.count > 0) {
            for i in 0...modelInfo.count-1 {
                let model:Student102Detail = modelInfo[i] as! Student102Detail
                // 占比数据
                yValues.append(BarChartDataEntry.init(value: model.precent, xIndex: i))
                // 描述文字
                xValues.append(model.courseName)
            }
        }
        
        
        pieChartView.descriptionText = ""
        
        let dataSet: PieChartDataSet = PieChartDataSet.init(yVals: yValues, label: "")
        // 空隙
        dataSet.sliceSpace = 5.0
        
        var colors = [UIColor]()
        colors.append(UIColor ( red: 46 / 255.0, green: 199 / 255.0, blue: 201 / 255.0, alpha: 1.0 ))
        colors.append(UIColor ( red: 182 / 255.0, green: 162 / 255.0, blue: 222 / 255.0, alpha: 1.0 ))
        colors.append(UIColor ( red: 90 / 255.0, green: 177 / 255.0, blue: 239 / 255.0, alpha: 1.0 ))
        colors.append(UIColor ( red: 255 / 255.0, green: 185 / 255.0, blue: 128 / 255.0, alpha: 1.0 ))
        colors.append(UIColor ( red: 216 / 255.0, green: 122 / 255.0, blue: 128 / 255.0, alpha: 1.0 ))

        dataSet.colors = colors
        
        // 如果你需要指示文字在外部标注百分比, 你需要这样.
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.4
        dataSet.yValuePosition = .outsideSlice
        
        let data = PieChartData(xVals: xValues, dataSet: dataSet)
        
        let formatter = NumberFormatter.init()
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = NumberFormatter.Style.percent
        formatter.multiplier = 1.0
        formatter.percentSymbol = " %"
        
        data.setValueFormatter(formatter)
        data.setValueTextColor(UIColor.black)
        pieChartView.data = data
    }
}

   
