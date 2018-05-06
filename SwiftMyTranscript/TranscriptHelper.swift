//
//  TranscriptHelper.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation

class TranscriptHelper {

    static func createLineChartView(text:String,xAxisData:String,yAxisDataFirst:String,yAxisDataSecond:String,yAxisDataThird:String) ->String {
        let lineChart_str =
        "<!DOCTYPE html> \n" +
        "<html lang='en'> \n" +
        
        "<head> \n" +
        "<meta charset='utf-8' /> \n" +
        "<title>标准折线图</title> \n" +
        "<script src='\(ECHARTS_URL)'></script> \n" +
        "<style> \n" +
        ".box { \n" +
        "width: 90%; \n" +
        "height: 85%; \n" +
        "position: absolute; \n" +
        "margin: 0 auto; \n" +
        "left:5px; \n" +
        "} \n" +
        "</style> \n" +
        "</head> \n" +
        
        "<body> \n" +
        "<div class='box' id='chart' style='border: 1px solid #ccc; padding: 10px;'> \n " +
        "</div> \n" +
        
        "<script type='text/javascript' language='javascript'> \n" +
        "require.config({ \n" +
        "paths: { \n" +
        "echarts: '\(ECHARTS_URL_PATHS)' \n" +
        "} \n" +
        "}); \n" +
        
        "require( \n" +
        "[ \n" +
        "'echarts', \n" +
        "'echarts/chart/line' \n" +
        "], \n" +
        "DrawEChart \n" +
        "); \n" +
        "function DrawEChart(ec) { \n" +
            "var chartContainer = document.getElementById('chart'); \n" +
            "var myChart = ec.init(chartContainer); \n" +
            "myChart.setOption({ \n" +
                "title: { \n" +
                    "text: '\(text)' \n" +
                "}, \n" +
                "grid : { \n" +
                   "width: '100%',\n" +
                   "x : 5 \n" +
                   "}, \n" +
                "tooltip: { \n" +
                    "trigger: 'axis' \n" +
                "}, \n" +
                "legend: { \n" +
                    "data: ['得分', '班级平均分', '年级平均分'] \n" +
                "}, \n" +
                "toolbox: { \n" +
                    "show: true, \n" +
                    "feature: { \n" +
                        "restore: { show: true } \n" +
                    "} \n" +
                "}, \n" +
                "calculable: true, \n" +
                
                "xAxis: [ \n" +
                "{ \n" +
                "type: 'category', \n" +
                "data: [\(xAxisData)], \n" +
                "name: '试题' \n" +
                "} \n" +
                "], \n" +
                
                "yAxis: [ \n" +
                "{ \n" +
                "type: 'value', \n" +
                "boundaryGap: [0, 0.2], \n" +
                "name: '数值' \n" +
                "} \n" +
                "], \n" +
                "series: [ \n" +
                "{ \n" +
                "name: '得分', \n" +
                "type: 'line', \n" +
                "data: [\(yAxisDataFirst)] \n" +
                "}, \n" +
            
                "{ \n" +
                "name: '班级平均分', \n" +
                "type: 'line', \n" +
                "data: [\(yAxisDataSecond)] \n" +
                "}, \n" +
            
                "{ \n" +
                "name: '年级平均分', \n" +
                "type: 'line', \n" +
                "data: [\(yAxisDataThird)] \n" +
                "} \n" +
                
                "] \n" +
                "} \n" +
            "); \n" +
            
            "window.onresize = myChart.resize; \n" +
        "} \n" +
        "</script> \n" +
        
        "</body> \n" +
        
        "</html> "
        
        return lineChart_str
    }
    
    
    static func createBarChartView(text:String,xAxis:String,seriesFirst:String,seriesSecond:String) ->String {
        let barChart_str =
        "<!DOCTYPE html> \n" +
        "<html lang='en'> \n" +
        
        "<head> \n" +
        "<meta charset='utf-8' /> \n" +
        "<title>标准柱状图</title> \n" +
        "<script src='\(ECHARTS_URL)'></script> \n" +
        "<style> \n" +
        ".box { \n" +
        "width: 90%; \n" +
        "height: 85%; \n" +
        "position: absolute; \n" +
        "margin: 0 auto; \n" +
        "left:5px; \n" +            
        "} \n" +
        "</style> \n" +
        "</head> \n" +
        
        "<body> \n" +
        "<div class='box' id='chart' style='border: 1px solid #ccc; padding: 10px;'> \n " +
        "</div> \n" +
        
        "<script type='text/javascript' language='javascript'> \n" +
        "require.config({ \n" +
        "paths: { \n" +
        "echarts: '\(ECHARTS_URL_PATHS)' \n" +
        "} \n" +
        "}); \n" +
        
        "require( \n" +
        "[ \n" +
        "'echarts', \n" +
        "'echarts/chart/bar' \n" +
        "], \n" +
        "DrawEChart \n" +
        "); \n" +
            
        "function DrawEChart(ec) { \n" +
        "var chartContainer = document.getElementById('chart'); \n" +
        "var myChart = ec.init(chartContainer); \n" +
        "myChart.setOption({ \n" +
            "title : { \n" +
                "text: '\(text)', \n" +
            "}, \n" +
            "grid : { \n" +
            "width: '100%',\n" +
            "x : 5 \n" +
            "}, \n" +
            "tooltip : { \n" +
                "trigger: 'axis', \n" +
                "axisPointer: { \n" +
                    "trigger: 'item', \n" +
                    "type: 'shadow' \n" +
                "}, \n" +
                "formatter: function (params) { \n" +
                    "var res = '<div>'; \n" +
                    "res += '<strong>' + params[0].name + '：</strong>' \n" +
                    "for (var i = 0, l = params.length; i < l; i++) { \n" +
                        "if (params[i].value != 0) { \n" +
                            "res += '<br/>' + params[i].seriesName + ' : ' + params[i].value + '%'; \n" +
                        "} \n" +
                    "} \n" +
                    "res += '</div>'; \n" +
                    "return res; \n" +
                "} \n" +
                
            "}, \n" +
            "legend: { \n" +
                "data: ['正偏离', '负偏离'] \n" +
            "}, \n" +
            "toolbox: { \n" +
                "show : true, \n" +
                "feature : { \n" +
                    "restore : {show: true} \n" +
                "} \n" +
            "}, \n" +
            "calculable : true, \n" +
            "xAxis : [ \n" +
            "{ \n" +
            "type : 'category', \n" +
            "data: [ \(xAxis) ] \n" +
            "} \n" +
            "], \n" +
            "yAxis : [ \n" +
            "{ \n" +
            "type : 'value' \n" +
            "} \n" +
            "], \n" +
            "series : [ \n" +
            "{ \n" +
            "name: '正偏离', \n" +
            "type: 'bar', \n" +
            "stack: 'sum', \n" +
            "data: [ \(seriesFirst) ] \n" +
            "}, \n" +
            "{ \n" +
            "name: '负偏离', \n" +
            "type: 'bar', \n" +
            "stack: 'sum', \n" +
            "data: [ \(seriesSecond) ] \n" +
            "} \n" +
            "] \n" +
            "} \n" +
        "); \n" +
        
        "window.onresize = myChart.resize; \n" +
    "} \n" +
    "</script> \n" +
    
    "</body> \n" +
    
    "</html> \n"
   
    return barChart_str
}

static func createPieChartView(text:String,seriesName:String,seriesData:String) ->String {
    
        let pieChart_str =
            "<!DOCTYPE html> \n" +
                "<html lang='en'> \n" +
                
                "<head> \n" +
                "<meta charset='utf-8' /> \n" +
                "<title>标准饼图</title> \n" +
                "<script src='\(ECHARTS_URL)'></script> \n" +
                "<style> \n" +
                ".box { \n" +
                "width: 90%; \n" +
                "height: 85%; \n" +
                "position: absolute; \n" +
                "margin: 0 auto; \n" +
                "} \n" +
                "</style> \n" +
                "</head> \n" +
                
                "<body> \n" +
                "<div class='box' id='chart' style='border: 1px solid #ccc; padding: 10px;'> \n " +
                "</div> \n" +
                
                "<script type='text/javascript' language='javascript'> \n" +
                "require.config({ \n" +
                "paths: { \n" +
                "echarts: '\(ECHARTS_URL_PATHS)' \n" +
                "} \n" +
                "}); \n" +
                
                "require( \n" +
                "[ \n" +
                "'echarts', \n" +
                "'echarts/chart/pie' \n" +
                "], \n" +
                "DrawEChart \n" +
                "); \n" +
                
                "function DrawEChart(ec) { \n" +
                "var chartContainer = document.getElementById('chart'); \n" +
                "var myChart = ec.init(chartContainer); \n" +
                "myChart.setOption({ \n" +
                "title: { \n" +
                "text: '\(text)' \n" +
                "}, \n" +
                "tooltip: { \n" +
                "trigger: 'item', \n" +
                "formatter: '{a} <br/>{b} : {c} ({d}%)' \n" +
                "}, \n" +
                "legend: { \n" +
                "data: [] \n" +
                "}, \n" +
                "toolbox: { \n" +
                "show: true, \n" +
                "feature: { \n" +
                "restore: { show: true } \n" +
                "} \n" +
                "}, \n" +
                "calculable: true, \n" +
                "series: [ \n" +
                "{ \n" +
                "name: [ '\(seriesName)' ], \n" +
                "type: 'pie', \n" +
                "radius: '60%', \n" +
                "data: [ \(seriesData) ] \n" +
                "} \n" +
                "] \n" +
                "} \n" +
                "); \n" +
                
                "window.onresize = myChart.resize; \n" +
                "} \n" +
                "</script> \n" +
                
                "</body> \n" +
                
        "</html> \n"
        
        return pieChart_str
        
    }
    
