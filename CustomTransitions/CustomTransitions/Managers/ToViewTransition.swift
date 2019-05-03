//
//  ToViewTransition.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 25/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class ToViewTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresneted = true
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
       
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return CustomTransitionsManager()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
         
        var toView: UIView!
        var fromView: UIView!
        
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
        
        guard  let toViewSnapShot = toView.snapshotView(afterScreenUpdates: true)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        guard  let fromViewSnapShot = fromView.snapshotView(afterScreenUpdates: true)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        let conteinerView = transitionContext.containerView
        
        let beginState = CGAffineTransform(translationX: 0, y: conteinerView.frame.height)
       
        toView.transform = beginState
            
        
        conteinerView.addSubview(fromView)
        conteinerView.addSubview(toView)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            
            //fromView.alpha = 0
           //customInteractionController.attachToViewController(viewController: toView)
            toView.transform = .identity
           
            })
        { (isFinished) in
            transitionContext.completeTransition(isFinished)
        }
    }
}
