//
//  BTCTTopNewsTableViewController.swift
//  Bittracker
//
//  Created by Seiji Takahashi on 2015/06/30.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftTask

class BTCTTopNewsTableViewController: UITableViewController {
    
    var topNewsDict = [NSDictionary]()
    var topNews = [News]()
    let sectionNum = 1
    var cellNum : Int = 0
    let urlString = "https://btct-news-api.herokuapp.com/api/v1/news/jp"
    typealias Progress = (bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
    typealias AlamoFireTask = Task<Progress, String, NSError>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.tableView.respondsToSelector("separatorInset") {
            self.tableView.separatorInset = UIEdgeInsetsZero;
        }
        
        if self.tableView.respondsToSelector("layoutMargins") {
            self.tableView.layoutMargins = UIEdgeInsetsZero;
        }
        
        let task = AlamoFireTask { progress, fulfill, reject, configure in
            Alamofire.request(.GET, urlString, parameters: nil)
                .responseJSON { _, _, raw_json, _ in
                    let json = JSON(raw_json!)
                    for (index: String, feed: JSON) in json["response"] {
                        var news = News()
                        news.title      = feed["title"].stringValue
                        news.url        = feed["url"].stringValue
                        news.origin     = feed["origin"].stringValue
                        news.image_uri  = feed["image_uri"].stringValue
                        news.created_at = feed["created_at"].intValue
                        self.topNews.append(news)
                    }
                    self.cellNum = self.topNews.count
                    self.tableView.reloadData()
            }
        };
        
        task.success { values -> Void in
            self.cellNum = self.topNews.count
            self.tableView.reloadData()
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.sectionNum
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return self.cellNum
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BTCTTopNewsTableCell", forIndexPath: indexPath) as! BTCTTopNewsTableViewCustomCell
        // Configure the cell...
        if cell.respondsToSelector("separatorInset") {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        if cell.respondsToSelector("preservesSuperviewLayoutMargins") {
            cell.preservesSuperviewLayoutMargins = false;
        }
        
        if cell.respondsToSelector("layoutMargins") {
            cell.layoutMargins = UIEdgeInsetsZero;
        }
        
        if !(self.topNews.isEmpty) {
            cell.title.text = self.topNews[indexPath.row].title
            if let url = NSURL(string: self.topNews[indexPath.row].image_uri) {
                var err: NSError?;
                var imageData :NSData = NSData(contentsOfURL: url,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!;
                cell.iconImage.image = UIImage(data: imageData)
                cell.origin.text = self.topNews[indexPath.row].origin
                
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toBTCTNewsViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toBTCTNewsViewController") {
            var newsViewController = segue.destinationViewController as! BTCTNewsViewController
            if let selectedIndexPath = self.tableView.indexPathForSelectedRow() {
                let urlString = self.topNews[selectedIndexPath.row].url
                newsViewController.url = NSURL(string: urlString)
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
