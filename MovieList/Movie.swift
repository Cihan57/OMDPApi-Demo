//
//  Movie.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

// MARK: - Movie
public struct Movie: Decodable {
    public let title, year : String
    public let runtime, genre, director, imdbRating: String?
    public let plot, language: String?
    public let poster: URL
    public let imdbId: String
    public let type: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case language = "Language"
        case poster = "Poster"
        case imdbId = "imdbID"
        case imdbRating = "imdbRating"
    }
    
//    public var asDictionary : [String:Any] {
//        let mirror = Mirror(reflecting: self)
//        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?,value:Any) -> (String,Any)? in
//            guard label != nil else { return nil }
//            return (label!,value)
//        }).compactMap{ $0 })
//        return dict
//    }
}
