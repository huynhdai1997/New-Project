//
//  NewAnimalData.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/18/21.
//

import Foundation

struct NewAnimalData {
    
    func getDataAnimal(completionHandler: @escaping (DataAnimal?) -> ()) {
        let animalUrl = URL(string: "https://tests3resouce.s3-ap-southeast-1.amazonaws.com/newAnimal.json")!
        URLSession.shared.dataTask(with: animalUrl) { (data, response, error) in
            if (error == nil && data != nil) {
                do{
                    let resulf = try JSONDecoder().decode(DataAnimal.self, from: data!)
                    completionHandler(resulf)
                    
                }catch {
                    debugPrint("Error")
                }
                
            }
        }.resume()
    }
}
