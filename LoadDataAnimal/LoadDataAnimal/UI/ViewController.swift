//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit

extension UIImageView {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}

class ViewController: UIViewController  {
    
    @IBOutlet weak var loadDataCollectionView: UICollectionView!
    
    let loadDataAnimal = Bundle.main.decode(type: [DataAnimal].self, from: "newAnimal.json")
    let loadDataFood = Bundle.main.decode(type: [DataFood].self, from: "newFood.json")
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
        let urlAnimal = URL(string: loadDataAnimal[indexPath.row].image)
        
        cell.animalView.backgroundColor = colorArray[currentColorIndex]
        cell.animalImageView.downloadImage(from: urlAnimal!)
        cell.lblName.text = loadDataAnimal[indexPath.row].name
        cell.lblWeigh.text = loadDataAnimal[indexPath.row].weigh
        cell.lblSpeed.text = loadDataAnimal[indexPath.row].speed
        cell.lblOld.text = loadDataAnimal[indexPath.row].old
        cell.lblFood.text = loadDataAnimal[indexPath.row].food

        return cell
    }
}

