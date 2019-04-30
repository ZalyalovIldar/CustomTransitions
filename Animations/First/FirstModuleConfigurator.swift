//
//  FirstModuleConfigurator.swift
//  Animations
//
//  Created by Гузель on 27/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class FirstModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! CollectionViewController
        let presenter = FirstPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
    }
}
