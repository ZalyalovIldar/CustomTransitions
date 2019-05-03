//
//  MainScreenModuleConfigurator.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class MainScreenModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! MainScreenViewController
        let presenter = MainScreenPresenter()
        let dataManager = DataManager()
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.dataManager = dataManager
    }
}
