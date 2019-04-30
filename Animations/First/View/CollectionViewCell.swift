//
//  CollectionViewCell.swift
//  Animations
//
//  Created by Гузель on 20/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    /// Инициализация изображения
    ///
    /// - Parameter image: изображение
    func setImage(image: UIImage) {
        imageView.image = image
    }
}
