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
            let flickr = MovieDetailsConstant.Flicker.self
            let params = MovieDetailsConstant.Params.self
            var parameters = [String: Any]()
            parameters = [params.apiKey: flickr.apiKey, params.format: flickr.format, params.nojsoncallback: 1]
            parameters[params.text] = movieTitle
            parameters[params.page] = 1
            parameters[params.perPage] = 10
            parameters[params.method] = flickr.method
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        nil
    }
}
