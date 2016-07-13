//
//  Edit.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/13.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit
class Edit: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var eNAME: UITextField!
    
    @IBOutlet weak var eMOBILE: UITextField!
    
    @IBAction func eSAVE(sender: AnyObject) {
        saveEditUsres()
        showAlertEidt()
    }
    
    func saveEditUsres(){
        let x=eNAME.text!
        let y=eMOBILE.text!
        let sql = "update user set mobile='\(y)' where uname='\(x)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    func showAlertEidt() {
        var alert = UIAlertView(title: "提示",message: " 更改联系人成功！",delegate: self,cancelButtonTitle: "确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}