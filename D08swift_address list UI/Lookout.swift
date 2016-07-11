//
//  Lookout.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/11.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit
class Lookout: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var inputMessage: UITextField!
    
    @IBOutlet weak var displayMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    @IBAction func lookoutByNAME(sender: AnyObject) {
        lookoutByName()
    }
    
    func lookoutByName() {
        displayMessage.text=""
        let x=inputMessage.text!
        let data = db.query("select * from user where uname='\(x)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
            displayMessage.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
        
    }
    
    @IBAction func lookoutByPHONE(sender: AnyObject) {
        lookoutByPhone()
    }
    
    func lookoutByPhone() {
        displayMessage.text=""
        let x=inputMessage.text!
        let data = db.query("select * from user where mobile='\(x)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
           displayMessage.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
        
    }
    
    func deletbyphone() {
        let y=inputMessage.text!
        let sql = "select from user where mobile='\(y)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}