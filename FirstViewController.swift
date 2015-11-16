//
//  FirstViewController.swift
//  tabbed to do list
//
//  Created by dev on 11/13/15.
//  Copyright © 2015 ciccio boles. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate{
    
    
    
    
    @IBOutlet var toDoListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
    }//End of viewDidLoad
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return true
//    }
    
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.None{
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow.tintColor = UIColor.blackColor()
        }
            
        else{
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
            
        }
    }
    
    
    
    
}//END**

