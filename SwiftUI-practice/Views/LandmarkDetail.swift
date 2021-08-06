//
//  ContentView.swift
//  SwiftUI-practice
//
//  Created by Narges Abbaspour on 8/3/21.
//

import SwiftUI

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    var landmark:Landmark
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ZStack{
                VStack{
                    Mapview(coordinate: landmark.locationCoordinate)
                        .aspectRatio(1.3, contentMode: .fit)
                    Spacer()
                }
                VStack(alignment:.leading){
                    Spacer().aspectRatio(3, contentMode: .fit)
                    CircleImage(image: landmark.image)
                        .padding(.bottom,20)
                    TextView(title: landmark.name, subtitle: landmark.park, locationName: landmark.state)
                    Divider()
                    
                    Text("About \(landmark.name)").font(.title2)
                    Text(landmark.description)
                        .font(.subheadline)
                    
                    Spacer()
                }
            }
        }.ignoresSafeArea()
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
            
        
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}

//MARK: - Mapview

struct Mapview: View {
    var coordinate: CLLocationCoordinate2D
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
        
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

//MARK: - CircleImage

struct CircleImage: View {
    var image :Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 5.0))
            .shadow(radius: 12)
        
    }
}

//MARK: - TextView

struct TextView: View {
    var title       :String
    var subtitle    :String
    var locationName: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.title)
            
            HStack{
                Text(subtitle)
                    .font(.subheadline)
                
                Spacer()
                Text(locationName)
                    .font(.subheadline)
            }.foregroundColor(.secondary)
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}
