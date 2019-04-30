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
    
    //MARK: - FirstViewOutput
    
    func showSecondVC(with: UIImage) {
    }
    
    func ifLetCell(collectionView: UICollectionView, indexPath: IndexPath, transitions: CustomTransitionsManager) {
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            
            view.setCell(cell: cell)
            transitions.cell = cell
            transitions.frame = cell.frame
        }
    }
    
    func ifLetImage(images: [UIImage?], indexPath: IndexPath, controllerToPresent: ViewController, transitions: CustomTransitionsManager) {
        
        if let image = images[indexPath.row] {
            
            controllerToPresent.image = image
            controllerToPresent.transitions = transitions
        }
    }
}
