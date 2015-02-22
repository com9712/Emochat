//
//  ChatRoom.swift
//  EmojiChat
//
//  Created by Eric Kim on 2/22/15.
//  Copyright (c) 2015 Eric Kim. All rights reserved.
//

import UIKit

class ChatRoom: UIViewController {
    var nameString:String?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameString
        
        let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(255, 315, 100, 50)
        button.backgroundColor = UIColor(red: 0.23, green: 0.6, blue: 0.9, alpha: 1.0)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.setTitle("Send", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
}
