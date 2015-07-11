//
//  BTCTNewsViewController.swift
//  Bittracker
//
//  Created by Seiji Takahashi on 2015/06/30.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import UIKit

class BTCTNewsViewController: UIViewController {
    @IBOutlet weak var uiwebview: UIWebView!
    var targetURL = "http://liginc.co.jp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webURL = NSURL(string: targetURL)
        let urlRequest = NSURLRequest(URL: webURL!)
        uiwebview.loadRequest(urlRequest)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}