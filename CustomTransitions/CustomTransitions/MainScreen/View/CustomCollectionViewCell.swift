//
//  CustomCollectionViewCell.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    func configureCell(picture: UIImage) {
        
        self.picture.image = picture
    }
}
