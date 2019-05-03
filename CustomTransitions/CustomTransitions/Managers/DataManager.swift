//
//  DataManager.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

protocol DataManagerProtocol {
    
    func obtainCountOfPhotosArray() -> Int
    
     func obtainRandomPhoto() -> Picture
}

class DataManager: DataManagerProtocol {
    
    let photosArray: [Picture] = [Picture(photo: #imageLiteral(resourceName: "avatar1")), Picture(photo: #imageLiteral(resourceName: "avatar2")), Picture(photo: #imageLiteral(resourceName: "avatar3"))]
    
    func obtainCountOfPhotosArray() -> Int {
        
        return photosArray.count
    }
    
    func obtainRandomPhoto() -> Picture {
        
        return photosArray.randomElement()!
    }
 }
