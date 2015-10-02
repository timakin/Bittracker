//
//  BTCTTopNewsViewModel.swift
//  Bittracker
//
//  Created by 高橋 誠二 on 2015/09/11.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftTask

class BTCTTopNewsViewModel {
    var topNews : [News] = []
    
    func loadTopNews(block: ((error: NSError?) -> Void)?) {
        let targetUrls = [
            "http://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Fbtcnews.jp%2Ffeed%2F&count=10",
            "http://cloud.feedly.com/v3/mixes/contents?streamId=feed%2Fhttp%3A%2F%2Fnews.bitflyer.jp%2Ffeed%2F&count=10"
        ]
        typealias Progress = (bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
        typealias AlamoFireTask = Task<Progress, String, NSError>
        let tasks : [AlamoFireTask] = []
        
        for (var i = 0; i < targetUrls.count; i++) {
            let task = AlamoFireTask { progress, fulfill, reject, configure in
                Alamofire.request(.GET, targetUrls[i], parameters: nil)
                    .responseJSON { _, _, raw_json, error in
                        if error != nil {
                            block?(error: error)
                            return
                        }
                        
                        let json = JSON(raw_json!)
                        for (index: String, feed: JSON) in json["items"] {
                            if (feed["visual"]["url"].stringValue != "none" && feed["visual"]["url"] != nil) {
                                var news = News()
                                news.title      = feed["title"].stringValue
                                news.url        = feed["originId"].stringValue
                                news.origin     = feed["origin"]["title"].stringValue
                                news.image_uri  = feed["visual"]["url"].stringValue
                                news.created_at = feed["published"].intValue
                                self.topNews.append(news)
                            }
                        }
                }
            };
        }

    }
}