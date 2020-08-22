//
//  MovieDetailBuilder.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

final class MovieDetailBuilder{
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.movie = movie
        viewController.service = app.service
        return viewController
    }
    
}
