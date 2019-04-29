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
    
    var isPresented = false
    var image = UIImageView()
    var cell: UICollectionViewCell!
    var detailImageView: UIImageView!
    var backgroundView = UIView()
    var frame: CGRect!
    var touch: CGPoint!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: .to),
        let fromView = transitionContext.view(forKey: .from)
            else {
                
                transitionContext.completeTransition(false)
                return
        }
        
        if let detailViewController = transitionContext.viewController(forKey: .to) as? ViewController {
            detailImageView = detailViewController.imageView
        } else if let detailViewController = transitionContext.viewController(forKey: .from) as? ViewController {
            detailImageView = detailViewController.imageView
            
        }
        
        if isPresented {
            
            let containerView = transitionContext.containerView
            let newView = UIView()
            
            containerView.backgroundColor = .white
            toView.isHidden = true
            newView.frame = containerView.frame
            newView.backgroundColor = .black
            newView.alpha = 0
            
            containerView.addSubview(toView)
            containerView.addSubview(newView)
            
            guard let selectedCell = self.cell.snapshotView(afterScreenUpdates: true) else { return }
            selectedCell.frame = self.frame
            selectedCell.center.y += 45
            containerView.addSubview(selectedCell)
            self.cell.isHidden = true
            
            let duration = transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: duration, animations: { [unowned self] in
            
                selectedCell.frame = self.detailImageView.frame
                selectedCell.center = containerView.center
                newView.alpha = 1
            }) { (isFinished) in
                
                newView.removeFromSuperview()
                toView.isHidden = false
                selectedCell.removeFromSuperview()
                self.cell.isHidden = false
                transitionContext.completeTransition(isFinished)
            }
        } else {
            
            let containerView = transitionContext.containerView
            let newView = UIView()
            guard let selectedCell = self.cell.snapshotView(afterScreenUpdates: true) else { return }
            newView.frame = containerView.frame
            newView.backgroundColor = .black
            newView.alpha = 1
            selectedCell.frame = self.detailImageView.frame
            selectedCell.center = containerView.center
            
        }
    }
}
