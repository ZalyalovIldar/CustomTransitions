//
//  CollectionViewController.swift
//  Animations
//
//  Created by Гузель on 20/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UIViewControllerTransitioningDelegate {
    
    let images = [UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3"), UIImage(named: "img4"), UIImage(named: "img5"), UIImage(named: "img1")]
    var tap: CGPoint!
    let transitions = CustomTransitionsManager()
    var selectedImage: UIImage!
    var presenter: FirstViewOutput!
    var isPresented = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.setImage(image: images[indexPath.row]!)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        transitions.cell = cell
        
        if let image = images[indexPath.row] {
            presenter.showSecondVC(with: image)
        }
    }
    
    // MARK: UIViewController methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        segue.destination.transitioningDelegate = self
        if segue.identifier == "Detail" {
            let secondVC = segue.destination as! ViewController
            secondVC.modalPresentationStyle = .custom

            if let image = sender as? UIImage {
                secondVC.image = image
            }
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        transitions.isPresented = isPresented
        
        return transitions
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        transitions.isPresented = isPresented
        
        return transitions
    }
    
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) { }
}
