//
//  ViewController.swift
//  GTQRCode-IOS
//
//  Created by 谷田丰 on 15/6/1.
//  Copyright (c) 2015年 lchbl. All rights reserved.
//

import UIKit
import AVFoundation
import GTQRCode

class ViewController: UIViewController {

    let scanner = QRCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanner.scan()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

