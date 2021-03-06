//
//  MovieSearchViewController.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

final class MovieSearchViewController: UIViewController {
    
    @IBOutlet var movieSearchView: MovieSearchView! {
        didSet {
            movieSearchView.delegate = self
            title = "Movie Search"
        }
    }
    
    var service: MovieServiceProtocol!
    private var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getMovieList(searchText:String){
        movieSearchView.setLoading(true)
        service.fetchSearchMovies(params: ["s" : searchText,
                                           "type": "movie",
                                           "page": "1",
                                           "apiKey":ApiConstant.apiKey])
        { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.movieList = value.search
                let moviePresentations = value.search.map(MoviePresentation.init)
                self.movieSearchView.updateMovieList(moviePresentations)
                print(result)
            case .failure(let error):
                print(error)
            }
            self.movieSearchView.setLoading(false)
        }
    }
    
}

extension MovieSearchViewController: MovieSearchViewDelegate {
    func search(with name: String) {
        getMovieList(searchText: name)
    }
    
    func didSelect(at index: Int) {
        let movie = movieList[index]
        let movieDetailViewController = MovieDetailBuilder.make(with: movie)
        show(movieDetailViewController, sender: nil)
    }
    
    
}

