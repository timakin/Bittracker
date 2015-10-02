//
//  News.swift
//  Bittracker
//
//  Created by Seiji Takahashi on 2015/07/12.
//  Copyright (c) 2015年 高橋 誠二. All rights reserved.
//

import Foundation

class News {
    var _title : String = ""
    var _url : String = ""
    var _origin : String = ""
    var _image_uri : String = ""
    var _created_at : Int = 0
    
    var title : String{
        get{
            return _title
        }
        set(newValue){
            _title = newValue
        }
    }
    var url : String{
        get{
            return _url
        }
        set(newValue){
            _url = newValue
        }
    }
    var origin : String{
        get{
            return _origin
        }
        set(newValue){
            _origin = newValue
        }
    }
    var image_uri : String{
        get{
            return _image_uri
        }
        set(newValue){
            _image_uri = newValue
        }
    }
    var created_at : Int {
        get{
            return _created_at
        }
        set(newValue){
            _created_at = newValue
        }
    }
}