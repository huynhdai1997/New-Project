//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var LoadDataCollectionView: UICollectionView!
    let animal = "Lion"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadDataCollectionView.dataSource = self
        LoadDataCollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadDataCell", for: indexPath) as! LoadDataCollectionViewCell
        
        cell.AnimalImageView.image = UIImage.init(named: animal)
        
        
        
        return cell
    }
    
}

