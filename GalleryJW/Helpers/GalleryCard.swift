//
//  GalleryCard.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 16/07/22.
//

import SwiftUI

struct GalleryCard: View {
    var galleryImage: Gallery
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        galleryImage.image
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(TextOverlay(galleryImage: galleryImage))
    }
}

struct TextOverlay: View {
    var galleryImage: Gallery
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous).fill(gradient)
            VStack(alignment: .leading) {
                Text(galleryImage.name)
                    .font(.title)
                    .bold()
                Text(galleryImage.instrument)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct GalleryCard_Previews: PreviewProvider {
    static var previews: some View {
        GalleryCard(galleryImage: ModelData().galleryJW[0])
    }
}
