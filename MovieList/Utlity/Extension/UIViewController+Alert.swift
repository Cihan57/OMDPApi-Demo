//
//  UIViewController+Alert.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(with title: String, message: String = "") {
        let networkAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(networkAlert, animated: true, completion: nil)
    }

}
