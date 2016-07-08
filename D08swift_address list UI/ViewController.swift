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
    
    @IBOutlet weak var xingming: UITextField!
   
    @IBOutlet weak var shoujihao: UITextField!

   
    @IBAction func baocun(sender: UIButton) {
        saveUser()
        showAlert()
    }
    
    func showAlert () {
        var alert = UIAlertView(title:"提示",message:"添加联系人成功",delegate:self,cancelButtonTitle:"确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    func saveUser() {
        let uname = self.xingming.text!
        let mobile = self.shoujihao.text!
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

