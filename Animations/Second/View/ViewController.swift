//
//  ViewController.swift
//  Animations
//
//  Created by Гузель on 20/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var imageView: UIImageView!
    /// Изображение
    var image: UIImage!
    /// Менеджер анимаций переходов
    var transitions: CustomTransitionsManager!
    // числовые константы
    let twohundred = 200
    let one = 1
    let two = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initItems()
    }
    
    /// инициализация изображения
    func initItems() {
        self.imageView.image = self.image
    }
    
    /// изменение касаний по экрану
    ///
    /// - Parameters:
    ///   - touches: Набор касаний по экрану
    ///   - event: Событие, к которому относятся прикосновения.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch! = touches.first! as UITouch
        let location = touch.location(in: self.view)
        self.imageView.center.y = location.y - CGFloat(twohundred)
        
        self.view.alpha = CGFloat(one) - abs(location.y - self.view.frame.maxY / CGFloat(two)) / (self.view.frame.maxY / CGFloat(two))
    }
    
    /// Последняя точка касания
    ///
    /// - Parameters:
    ///   - touches: Набор касаний по экрану
    ///   - event: Событие, к которому относятся прикосновения.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch! = touches.first! as UITouch
        let location = touch.location(in: self.view)
        
        transitions.location = location
        
        if (abs(location.y - self.view.center.y) > CGFloat(twohundred)) {
            
            transitions.isPresented = false
            didPressedBack(false)
        } else {
            
            self.imageView.center.y = self.view.center.y - CGFloat(twohundred)
            self.imageView.center.x = self.view.center.x
            self.view.alpha = CGFloat(one)
        }
    }
    
    /// Метод, который открывает предыдущий VC
    ///
    /// - Parameter sender: это объект, который вызвал действие
    @IBAction func didPressedBack(_ sender: Any) {
        performSegue(withIdentifier: AllConstants.unwindToViewController.rawValue, sender: true)
    }
}

