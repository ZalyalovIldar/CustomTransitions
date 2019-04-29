//
//  FirstRouter.swift
//  Animations
//
//  Created by Гузель on 27/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class FirstRouter: FirstRouterInput {
    
    var output: FirstRouterOutput!
    var view: UIViewController!
    
    func showSecondVC(with: UIImage) {
        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = mainStoryboard.instantiateViewController(withIdentifier: "DetailVC") as! ViewController
//        
//        vc.setImage(image: with)
        
        view.performSegue(withIdentifier: "Detail", sender: with)
    }
}
