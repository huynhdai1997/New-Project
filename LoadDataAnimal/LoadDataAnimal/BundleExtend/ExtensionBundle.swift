//
//  ExtensionBundle.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(type: T.Type, file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys ) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file)in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from bundle")
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to decode \(file) from bundle") {
            } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.loca)")
        }
    }
}
