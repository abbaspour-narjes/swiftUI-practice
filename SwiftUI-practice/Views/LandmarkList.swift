//
//  LandmarkList.swift
//  SwiftUI-practice
//
//  Created by Narges Abbaspour on 8/3/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            List(landmarks,id: \.self){ l in
                NavigationLink(destination: LandmarkDetail(landmark: l)) {
                    LandmarkRow(landmark: l)
                }
            }.listStyle(.plain)
                .navigationTitle("Landmarks")
                .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
    
}


