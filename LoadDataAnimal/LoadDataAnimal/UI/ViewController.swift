//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit



class ViewController: UIViewController  {
    
    @IBOutlet weak var loadDataCollectionView: UICollectionView!
    
    var customImgView = CustomImageView()
    var networkData = NetworkData()
    var dataAnimals = [DataAnimal]()
    let colorArray: [UIColor] = [.systemRed, .systemYellow, .systemOrange, .systemGreen,                                    .systemBlue, .systemIndigo, .systemPurple, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataCollectionView.dataSource = self
        loadDataCollectionView.delegate   = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        networkData.fetchDataAnimal { data in
            self.dataAnimals = data
            DispatchQueue.main.async {
                self.loadDataCollectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataAnimals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 48)/2, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadDataCell", for: indexPath) as! LoadDataCollectionViewCell
        let currentColorIndex = indexPath.row % colorArray.count
        let animal = self.dataAnimals[indexPath.row]
        let animalImageUrl = URL(string: (animal.image))!
        
        cell.animalView.backgroundColor = colorArray[currentColorIndex]
        cell.animalImageView.loadImage(url: animalImageUrl, placeHolderImage: "DefaultImage")
        cell.lblName.text = dataAnimals[indexPath.row].name
        cell.lblWeigh.text = dataAnimals[indexPath.row].weigh
        cell.lblSpeed.text = dataAnimals[indexPath.row].speed
        cell.lblOld.text = dataAnimals[indexPath.row].old
        cell.lblFood.text = dataAnimals[indexPath.row].food
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let colorIndexDetail = indexPath.row % colorArray.count
        
        detailVC?.imageDetail = URL(string: (dataAnimals[indexPath.row].image))!
        detailVC?.backgroundColor = colorArray[colorIndexDetail]
        detailVC?.titleNameDetail = dataAnimals[indexPath.row].name
        detailVC?.detailName = dataAnimals[indexPath.row].name
        detailVC?.detailWeigh = dataAnimals[indexPath.row].weigh
        detailVC?.detailSpeed = dataAnimals[indexPath.row].speed
        detailVC?.detailOld = dataAnimals[indexPath.row].old
        detailVC?.detailFood = dataAnimals[indexPath.row].food
        
        self.navigationController?.pushViewController(detailVC!, animated: true)
    }
}
