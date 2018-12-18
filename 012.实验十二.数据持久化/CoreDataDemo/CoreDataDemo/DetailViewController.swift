//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by 509 on 2018/12/13.
//  Copyright © 2018年 2016110308. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person:Person?

    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = person?.name
        phone.text = person?.phone
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
