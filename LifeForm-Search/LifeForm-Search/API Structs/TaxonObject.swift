//
//  PageObject.swift
//  LifeForm-Search
//
//  Created by Tyler Radke on 1/22/23.
//

import Foundation

struct TaxonObject: Codable {
  //  var identifier: Int

    var scientificName: String
    
 //   var name: String
    
  //  var nameAccordingTo: String
    
   // var dataObjects: [imageURL]
}


struct BaseObject: Codable {
    var taxonConcept: TaxonObject
    
}

struct imageURL: Codable {
    var eolMediaURl: String
}
