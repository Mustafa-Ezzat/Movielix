//
//  FlickrPhoto.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct FlickrPhoto: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    var imageUrl: URL? {
         let urlString = "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
         return URL(string: urlString)
    }
}

struct FlockerPage: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [FlickrPhoto]
}

struct FlickerContent: Codable {
    let photos: FlockerPage
}
