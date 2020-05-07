//
//  MoyaDetailsConstant.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

enum MovieDetailsConstant {
    enum Flicker {
        static let baseUrl = "https://api.flickr.com/services/rest"
        static let apiKey = "546594e2cdf219950ef1c5946b0b5a2a"
        static let method = "flickr.photos.search"
        static let format = "json"
        
        enum Params {
            static let apiKey = "api_key"
            static let format = "format"
            static let nojsoncallback = "nojsoncallback"
            static let text = "text"
            static let page = "page"
            static let perPage = "per_page"
            static let method = "method"
        }
    }
    
}
