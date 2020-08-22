//
//  APIRouter.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter {
    case movieSearch(items: [String: String])
    case movieDetail(items: [String: String])
}

extension ApiRouter: URLRequestConvertible {
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .movieSearch, .movieDetail:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        return "/"
    }
    
    
    private var queryItems: [String: String] {
        
        switch self {
        case .movieDetail(let items),.movieSearch(let items):
            return items
        }
    }
    
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        return nil
    }
    
    public func getURL() -> URL?{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = ApiConstant.baseURL
        urlComponents.path = path
        urlComponents.setQueryItems(with: queryItems)
        return urlComponents.url
    }
    
    //     MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = getURL()
        var urlRequest = URLRequest(url: url!)
        
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

