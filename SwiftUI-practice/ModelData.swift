//
//  ModelData.swift
//  Landmarks
//
//  Created by Narges Abbaspour on 8/1/21.
//

import Foundation
import SwiftUI

enum MError:Error{
    case address
    case Content
    case convert
}

var landmarks: [Landmark] = loadModel("landmarkData.json")

func loadModel<G:Decodable>(_ filename: String) -> G  {
    
    guard let address = Bundle.main.url(forResource: filename, withExtension: nil)
    else{ fatalError("Couldn't find \(filename) in main bundle.")}
    
    guard let content = try? Data(contentsOf: address)
    else{  fatalError("Couldn't load \(filename) ")}
    
    let decoder = JSONDecoder()
    guard let model   = try? decoder.decode(G.self, from: content)
    else{ fatalError("Couldn't parse \(filename) ")}
    
    return model
}
