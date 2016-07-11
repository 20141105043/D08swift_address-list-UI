//
//  ContactTableViewData.swift
//  D08swift_address list UI
//
//  Created by 20141105043dj on 16/7/8.
//  Copyright © 2016年 20141105043dj. All rights reserved.
//

import Foundation
import UIKit

struct ContactItem {
    var phoneNumberStr:String = ""
    var nameStr:String = ""
}

struct ContactSectionItem {
    var indexTitleStr:String = ""
    var contactItemList:[ContactItem] = [ContactItem]()
}

class ContactTableViewData: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let contactIndexTitleList:[String] = [
        "A", "B", "C", "D", "E", "F", "G",
        "H", "I", "J", "K", "L", "M", "N",
        "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z"]
    
    var contactSectionItemList:[ContactSectionItem] = [ContactSectionItem]()
    
    func generateContactSectionList(){
        //reset
        contactSectionItemList = [ContactSectionItem]()
        
        for eachIndexTitle in contactIndexTitleList {
            var currentContactSectionItem = ContactSectionItem()
            var singleContactItem:ContactItem
            
            switch eachIndexTitle {
            case "C":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "ch"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
            case "L":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "lm"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "ljl"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
            case "M":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "mjp"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "mz"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
            case "W":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "wt"
                singleContactItem.phoneNumberStr = "11122233344"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
            case "X":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "xc"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "xjm"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
            case "Z":
                currentContactSectionItem.indexTitleStr = eachIndexTitle
                
                singleContactItem = ContactItem()
                singleContactItem.nameStr = "zbl"
                singleContactItem.phoneNumberStr = "11112222333"
                currentContactSectionItem.contactItemList.append(singleContactItem)
                contactSectionItemList.append(currentContactSectionItem)
                
            default:
                break
            }
        }
    }
    
    func updateContactData(){
        generateContactSectionList()
    }
    
    /***************************************************************************
     * UITableViewDataSource functions
     ***************************************************************************/
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("numberOfSectionsInTableView")
        print("currentContactSectionList.count=\(contactSectionItemList.count)")
        return contactSectionItemList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection section = \(section)")
        print("contactSectionItemList[section].contactItemList.count=\(contactSectionItemList[section].contactItemList.count)")
        return contactSectionItemList[section].contactItemList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //print("heightForRowAtIndexPath indexPath = \(indexPath)")
        return HeightContactTableViewCell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("cellForRowAtIndexPath indexPath = \(indexPath)")
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: StrIdContactTableViewCell)
        
        cell.backgroundColor = ColorContactTableViewCellBackground
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.accessoryView = nil;
        
        cell.detailTextLabel?.text = nil
        
        cell.textLabel?.font = FontContactTableViewCellText
        cell.textLabel?.textAlignment = NSTextAlignment.Left
        cell.textLabel?.textColor = ColorContactTableViewCellText
        
        let curContactSectionItem = contactSectionItemList[indexPath.section]
        let curContactItemInSection = curContactSectionItem.contactItemList[indexPath.row]
        cell.textLabel?.text = curContactItemInSection.nameStr
        
        let cornerHeaderImage:UIImage = drawSingleCornerHeaderImage(getFirstChar((cell.textLabel?.text)!), headerLabelFont: FontContactTableViewCellText, headerImageSize: SizeContactTableViewCellImage)
        
        cell.imageView?.image = cornerHeaderImage
        
        return cell
    }
    
    //right side: "A" ... "Z"
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        print("sectionIndexTitlesForTableView")
        print("contactIndexTitleList=\(contactIndexTitleList)")
        return contactIndexTitleList
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("titleForHeaderInSection: section=\(section)")
        print("contactSectionItemList[section].indexTitleStr=\(contactSectionItemList[section].indexTitleStr)")
        return contactSectionItemList[section].indexTitleStr
    }
    
    /***************************************************************************
     * UITableViewDelegate functions
     ***************************************************************************/
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("didSelectRowAtIndexPath indexPath = \(indexPath)")
    }
    
}