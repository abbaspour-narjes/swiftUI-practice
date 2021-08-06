//
//  LandmarkList.swift
//  SwiftUI-practice
//
//  Created by Narges Abbaspour on 8/3/21.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showOnlyFav:Bool  = false
    
    var filteredLandmarks : [Landmark] {
        return landmarks.filter{ !showOnlyFav || $0.isFavorite }
    }
    
    
    var body: some View {
        
        NavigationView{
            List{
                Toggle("Favorites only",isOn: $showOnlyFav)
                ForEach(filteredLandmarks,id: \.self) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }.listStyle(.plain)
                    .navigationTitle("Landmarks")
                    .navigationBarTitleDisplayMode(.large)
                
            }.listStyle(.inset)
            .animation(.spring().delay(3.0))
        
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
    
}


