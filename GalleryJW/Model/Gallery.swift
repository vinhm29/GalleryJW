//
//  Gallery.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 15/07/22.
//

import Foundation
import SwiftUI

struct Gallery: Codable, Identifiable {
    var id: Int
    var name: String
    var instrument: String
    var about: String
    var link: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var imageFull: Image {
        Image(imageName + "_full")
    }
}
