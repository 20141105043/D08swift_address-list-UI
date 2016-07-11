//
//  Delet.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/11.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit
class Delet: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var deletClickED: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //initUser()
    }
    
    @IBAction func deletByNAME(sender: AnyObject) {
        deletbyname()
        showAlertDelet()
    }
    
    @IBAction func deletByPHONE(sender: AnyObject) {
        deletbyphone()
        showAlertDelet()
    }
    
    func deletbyname(){
        let x=deletClickED.text!
        let sql = "delete from user where uname='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    
    func deletbyphone(){
        let y=deletClickED.text!
        let sql = "delete from user where mobile='\(y)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    
    func showAlertDelet() {
        var alert = UIAlertView(title:"提示",message:"删除成功！",delegate:self,cancelButtonTitle:"确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}