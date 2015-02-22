//
//  ViewController.swift
//  EmojiChat
//
//  Created by Eric Kim on 2/22/15.
//  Copyright (c) 2015 Eric Kim. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadpage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.animateWithDuration(3, animations: {
            self.loadpage.alpha = 0
            }, completion: { finished in
                self.loadpage.hidden = true
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}