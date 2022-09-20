//
//  GalleryHome.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 16/07/22.
//

import SwiftUI

struct GalleryHome: View {
    @EnvironmentObject var modelData: ModelData
    var galleryImage: [Gallery] = ModelData().galleryJW
    @State private var busqueda = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem()], spacing: 20) {
                    ForEach(busqueda == "" ? galleryImage: galleryImage.filter{$0.name.contains(busqueda)}) { gallery in
                        NavigationLink(destination: GalleryDetail(galleryJW: gallery)) {
                            GalleryCard(galleryImage: gallery)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Galería")
        }
        .searchable(text: $busqueda)
    }
}

struct GalleryHome_Previews: PreviewProvider {
    static var previews: some View {
        GalleryHome()
    }
}
