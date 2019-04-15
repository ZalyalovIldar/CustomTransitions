//
//  CustomTransitionsManager.swift
//  CustomTransitionsLesson
//
//  Created by Ильдар Залялов on 15/04/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class CustomTransitionsManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresented = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
       guard let toView = transitionContext.view(forKey: .to),
        let fromView = transitionContext.view(forKey: .from),
        let toViewSnapShot = toView.snapshotView(afterScreenUpdates: true)
        else {
            
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.backgroundColor = .white
        
        let beginState = CGAffineTransform(scaleX: 0, y: 0)
        let endState = CGAffineTransform.identity
        
        toViewSnapShot.transform = isPresented ? beginState : endState
        
        toView.isHidden = true
        
        containerView.addSubview(toView)
        containerView.addSubview(toViewSnapShot)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            
            if self.isPresented {
                toViewSnapShot.transform = .identity
            }
            else {
                fromView.transform = beginState
            }
            
        }) { (isFinished) in
            
            toView.isHidden = false
            toViewSnapShot.removeFromSuperview()
            transitionContext.completeTransition(isFinished)
        }
        
    }
    
    
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        
        return self
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        
        return self
    }
    
}
