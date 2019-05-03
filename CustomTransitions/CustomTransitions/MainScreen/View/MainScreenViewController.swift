//
//  MainScreenViewController.swift
//  CustomTransitions
//
//  Created by Александр Арсенюк on 18/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MainScreenViewInput {
  
    var output: MainScreenViewOutput!
    var indexOfCurrentCell: IndexPath = IndexPath(row: 0, section: 0)
    let toTransitionManager = ToViewTransition()
   
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navBarItem: UINavigationItem!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.definesPresentationContext = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cell = collectionView.cellForItem(at: indexOfCurrentCell) as! CustomCollectionViewCell
        cell.isHidden = false
    }
    
    //MARK: - MainScreenViewInput
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let picture = output.obtainRandomPhoto()
        cell.configureCell(picture: picture.photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        let cellPicture = cell.picture.image
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.picture = cellPicture
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.transitioningDelegate = toTransitionManager
        
        
        present(vc, animated:  true) {
            
            self.navigationController?.isNavigationBarHidden = true
            self.indexOfCurrentCell = indexPath
            cell.isHidden = true
        }
    }
 
   
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue) {
    }
}
