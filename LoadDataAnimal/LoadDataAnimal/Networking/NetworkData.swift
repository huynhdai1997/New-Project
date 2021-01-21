//
//  NetworkData.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/19/21.
//

import Foundation


class NetworkData {
    
    enum Link: String {
        
        case url = "https://tests3resouce.s3-ap-southeast-1.amazonaws.com/newAnimal.json"
    }
    
    var urls: URL?
    
    func fetchDataAnimal(complete: @escaping ([DataAnimal]) -> ()) {
        
        urls = URL(string: Link.url.rawValue) //dangerous area(error prone :)
        guard let urlss = urls else {
            return
        }
        
        let urlAnimal = urlss
        URLSession.shared.dataTask(with: urlAnimal) {  (data, response, error) in
            if (error == nil && data != nil) {
                do {
                    let jsonData = try JSONDecoder().decode([DataAnimal].self, from: data!)
                    DispatchQueue.main.async {
                        complete(jsonData)
                    }
                }
                catch {
                    debugPrint("Failed to convert \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}



