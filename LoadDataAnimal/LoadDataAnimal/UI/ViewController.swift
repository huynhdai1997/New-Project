//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit


class ViewController: UIViewController  {
    
    @IBOutlet weak var loadDataCollectionView: UICollectionView!
    let animalImage = "Big Foot"
    let loadData = Bundle.main.decode(type: [DataAnimal].self, from: "newAnimal.json")
    let colorArray: [UIColor] = [.systemRed, .systemYellow, .systemOrange, .systemGreen, .systemBlue, .blue, .systemPurple, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataCollectionView.dataSource = self
        loadDataCollectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadDataCell", for: indexPath) as! LoadDataCollectionViewCell
        let currentColorIndex = indexPath.row % colorArray.count
        
        cell.animalView.backgroundColor = colorArray[currentColorIndex]
        cell.animalImageView.image = UIImage(named: animalImage)
        cell.lblName.text = loadData[indexPath.row].name
        cell.lblWeigh.text = loadData[indexPath.row].weigh
        cell.lblSpeed.text = loadData[indexPath.row].speed
        cell.lblOld.text = loadData[indexPath.row].old
        cell.lblFood.text = loadData[indexPath.row].food
        
        return cell
    }
}