    static func generateHtml(_ queryType:Int,result: AnyObject?) ->String {

        let examName = NSUserDefaultsHelper().getDefault("examName") as! String
        
        var html_table_tr_td:String = ""
        
        switch queryType {
        case 101:
            let modelInfo = result as! NSArray
            if (modelInfo.count > 0) {
                
                html_table_tr_td = "<h2>\(examName)</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>成绩</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级最高分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级最高分</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                for i in 0...modelInfo.count-1 {
                    
                    let model:Student101Detail = modelInfo[i] as! Student101Detail
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
        case 102:
            let modelInfo = result as! NSArray
            if (modelInfo.count > 0) {
                
                html_table_tr_td = "<h2>\(examName)</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>得分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>贡献率%</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                for i in 0...modelInfo.count-1 {
                    
                    let model:Student102Detail = modelInfo[i] as! Student102Detail
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.precent)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
        case 103:
            let modelInfo = result as! NSArray
            if (modelInfo.count > 0) {
                
                html_table_tr_td = "<h2>\(examName)</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>成绩</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级分差</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级分差</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                for i in 0...modelInfo.count-1 {
                    
                    let model:Student103Detail = modelInfo[i] as! Student103Detail
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classDeviation)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeDeviation)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
        case 104:
            let modelInfo = result as! NSArray
            if (modelInfo.count > 0) {
                
                html_table_tr_td = "<h2>\(examName)</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                for i in 0...modelInfo.count-1 {
                    
                    let model:Student104Detail = modelInfo[i] as! Student104Detail
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>满分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.fullScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>得分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级参考人数</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.cLassCnt)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级参考人数</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeCnt)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>考试参考人数</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examCnt)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>考试平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>考试最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
        case 105:
            let modelInfo = result as! NSArray
            if (modelInfo.count > 0) {
                
                html_table_tr_td = "<h2>\(examName)</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>满分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>成绩</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级偏科幅度</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                for i in 0...modelInfo.count-1 {
                    
                    let model:Student105Detail = modelInfo[i] as! Student105Detail
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.fullScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classPrecent)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
        case 106:
            let model = result as! StudentGeneral
            
