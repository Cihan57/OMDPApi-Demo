//
//  SplashBuilder.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

final class SplashBuilder{
    
    static func make() -> SplashViewController{
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        //viewController.service = app.service
        return viewController
    }
}
