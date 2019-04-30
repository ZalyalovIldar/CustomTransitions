//
//  FirstViewInput.swift
//  Animations
//
//  Created by Гузель on 27/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

protocol FirstViewInput: AnyObject {
    
    /// инициализация ячейки
    ///
    /// - Parameter cell: ячейка
    func setCell(cell: UICollectionViewCell)
}
