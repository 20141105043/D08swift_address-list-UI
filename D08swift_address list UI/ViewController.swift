//
//  ViewController.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/6.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var txtUname: UITextField!
   
    @IBOutlet weak var txtMobile: UITextField!
    
    @IBAction func enterSystem(sender: AnyObject) {
        showAlertEnter()
    }
    
    @IBAction func saveUrers(sender: AnyObject) {
        saveUser()
        showAlertAdd()
    }
    
    func showAlertAdd() {
        var alert = UIAlertView(title:"提示",message:"添加联系人成功",delegate:self,cancelButtonTitle:"确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    
    func showAlertEnter() {
        var alert = UIAlertView(title:"警告",message:"本系统有损智商，请慎重！",delegate:self,cancelButtonTitle:"确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    
    func initUser() {
        let data = db.query("select * from user")
        if data.count > 0 {
            let user = data[data.count - 1]
            txtMobile.text = user["mobile"] as? String
            txtUname.text = user["uname"] as? String
        }
    }
    
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let sql = "insert into user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,unamevarchar(20),mobile varchar(20))")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

