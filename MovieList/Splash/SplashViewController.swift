//
//  SplashViewController.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig
import Alamofire

class SplashViewController: UIViewController {
    
    var remoteConfig: RemoteConfig!
    let network = NetworkReachabilityManager()!
    @IBOutlet weak var messageLbl: UILabel!
    let service: MovieServiceProtocol = MovieService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard network.isReachable else {
            showAlert(with: "No Connection!")
            return
        }
        setupRemoteConfing()
        fetchMessage()
        
    }
    
    func setupRemoteConfing(){
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = Constants.minimumFetchInterval
        remoteConfig.configSettings = settings
    }

    func fetchMessage(){
        remoteConfig.fetch(withExpirationDuration: TimeInterval(Constants.expirationDuration)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate(completionHandler: { (error) in
                    // ...
                })
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            self.showMessage()
        }
    }
    
    func showMessage(){
        if let message = RemoteConfig.remoteConfig().configValue(forKey: "loodos_text").stringValue, message.count > 0 {
            messageLbl.text = message
            openMovieSearchScreen()
        }
    }
    
    func openMovieSearchScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.splashTime) {
            let movieSearchViewController = MovieSearchBuilder.makeNavigationController(viewController: MovieSearchBuilder.make())
            self.show(movieSearchViewController, sender: nil)
        }
    }
}
