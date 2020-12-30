//
//  ViewController.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

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
//        cell.animalImageView.image = UIImage(named: animalImage)
        cell.animalImageView.downloaded(from: loadData[indexPath.row].image)

        cell.lblName.text = loadData[indexPath.row].name
        cell.lblWeigh.text = loadData[indexPath.row].weigh
        cell.lblSpeed.text = loadData[indexPath.row].speed
        cell.lblOld.text = loadData[indexPath.row].old
        cell.lblFood.text = loadData[indexPath.row].food
        
        return cell

    }
}

