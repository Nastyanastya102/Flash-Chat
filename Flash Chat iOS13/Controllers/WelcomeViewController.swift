//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat"
//        let titleTex = "⚡️FlashChat"
//        var charIndx = 0.0
//        for char in titleTex {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndx, repeats: false) {(timer) in
//                self.titleLabel.text?.append(char)
//            }
//            
//            charIndx += 1
//        }
       
    }
    

}
