//
//  ContentView.swift
//  GalleryJW
//
//  Created by Vincenzo Tipacti Moran on 15/07/22.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        GalleryHome()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
