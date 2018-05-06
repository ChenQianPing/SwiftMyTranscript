//
//  AlertHelper.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/20.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit

class AlertHelper {
    static func showAlert(_ meg:String,btn1:String,btn2:String?,handler:((UIAlertAction) -> Void)?) {
        guard let vc = getCurrentVC() else { return }
        DispatchQueue.main.async(execute: { () -> Void in
            let alertController = UIAlertController(title:"提示",
                message:meg ,
                preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:btn1, style: .cancel, handler:nil)
            
            alertController.addAction(cancelAction)
            
            if btn2 != nil{
                let settingsAction = UIAlertAction(title: btn2, style: .default, handler: { (action) -> Void in
                    handler?(action)
                })
                alertController.addAction(settingsAction)
            }
            vc.present(alertController, animated: true, completion: nil)
        })
    }
    
    static func showAlert(_ meg:String){
        showAlert(meg, btn1: "确定", btn2: nil, handler: nil)
    }

}


// MARK: -得到当前正在显示的vc
func getCurrentVC()->UIViewController? {
    var result:UIViewController?
    var window = UIApplication.shared.keyWindow
    if window?.windowLevel != UIWindowLevelNormal {
        let windows = UIApplication.shared.windows
        for tmpWin in windows {
            if tmpWin.windowLevel == UIWindowLevelNormal {
                window = tmpWin
                break
            }
        }
    }
    
    let fromView = window?.subviews[0]
    if let nextRespnder = fromView?.next {
        if nextRespnder.isKind(of: UIViewController.self) {
            result = nextRespnder as? UIViewController
        } else {
            result = window?.rootViewController
        }
    }
    return result
}


/* 
 * 调用示例:
 * 1.一个按钮的
 * AlertHelper.showAlert("这是个提示")
 * 2.两个按钮的
 * AlertHelper.showAlert("两个按钮的提示", btn1: "取消", btn2: "确定") { (action) -> Void in
 *  // 确定执行的事件
 *
 *  }
 */
