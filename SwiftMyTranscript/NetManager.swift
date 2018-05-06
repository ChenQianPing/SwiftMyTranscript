//
//  NetManager.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/19.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD
import Toast

struct NetManager {
    
    static let netError = "网络异常,请检查网络"
    
    static func GET(_ URLString:String, parameters:[String:NSObject]?,showHUD:Bool = true, success:((NSObject?) -> Void)?, failure:((NSError) -> Void)?) {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        
        let mainWindow = UIApplication.shared.delegate!.window!
        
        if showHUD
        {
            MBProgressHUD.showAdded(to: mainWindow, animated: true)
        }
        
        manager.get(URLString, parameters: parameters, success: {(task,
            responseObject) -> Void in
            if showHUD {
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
            }
            success?(responseObject as? NSObject)
        }) { (task,error) -> Void in
            if showHUD
            {
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
                mainWindow?.makeToast(netError)
            }
            failure?(error as NSError)
        }
    }
    
    static func POST(_ URLString:String, parameters:[String:NSObject]?,showHUD:Bool = true, success:((NSObject?) -> Void)?, failure:((NSError) -> Void)?) {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        
        let mainWindow = UIApplication.shared.delegate!.window!
        
        if showHUD
        {
            MBProgressHUD.showAdded(to: mainWindow, animated: true)
        }
        
        manager.post(URLString, parameters: parameters, success: {(task,
            responseObject) -> Void in
            if showHUD {
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
            }
            success?(responseObject as? NSObject)
        }) { (task,error) -> Void in
            if showHUD
            {
                MBProgressHUD.hideAllHUDs(for: mainWindow, animated: true)
                mainWindow?.makeToast(netError)
            }
            failure?(error as NSError)
        }
    }

}

