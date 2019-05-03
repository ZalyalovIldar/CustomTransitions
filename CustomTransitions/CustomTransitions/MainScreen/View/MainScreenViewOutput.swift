//
//  MainScreenViewOutput.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol MainScreenViewOutput: AnyObject {
    
    func obtainCountOfPhotos() -> Int
    
    func obtainRandomPhoto() -> Picture
}
