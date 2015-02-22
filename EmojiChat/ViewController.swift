//
//  ViewController.swift
//  EmojiChat
//
//  Created by Eric Kim on 2/22/15.
//  Copyright (c) 2015 Eric Kim. All rights reserved.
//

import Foundation
import UIKit
import AddressBook

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!    
    var textArray: NSMutableArray! =  NSMutableArray()
    var addressBook : ABAddressBook!
    let people :[ABRecord] = []
    
    func createAddressBook() -> Bool {
        if self.addressBook != nil {
            return true
        }
        var err : Unmanaged<CFError>? = nil
        let addressBook : ABAddressBook? = ABAddressBookCreateWithOptions(nil, &err).takeRetainedValue()
        if addressBook == nil {
            println(err)
            self.addressBook = nil
            return false
        }
        self.addressBook = addressBook
        return true
    }
    
    func determineStatus() -> Bool {
        let status = ABAddressBookGetAuthorizationStatus()
        switch status {
        case .Authorized:
            return self.createAddressBook()
        case .NotDetermined:
            var ok = false
            ABAddressBookRequestAccessWithCompletion(nil) {
                (granted:Bool, err:CFError!) in
                dispatch_async(dispatch_get_main_queue()) {
                    if granted {
                        ok = self.createAddressBook()
                    }
                }
            }
        case .Restricted:
            self.addressBook = nil
            return false
        case .Denied:
            self.addressBook = nil
            return false
        }
        return false
    }
    
    var string = "8"
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createAddressBook()
        if self.determineStatus() {
            let people = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as NSArray as [ABRecord]
            for person in people {
                self.textArray.addObject(ABRecordCopyCompositeName(person).takeRetainedValue())
            }
        }
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("RowSelected", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if( segue.identifier? == "RowSelected" ){
            var chatRoomController:ChatRoom = segue.destinationViewController as ChatRoom
            
            let path:Int = self.tableView.indexPathForSelectedRow()!.row
        
            chatRoomController.nameString = self.textArray.objectAtIndex(path) as? String
        }
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}