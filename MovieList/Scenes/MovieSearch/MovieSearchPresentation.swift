//
//  MovieSearchPresentation.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

struct MoviePresentation {
    let title: String
    let image: URL
    let year: String
}

extension MoviePresentation {
    
    init(movie: Movie) {
        self.init(title: movie.title, image: movie.poster, year: movie.year)
    }
}
