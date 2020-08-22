//
//  MovieDetailContratcs.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

protocol MovieDetailViewProtocol {
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation)
    func setLoading(_ isLoading : Bool)
}
