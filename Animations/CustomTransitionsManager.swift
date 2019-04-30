//
//  CustomTransitionsManager.swift
//  Animations
//
//  Created by Гузель on 20/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class CustomTransitionsManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    /// Произошел ли переход на вью
    var isPresented = false
    /// Ячейка, на которую нажали
    var cell: UICollectionViewCell!
    /// ImageView, для того, чтобы брать его каркас
    var detailImageView: UIImageView!
    /// Каркас ячейки
    var frame: CGRect!
    /// вью, в который переходим
    var toView: UIView!
    /// вью, с которого переходим
    var fromView: UIView!
    /// вью с черным фоном
    let newView = UIView()
    /// Координаты прикосновения
    var location: CGPoint!
    
    //числовые константы
    let zero = 0
    let one = 1
    let fortyfive = 45
    
    /// Метод, который возвращает интервал времени, в котором будет выполняться анимация
    ///
    /// - Parameter transitionContext: контекст
    /// - Returns: Интервал времени
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    /// Метод, в котором описывается анимация перехода
    ///
    /// - Parameter transitionContext: Контекст, содержащий информацию о переходе
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if self.isPresented == false {
            cell.isHidden = false
        }
        
        guard let selectedCell = cell.snapshotView(afterScreenUpdates: true) else { return }
        
        let containerView = transitionContext.containerView
        
        cell.isHidden = true
        
        if let to = transitionContext.view(forKey: .to) {
            toView = to
        } else {
            toView = transitionContext.viewController(forKey: .to)!.view
        }
        
        if let from = transitionContext.view(forKey: .from) {
           fromView = from
        } else {
            fromView = transitionContext.viewController(forKey: .from)!.view
        }

        if let detailViewController = transitionContext.viewController(forKey: .to) as? ViewController {
            detailImageView = detailViewController.imageView
        } else if let detailViewController = transitionContext.viewController(forKey: .from) as? ViewController {
            detailImageView = detailViewController.imageView
        }
        
        containerView.backgroundColor = .white
        
        if isPresented == true {
            toView.isHidden = true
        } else {
            fromView.isHidden = true
        }
        
        newView.frame = containerView.frame
        newView.backgroundColor = .black
        newView.alpha = CGFloat(zero)
        
        containerView.addSubview(fromView)
        containerView.addSubview(toView)
        containerView.addSubview(newView)
        
        if isPresented {
            
            selectedCell.frame = frame
            selectedCell.center.y += CGFloat(fortyfive)
        } else {
            
            selectedCell.frame = detailImageView.frame
            
            if location != nil {
                selectedCell.center.y = location.y
            } else {
                selectedCell.center.y = containerView.center.y
            }
            
            location = nil
        }
        
        selectedCell.isHidden=false
        containerView.addSubview(selectedCell)
        
        let duration = transitionDuration(using: transitionContext)
            
        UIView.animate(withDuration: duration, animations: { [unowned self] in
        
            if self.isPresented {

                selectedCell.frame = self.detailImageView.frame
                selectedCell.center = containerView.center
                self.newView.alpha = CGFloat(self.one)
            } else {

                selectedCell.frame = self.frame
                selectedCell.center.y += 45
                self.newView.alpha = CGFloat(self.zero)
            }
        }) { (isFinished) in
            
            self.newView.removeFromSuperview()

            if self.isPresented {

                self.fromView.isHidden = false
                self.toView.isHidden = false
            } else {

                self.fromView.isHidden = true
                self.toView.isHidden = false
            }
            
            if self.isPresented == false {
                self.cell.isHidden = false
            }
            
            selectedCell.removeFromSuperview()
            transitionContext.completeTransition(isFinished)
            UIApplication.shared.keyWindow!.addSubview(self.toView)
        }
    }
}

