//
//  ModelData.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 15/07/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var galleryJW: [Gallery] = load("GalleryJamesWebb.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) in main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
