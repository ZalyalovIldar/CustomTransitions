//
//  FirstViewOutput.swift
//  Animations
//
//  Created by Гузель on 27/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

protocol FirstViewOutput: AnyObject {
    
    func showSecondVC(with: UIImage)
    
    /// Проверка на nil ячейки
    ///
    /// - Parameters:
    ///   - collectionView: collectionView, ячейку которого мы проверяем
    ///   - indexPath: Список индексов, которые вместе представляют путь к определенному местоположению в дереве вложенных массивов.
    ///   - transitions: менеджер анимаций переходов
    func ifLetCell(collectionView: UICollectionView, indexPath: IndexPath, transitions: CustomTransitionsManager)
    
    /// Проверка на nil изображения
    ///
    /// - Parameters:
    ///   - images: массив изображений
    ///   - indexPath: Список индексов, которые вместе представляют путь к определенному местоположению в дереве вложенных массивов.
    ///   - controllerToPresent: контроллер, который будет представлен
    ///   - transitions: менеджер анимаций переходов
    func ifLetImage(images: [UIImage?], indexPath: IndexPath, controllerToPresent: ViewController, transitions: CustomTransitionsManager)
}
