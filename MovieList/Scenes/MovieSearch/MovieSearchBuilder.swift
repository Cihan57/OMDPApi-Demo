//
//  MovieSearchBuilder.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import  UIKit

final class MovieSearchBuilder{
    
    static func makeNavigationController(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .white
        navigationController.modalPresentationStyle = .fullScreen
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        return navigationController
    }
    
    static func make() -> MovieSearchViewController {
        let storyboard = UIStoryboard(name: "MovieSearch", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieSearchViewController") as! MovieSearchViewController
        viewController.service = app.service
        
        return viewController
    }
}
