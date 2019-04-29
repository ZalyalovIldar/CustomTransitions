//
//  FirstPresenter.swift
//  Animations
//
//  Created by Гузель on 27/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class FirstPresenter: FirstViewOutput {
    
    var view: FirstViewInput!
    var router: FirstRouterInput!
    
    
    //MARK: - FirstViewOutput
    
    func showSecondVC(with: UIImage) {
        router.showSecondVC(with: with)
    }
}
