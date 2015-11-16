//
//  SecondViewController.swift
//  tabbed to do list
//
//  Created by dev on 11/13/15.
//  Copyright © 2015 ciccio boles. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        toDoList.append(item.text!)
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.item.delegate = self
        
    
    }//End viewDidLoad

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        item.resignFirstResponder()
        return  true
    }
    
    
    
        

}//END**

