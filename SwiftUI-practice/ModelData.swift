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


 func loadModel<G:Decodable>(_ fileName: String) -> Result<G,MError>  {
    
   guard let address = Bundle.main.url(forResource: fileName, withExtension: nil)
     else{ return .failure(MError.address)}
     
     guard let content = try? Data(contentsOf: address)
     else{ return .failure(MError.Content)}
     
     let decoder = JSONDecoder()
     guard let model   = try? decoder.decode(G.self, from: content)
     else{ return .failure(MError.convert)}
     
     return .success(model)
}
