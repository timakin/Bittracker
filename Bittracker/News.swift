//
//  News.swift
//  Bittracker
//
//  Created by Seiji Takahashi on 2015/07/12.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import Foundation

class News {
    let title : String
    let url : String
    let origin : String
    let image_uri : String
    let created_at : Int
    
    init(title: String, url : String, origin : String, image_uri : String, created_at : Int) {
        self.title = title
        self.url = url
        self.origin = origin
        self.image_uri = image_uri
        self.created_at = created_at
    }
}