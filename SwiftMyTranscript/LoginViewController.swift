//
//  LoginViewController.swift
//  SwiftMyTranscript
//
//  Created by ChenQianPing on 16/7/19.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

import UIKit


class LoginViewController : UIViewController {
    
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var uPwd: UITextField!
    
    lazy fileprivate var apiController : PubAPIController = PubAPIController(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBt(_ sender: UIButton) {
        if !uName.text!.isEmpty && !uPwd.text!.isEmpty {
            apiController.login(studentCode: uName.text!, userPass: uPwd.text!)
        } else {
            AlertHelper.showAlert("账号或者密码不能为空")
        }

    }
}

extension LoginViewController : PubAPIControllerDelegate {
    func didFinishPubSearch(_ queryType:Int,result: AnyObject?) {
        
        let studentId: String = result!["studentId"] as! String
        
        if !(studentId.isEmpty) {
            NSUserDefaultsHelper().setDefault("userInfo", value: result)
            self.performSegue(withIdentifier: "login2main", sender: self)
        } else {
            AlertHelper.showAlert("账号或者密码错误")
        }
    }
}
