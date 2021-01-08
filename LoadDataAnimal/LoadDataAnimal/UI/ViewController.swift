//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit


class ViewController: UIViewController  {
    
    @IBOutlet weak var loadDataCollectionView: UICollectionView!
    
    let loadDataAnimal = Bundle.main.decode(type: [DataAnimal].self, from: "newAnimal.json")
    let colorArray: [UIColor] = [.systemRed, .systemYellow, .systemOrange, .systemGreen,                                 .systemBlue, .blue, .systemPurple, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataCollectionView.dataSource = self
        loadDataCollectionView.delegate   = self
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loadDataAnimal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadDataCell", for: indexPath) as! LoadDataCollectionViewCell
        let currentColorIndex = indexPath.row % colorArray.count
//        let animal = self.loadDataAnimal[indexPath.row]
        let animalImageUrl = URL(string: (self.loadDataAnimal[indexPath.row].image))!
        cell.animalView.backgroundColor = colorArray[currentColorIndex]
        cell.animalImageView.loadImage(imgUrl: animalImageUrl)
        cell.lblName.text = loadDataAnimal[indexPath.row].name
        cell.lblWeigh.text = loadDataAnimal[indexPath.row].weigh
        cell.lblSpeed.text = loadDataAnimal[indexPath.row].speed
        cell.lblOld.text = loadDataAnimal[indexPath.row].old
        cell.lblFood.text = loadDataAnimal[indexPath.row].food
        
        return cell
    }
}

