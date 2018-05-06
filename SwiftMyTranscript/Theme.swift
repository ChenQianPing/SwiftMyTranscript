//
//  Theme.swift
//  Programming in Swift
//
//  Created by ChenQianPing on 16/5/6.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

public let NavigationH: CGFloat = 64
public let AppWidth: CGFloat = UIScreen.main.bounds.size.width
public let AppHeight: CGFloat = UIScreen.main.bounds.size.height
public let ScreenSize = UIScreen.main.bounds.size

struct Theme {
    
    // APP导航条titleFont文字大小
    static let NavTitleFont: UIFont = UIFont.systemFont(ofSize: 18)
    // APP导航条barButtonItem文字大小
    static let NavItemFont: UIFont = UIFont.systemFont(ofSize: 16)
    
    // 导航栏颜色
    static let NavColor:UIColor = UIColor(red: 54 / 255.0, green: 127 / 255.0, blue: 222 / 255.0, alpha: 1)
    // 按钮正常颜色
    static let ButtonColor: UIColor = UIColor.colorWith(255, green: 92, blue: 93, alpha: 1)
    // ViewController的背景颜色
    static let BackgroundColor: UIColor = UIColor.colorWith(253, green: 234, blue: 218, alpha: 1)
    // 正常字体颜色
    static let TextColor:UIColor = UIColor.colorWith(51, green: 51, blue: 51, alpha: 1)
    
    // webView的背景颜色
    static let WebViewBacagroundColor: UIColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
    
    // 边框颜色
    static let BorderColor:UIColor = UIColor.colorWith(227, green: 227, blue: 227, alpha: 1)
    // 边框宽度
    static let BorderWidth:CGFloat = 0.5
    
    // 深灰色
    static let TextGrayColorDeep:UIColor = UIColor.colorWith(102, green: 102, blue: 102, alpha: 1)
    // 浅灰色
    static let TextGrayColor:UIColor = UIColor.colorWith(153, green: 153, blue: 153, alpha: 1)
}

// UIColor的扩展
extension UIColor {
    class func colorWith(_ red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
}
