//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit


class ViewController: UIViewController  {
    
    @IBOutlet weak var loadDataCollectionView: UICollectionView!
    
    var dataAnimals = [DataAnimal]()
    //    let loadDataAnimal = Bundle.main.decode(type: [DataAnimal].self, from: "newAnimal.json")
    let colorArray: [UIColor] = [.systemRed, .systemYellow, .systemOrange, .systemGreen,                                    .systemBlue, .blue, .systemPurple, .brown]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataCollectionView.dataSource = self
        loadDataCollectionView.delegate   = self
        fetchDataAnimal()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func fetchDataAnimal() {
        let urlAnimal = URL(string: "https://tests3resouce.s3-ap-southeast-1.amazonaws.com/newAnimal.json")
        URLSession.shared.dataTask(with: urlAnimal!) { (data, response, error) in
            if (error == nil && data != nil) {
                do {
                    self.dataAnimals = try JSONDecoder().decode([DataAnimal].self, from: data!)
                }
                catch {
                    debugPrint("Failed to convert \(error.localizedDescription)")
                }
                DispatchQueue.main.async {
                    self.loadDataCollectionView.reloadData()
                }
            }
        }.resume()
    }
    
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
}

