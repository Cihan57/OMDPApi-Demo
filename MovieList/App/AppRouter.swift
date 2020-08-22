//
//  AppRouter.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

final class AppRouter{
    
    let window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        let viewController = SplashBuilder.make()
      
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
