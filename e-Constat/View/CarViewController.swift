//
//  CarViewController.swift
//  e-Constat
//
//  Created by Rayen_Mezen on 19/11/2022.
//

import UIKit

class CarViewController: UIViewController ,UICollectionViewDelegate {
    private let collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
    
    

    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
  
    
}
