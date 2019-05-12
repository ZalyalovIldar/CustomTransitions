//
//  CustomTransitionManager.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 12/05/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class CustomTransitionsManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
       
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        var toView: UIView!
        var fromView: UIView!
        var toViewNavigation: UIView!
        
        if let to = transitionContext.view(forKey: .to) {
            toView = to
        } else {
            toView = transitionContext.viewController(forKey: .to)!.view
        }
        
        if let navigation = transitionContext.viewController(forKey: .to)?.navigationController?.navigationBar {
            toViewNavigation = navigation
        } else {
            toViewNavigation = transitionContext.viewController(forKey: .to)!.navigationController?.navigationBar
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
        
        let beginState = CGAffineTransform(translationX: 0, y: 0)
        
        toView.isHidden = true
        toViewSnapShot.transform = beginState
        
        conteinerView.addSubview(fromViewSnapShot)
        conteinerView.addSubview(fromView)
        conteinerView.addSubview(toViewSnapShot)
        conteinerView.addSubview(toView)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            
            
            toViewSnapShot.transform = .identity
        
            
        })
        { (isFinished) in
            
            toViewSnapShot.isHidden = true
            toView.isHidden = false
            transitionContext.completeTransition(isFinished)
            toView.addSubview(toViewNavigation)
            UIApplication.shared.keyWindow!.addSubview(toView)
        }
    }
    
}
