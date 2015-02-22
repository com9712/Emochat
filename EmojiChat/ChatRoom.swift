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
    }
}
