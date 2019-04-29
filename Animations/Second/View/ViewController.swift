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
    var image: UIImage!
    let transition = CustomTransitionsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initItems()
    }
    
    func setImage(image: UIImage) {
        
        self.image = image
    }
    
    func initItems() {
        self.imageView.image = self.image
    }
    
    @IBAction func didPressedBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindToViewController", sender: nil)
    }
}

