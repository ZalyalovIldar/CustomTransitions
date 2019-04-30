//
//  CollectionViewController.swift
//  Animations
//
//  Created by Гузель on 20/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

enum AllConstants: String {
    
    case img1 = "img1",
    img2 = "img2",
    img3 = "img3",
    img4 = "img4",
    main = "Main",
    detail = "DetailVC",
    unwindToViewController = "unwindToViewController",
    reuseIdentifier = "Cell"
}

class CollectionViewController: UICollectionViewController, UIViewControllerTransitioningDelegate, FirstViewInput {
    
    let images = [UIImage(named: AllConstants.img1.rawValue), UIImage(named: AllConstants.img2.rawValue), UIImage(named: AllConstants.img2.rawValue), UIImage(named: AllConstants.img3.rawValue), UIImage(named: AllConstants.img4.rawValue), UIImage(named: AllConstants.img1.rawValue)]
    let transitions = CustomTransitionsManager()
    var presenter: FirstViewOutput!
    var isPresented = false
    var cell = UICollectionViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Методы CollectionView
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AllConstants.reuseIdentifier.rawValue, for: indexPath) as! CollectionViewCell
        
        cell.setImage(image: images[indexPath.row]!)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: AllConstants.main.rawValue, bundle: nil)
        let presentingController = self
        let controllerToPresent = mainStoryboard.instantiateViewController(withIdentifier: AllConstants.detail.rawValue) as! ViewController
        
        self.presenter.ifLetCell(collectionView: collectionView, indexPath: indexPath, transitions: self.transitions)
        self.presenter.ifLetImage(images: images, indexPath: indexPath, controllerToPresent: controllerToPresent, transitions: transitions)

        controllerToPresent.modalPresentationStyle = .overCurrentContext
        controllerToPresent.modalTransitionStyle = .crossDissolve
        controllerToPresent.modalPresentationCapturesStatusBarAppearance = false
        presentingController.definesPresentationContext = true
        controllerToPresent.transitioningDelegate = self
        
        presentingController.present(controllerToPresent, animated: true, completion: {
            self.cell.isHidden = true
        })
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    /// Метод, который говорит, откуда брать анимацию перехода
    ///
    /// - Parameters:
    ///   - presented: VC, с которого происходит переход
    ///   - presenting: VC, в который происходит переход
    ///   - source: VC, который вызвал present
    /// - Returns: Класс, который будет выполнять анимацию
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        transitions.isPresented = isPresented
        
        return transitions
    }
    
    /// Метод, который говорит, откуда брать анимацию возвращения
    ///
    /// - Parameter dismissed: VC объекта, который будет после нажатия на dissmiss
    /// - Returns: Класс, который будет выполнять анимацию
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        transitions.isPresented = isPresented
        
        return transitions
    }
    
    func setCell(cell: UICollectionViewCell) {
        self.cell = cell
    }
    
    //MARK: - unwindToViewController
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) { }
}
