//
//  NewAnimation.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/18/21.
//

import Foundation

struct NewAnimation: Codable {
    var newAnimation = [DataAnimal]()
    
    func getAnimal(completionHandler: @escaping (DataAnimal?) -> ()) {
        let urlAnimal = URL(string: "https://tests3resouce.s3-ap-southeast-1.amazonaws.com/newAnimal.json")
        URLSession.shared.dataTask(with: urlAnimal!) { (data, response, error) in
            if (error == nil && data != nil) {
                do{
                self.newAnimation = try JSONDecoder().decode([DataAnimal].self, from: data!)
            }catch{
                debugPrint("Failed to convert \(error.localizedDescription)")
            }
                DispatchQueue.main.async {
                    self.loadDataCollectionView.reloadData()
                }
            }
        }.resume()
    }
}
