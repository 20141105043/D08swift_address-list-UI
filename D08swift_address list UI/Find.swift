//
//  Find.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/8.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit
class Find: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var disPlay: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
    }
    
    @IBAction func displayALL(sender: AnyObject) {
        displayAllUsers()
    }
    
    func displayAllUsers(){
        disPlay.text = ""
        let data = db.query("select * from user")
        for var x=0; x<data.count; x++ {
            let tuser = data[x]
            disPlay.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "\n"
        }
    }
    
    @IBAction func deletALL(sender: AnyObject) {
        let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
        showAlertDeletAll()
    }
    
    func showAlertDeletAll() {
        var alert = UIAlertView(title:"提示",message:"清空成功！",delegate:self,cancelButtonTitle:"确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}