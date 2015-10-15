//
//  BTCTTopNewsViewModel.swift
//  Bittracker
//
//  Created by 高橋 誠二 on 2015/09/11.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class BTCTTopNewsViewModel {
    func getCollection(callback: ([News]) -> Void) {
        let urlString = "https://btct-news-api.herokuapp.com/api/v1/news?country=jp"
        
        Alamofire.request(.GET, urlString, parameters: nil)
            .responseJSON { _, _, data, err in
                if let error = err {
                    if SVProgressHUD.isVisible() {
                        SVProgressHUD.showErrorWithStatus("失敗!")
                    }
                }
                
                let json = JSON(data!)
                var newsCollection = [News]()
                for (index: String, feed: JSON) in json["response"] {
                    let news = News(
                        title: feed["title"].stringValue,
                        url: feed["url"].stringValue,
                        origin: feed["origin"].stringValue,
                        image_uri: feed["image_uri"].stringValue,
                        created_at: feed["created_at"].intValue
                    )
                    
                    newsCollection.append(news)
                }
                
                callback(newsCollection)
        }
    }
}