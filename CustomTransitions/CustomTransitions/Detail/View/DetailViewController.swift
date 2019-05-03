//
//  DetailViewController.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

enum AnimationState {
    case fullscreen
    case thumbnail
}

class DetailViewController: UIViewController, DetailViewInput, Abstarct {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var swipe: UISwipeGestureRecognizer!
    @IBOutlet weak var backButtonAsOutlet: UIButton!
    
    var panGestureRecognizer: UIPanGestureRecognizer!
    var pictureStartPostion: CGFloat!
    var output: DetailViewOutput!
    var picture: UIImage!
    
    
    let whitrColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let blackColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let identifier = "unwindToMainViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.isUserInteractionEnabled = true
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        image.image = self.picture
        
        backButtonAsOutlet.tintColor = whitrColor
        
        self.view.backgroundColor = blackColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pictureStartPostion =  self.image.layer.position.y
    }
    
    @IBAction func backButton(_ sender: Any) {
       
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MainScreenViewController
        segue.destination.navigationController?.isNavigationBarHidden = false
        let cell = vc.collectionView.cellForItem(at: vc.indexOfCurrentCell) as! CustomCollectionViewCell
        cell.isHidden = false
     }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view.superview)
        
        switch recognizer.state {
        case .began:
            pictureStartPostion = self.image.layer.position.y
        case .changed:
            scrub(translation: translation, y: pictureStartPostion!)
        case .ended:
            endAnimation(recognizer: recognizer, translation: translation)
        default:
          break
        }
    }

    func scrub(translation: CGPoint, y: CGFloat) {
        
        let translationY = translation.y
        let transitionModule = abs(translationY)
        let alphaCooficent = max(1 - transitionModule/self.view.center.y, 0)
       
        self.image.layer.position = CGPoint(x: self.image.layer.position.x, y: y + translationY)
        self.view.backgroundColor = UIColor(white: 0, alpha: alphaCooficent)
        self.backButtonAsOutlet.tintColor = UIColor(white: 1, alpha: alphaCooficent)
   }
    
   func endAnimation(recognizer: UIPanGestureRecognizer, translation: CGPoint) {
        
        let criticalTransition = 100
    
        
        if (Int(translation.y) < -criticalTransition  || Int(translation.y) > criticalTransition)  {
            
            self.view.backgroundColor = UIColor(white: 0, alpha: 0)
            performSegue(withIdentifier: identifier, sender: nil)
        }
        else {
            self.image.layer.position = CGPoint(x: self.image.layer.position.x, y:  pictureStartPostion)
            self.view.backgroundColor = UIColor(white: 0, alpha: 1)
        }
    }
    
    func setData(data: Any) {
        
        let picture = data as? UIImage
        self.picture = picture
    }
 }

