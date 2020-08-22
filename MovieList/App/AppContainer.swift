//
//  AppContainer.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import Foundation

let app = AppContainer()

final class AppContainer{
    
    let router = AppRouter()
    let service = MovieService()
    
}
