//
//  MoyaDetailsTarget.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//


import Moya

enum MovieDetailsTarget {
    case photoList(movieTitle: String)
}

extension MovieDetailsTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: MovieDetailsConstant.Flicker.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        return ""
        //return MovieDetailsConstant.Flicker.method
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .photoList(let movieTitle):
            let params = MovieDetailsConstant.Flicker.Params.self
            let parameters: [String : Any] =  [params.apiKey: MovieDetailsConstant.Flicker.apiKey, params.format: MovieDetailsConstant.Flicker.format, params.nojsoncallback: 1, params.text: movieTitle, params.page: 1, params.perPage: 10, params.method: MovieDetailsConstant.Flicker.method]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
