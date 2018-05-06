//
//  NSUserDefaultsHelper.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/20.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import Foundation

struct NSUserDefaultsHelper {
    
    func setDefault(_ key:String,value:AnyObject?) {
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        } else {
            UserDefaults.standard.set(value, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    func removeUserDefault(_ key:String?) {
        if key != nil {
            UserDefaults.standard.removeObject(forKey: key!)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getDefault(_ key:String) ->AnyObject? {
        return UserDefaults.standard.value(forKey: key) as AnyObject?
    }
    
}

