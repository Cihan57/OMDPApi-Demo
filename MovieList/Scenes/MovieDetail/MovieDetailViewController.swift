//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit
import Firebase

final class MovieDetailViewController: UIViewController {
    @IBOutlet var movieDetailView: MovieDetailView!
    var movie: Movie!
    
    var service: MovieServiceProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movie.title
        
        movieDetailView.setLoading(true)
        service.fetchMovieDetail(params: ["i" : movie.imdbId,"apiKey":ApiConstant.apiKey]) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.movieDetailView.updateMovieDetail(MovieDetailPresentation(movie: value))
                print(result)
                self.logMovieDetail(with: value)
            case .failure(let error):
                print(error)
            }
            self.movieDetailView.setLoading(false)
        }
    }
    
    func logMovieDetail(with movie: Movie){
        Analytics.logEvent("movie_detail", parameters: movie.asDictionary)
    }
}
