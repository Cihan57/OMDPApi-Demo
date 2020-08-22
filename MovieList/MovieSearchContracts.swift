//
//  MovieSearchContracts.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

protocol MovieSearchViewProtocol {
    var delegate: MovieSearchViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
    func setLoading(_ isLoading: Bool)
}

protocol MovieSearchViewDelegate: class {
    func didSelect(at index:Int)
    func search(with name:String)
}
