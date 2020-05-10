//
//  FlickrPhotoViewModel.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/10/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import Foundation

struct FlickrPhotoViewModel {
    private var model: FlickrPhoto
    init(model: FlickrPhoto) {
        self.model = model
    }
    var id: String {
        guard let id = model.id else {
            return "-1"
        }
        return id
    }
    var owner: String {
        guard let owner = model.owner else {
            return ""
        }
        return owner
    }
    var secret: String {
        guard let secret = model.secret else {
            return ""
        }
        return secret
    }
    var server: String {
        guard let server = model.server else {
            return ""
        }
        return server
    }
    var farm: Int {
        guard let farm = model.farm else {
            return -1
        }
        return farm
    }
    var title: String {
        guard let title = model.title else {
            return ""
        }
        return title
    }
    var imageUrl: URL? {
         let urlString = "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
         return URL(string: urlString)
    }
}
