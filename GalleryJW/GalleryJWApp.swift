//
//  GalleryJWApp.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 15/07/22.
//

import SwiftUI

@main
struct GalleryJWApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
