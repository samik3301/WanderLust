//
//  Location.swift
//  WanderLust
//
//  Created by Samik Saraswat on 02/09/23.
//

import Foundation

struct Location: Codable,Identifiable{ //changed from decodable to codable -> changes to parse the json file data
    //need to map the data from json file to the struct
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    //this ds is needed to tell what kind of data json file has for each object
    //this ds is used to unpack the json stuff from Locations and then feed it to our modifier instances to update in real time
    
    static let example = Location(id: 1, name: "Great Smokey Mountains", country: "United States", description: "The Great Smokey Mountains text.", more: "More about the great Smokey Mountains.", latitude: 35.23245, longitude: -83.125467, heroPicture: "smokies", advisory: "Beware of the bears!")
    //making example as static to let swift know we are only making it once not every instance [fixes the error]
}

