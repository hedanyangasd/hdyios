//
//  ViewController.swift
//  Thread
//
//  Created by 509 on 2018/12/13.
//  Copyright © 2018年 hdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func caculate(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            for i in 1...9999999{
                sum += i
            }
        }
        DispatchQueue.main.async {
            self.test.text = "sum:\(sum)"
        }
    }
    
}

