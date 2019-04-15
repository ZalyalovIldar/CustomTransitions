//
//  ViewController.swift
//  CustomTransitionsLesson
//
//  Created by Ильдар Залялов on 15/04/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit


class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressedBack(_ sender: Any) {
        performSegue(withIdentifier: "unwindToViewController", sender: nil)
    }
}

class ViewController: UIViewController {
    
    let transitionManager = CustomTransitionsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        segue.destination.transitioningDelegate = transitionManager
    }
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) { }
}

