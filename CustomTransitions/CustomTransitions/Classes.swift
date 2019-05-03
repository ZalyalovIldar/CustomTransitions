//
//  Classes.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

protocol Abstarct {
    
    func setData(data: Any)
}

class Picture {

    var photo: UIImage
    
    init(photo: UIImage) {
        self.photo = photo
    }
}
