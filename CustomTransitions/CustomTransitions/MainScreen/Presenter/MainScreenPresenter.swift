//
//  MainScreenPresenter.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenViewOutput {
   
    
    weak var view: MainScreenViewInput!
    var dataManager: DataManagerProtocol!
    
    //MARK: - MainScreenViewOutput
    
    func obtainCountOfPhotos() -> Int {
        
        return dataManager.obtainCountOfPhotosArray()
    }
    func obtainRandomPhoto() -> Picture {
        
        return dataManager.obtainRandomPhoto()
    }
    
    
}
