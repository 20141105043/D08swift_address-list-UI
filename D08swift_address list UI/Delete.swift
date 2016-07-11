//
//  Delete.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/8.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit

class Find: UIViewController {
    
    var db:SQLiteDB!
    
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