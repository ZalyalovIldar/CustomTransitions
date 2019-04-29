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
    var cell: UICollectionViewCell!
    
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
        
        let containerView = transitionContext.containerView
        
        var frame = cell.frame
        frame.origin.y = 0.5
        frame.origin.x = 0.5
        frame.size.width = containerView.frame.size.width
        frame.size.height = containerView.frame.size.width
        
        containerView.backgroundColor = .white
        
        let beginState = CGAffineTransform(scaleX: 0, y: 0)
        let endState = CGAffineTransform.identity
        
        //toViewSnapShot.transform = isPresented ? beginState : endState
        
        toView.isHidden = true
        
        containerView.addSubview(toView)
       // containerView.addSubview(toViewSnapShot)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            
            if self.isPresented {
             //   toViewSnapShot.transform = .identity
            }
            else {
             //   fromView.transform = beginState
                self.cell.frame = frame
            }
            
        }) { (isFinished) in
            
            toView.isHidden = false
          //  toViewSnapShot.removeFromSuperview()
            transitionContext.completeTransition(isFinished)
        }
        
    }
}
