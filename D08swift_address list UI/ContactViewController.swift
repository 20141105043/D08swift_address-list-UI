//
//  ContactViewController.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/8.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit
class ContactViewController: UIViewController {
    var contactTableView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //update frame
        //        print("self.view.frame=\(self.view.frame)") //self.view.frame=(0.0, 0.0, 375.0, 667.0)
        self.view.frame = CGRectMake(
            self.view.frame.origin.x,
            self.view.frame.origin.y,
            UIScreen.mainScreen().bounds.width,
            UIScreen.mainScreen().bounds.height //667
                - statusBarFrame.height //20
                - HeightNaviBar //44, Note: can not use naviBarView.frame.height for naviBarView.frame is 0
                - self.tabBarController!.tabBar.frame.height) //49
        //        print("self.view.frame=\(self.view.frame)") //self.view.frame=(0.0, 0.0, 375.0, 554.0)
        
        //set to UITableViewStyle.Plain for support sectionIndexTitlesForTableView
        self.contactTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.contactTableView.delegate = gContactTableViewData
        self.contactTableView.dataSource = gContactTableViewData
        self.contactTableView.backgroundColor = ColorContactTableViewBackground
        self.contactTableView.separatorColor = ColorContactTableViewCellSeperator
        self.contactTableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0)
        self.contactTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        //improve performance
        self.contactTableView.estimatedRowHeight = HeightContactTableViewCell
        
        self.contactTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: StrIdContactTableViewCell)
        self.view.addSubview(self.contactTableView)
    }
}