//
//  LocationCell.swift
//  Landmarks
//
//  Created by Narges Abbaspour on 8/1/21.
//

import SwiftUI
import MapKit

struct LocationCell: View {
    var body: some View {
        ZStack{
            VStack{
                Mapview().aspectRatio(1.8, contentMode: .fit)
                Spacer()
            }
            VStack(){
                Spacer().aspectRatio(1.8 * 1.8, contentMode: .fit)
                CircleImage()
                TextView()
                Divider()
                HStack{
                    VStack(alignment:.leading){
                        Text("Description abou there").font(.title2)
                        Text("explain some paragrph here")
                            .font(.subheadline)
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                }
                Spacer()
            }
        }
        
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell()
    }
}

//MARK: - Mapview

 struct Mapview: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
                                           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

//MARK: - CircleImage

 struct CircleImage: View {
    var body: some View {
        Image("netherland")
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 5.0))
            .shadow(radius: 12
            )
        
    }
}

//MARK: - TextView

 struct TextView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Turtle rock!")
                .font(.title)
            
            HStack{
                Text("place name")
                    .font(.subheadline)
                
                Spacer()
                Text("location")
                    .font(.subheadline)
            }.foregroundColor(.secondary)
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}
