//
//  MovieDetailPresentation.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

struct MovieDetailPresentation {
    let title: String
    let image: URL
    let detail: String?
    let year: String?
    let director: String?
    let rate: String?
}

extension MovieDetailPresentation {
    
    init(movie: Movie) {
        self.init(title: movie.title, image: movie.poster, detail: movie.plot, year: movie.year, director: movie.director, rate: movie.imdbRating)
    }
}
