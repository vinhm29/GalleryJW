//
//  GalleryDetail.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 15/07/22.
//

import SwiftUI

struct GalleryDetail: View {
    @Environment(\.dismiss) var dismiss
    var galleryJW: Gallery
    
    // MARK: Boton de atrás customizado
    struct btnback: View {
        let dismiss2: DismissAction
        
        var body: some View {
            Button(action: {
                dismiss2()
            }, label: {
                HStack {
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Atrás")
                        .bold()
                }
                .foregroundColor(.white)
            })
        }
    }
    
    // MARK: Body de la vista
    var body: some View {
            VStack(spacing: 5) {
                galleryJW.image
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(3 / 2, contentMode: .fit)
                    
                ScrollView(.vertical, showsIndicators: false) {
                    Text(galleryJW.name)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing,])
                        
                    Text(galleryJW.instrument)
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text(galleryJW.about)
                            .lineSpacing(8.0)
                    }
                    .padding()
                    
                    Divider()
                    
                    HStack {
                        Text("Más info")
                            .bold()
                        Link(destination: URL(string: galleryJW.link)!, label: {
                            Image(systemName: "link.circle.fill")
                                .font(.largeTitle)
                            Text("NASA")
                        })
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    btnback(dismiss2: self.dismiss)
                }
            }
    }
}

struct GalleryDetail_Previews: PreviewProvider {
    static var previews: some View {
        GalleryDetail(galleryJW: ModelData().galleryJW[1])
    }
}