            html_table_tr_td = "<h2>\(examName)</h2> \n"
            
            if model.count1 > 0 {
                html_table_tr_td = html_table_tr_td + "<h2>1.基础成绩</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                for i in 0...model.rows1.count-1 {
                    
                    let model:StudentBasicResult = model.rows1[i]
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>科目</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.courseName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>满分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.fullScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>得分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.yourScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级标准分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classStandardScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>班级百分等级</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classPercent)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级标准分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeStandardScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>年级百分等级</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradePercent)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>统考平均分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>统考最高分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examMax)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>统考标准分</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examStandardScore)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>统考百分等级</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examPercent)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"

            }
            
            if model.count2 > 0 {
                
                html_table_tr_td = html_table_tr_td + "<h2>2.各小题分析</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>小题</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>得分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级平均分</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>掌握程度</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                for i in 0...model.rows2.count-1 {
                    
                    let model:StudentQuestions = model.rows2[i]
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.questionsName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.score)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.gradeAvg)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.mastery)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
            if model.count3 > 0 {
                
                html_table_tr_td = html_table_tr_td + "<h2>3.知识点明细</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                html_table_tr_td = html_table_tr_td + "<tr>\n"
                html_table_tr_td = html_table_tr_td + "<td>知识点</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>个人得分率</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>班级得分率</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>年级得分率</td>\n"
                html_table_tr_td = html_table_tr_td + "<td>掌握程度</td>\n"
                html_table_tr_td = html_table_tr_td + "</tr>\n"
                
                
                for i in 0...model.rows3.count-1 {
                    
                    let model:StudentKnowledge = model.rows3[i]
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.knowledgeName)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.scoreRate)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.classRate)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.examRate)</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.mastery)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }
            
            if model.count4 > 0 {
                
                html_table_tr_td = html_table_tr_td + "<h2>4.任课教师评价</h2> \n"
                html_table_tr_td = html_table_tr_td + "<table class='bordered'>\n"
                
                for i in 0...model.rows4.count-1 {
                    
                    let model:TeacherEvaluation = model.rows4[i]!
                    
                    html_table_tr_td = html_table_tr_td + "<tr>\n"
                    html_table_tr_td = html_table_tr_td + "<td>教师评价</td>\n"
                    html_table_tr_td = html_table_tr_td + "<td>\(model.content)</td>\n"
                    html_table_tr_td = html_table_tr_td + "</tr>\n"
                    
                }
                
                html_table_tr_td = html_table_tr_td + "</table>\n"
            }

        default:
            break
        }

        let html_str = HTML_HEARDER + html_table_tr_td + HTML_FOOTER
        return html_str
    }
}



