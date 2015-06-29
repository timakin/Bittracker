//
//  ViewController.swift
//  Bittracker
//
//  Created by 高橋 誠二 on 2015/06/14.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel();
        label.frame = CGRect(x: 30.0, y: 30.0, width: 200.0, height: 200.0);
        label.text = "Hello, Swift!";
        
        self.view.addSubview(label);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

