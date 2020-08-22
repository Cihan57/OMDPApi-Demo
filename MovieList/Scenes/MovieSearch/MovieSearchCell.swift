//
//  MovieSearchCell.swift
//  MovieList
//
//  Created by Cihan Karabaş on 22.08.2020.
//  Copyright © 2020 Cihan Karabaş. All rights reserved.
//

import UIKit

class MovieSearchCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var gradientView: UIView!
    override func awakeFromNib() {
        gradientView.setGradientBackground(colorTop: .clear, colorBottom: .black)
    }
}
