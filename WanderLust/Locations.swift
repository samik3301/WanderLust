//
//  Locations.swift
//  WanderLust
//
//  Created by Samik Saraswat on 02/09/23.
//

import Foundation

class Locations: ObservableObject{
    //ObservableObject
    //the reason class is being used is to share the loaded locations.json file everywhere in the project so we don't have to load json file  again and again- reusing the json file content as shared objects within the environments
    let places: [Location] //holding many locations- array
    
    var primary: Location{  //computed property to show the first location 
        places[0]
    }
    
    init() {
        //! means it will work otherwise the app crashes
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")! //finds locations.json within the iOS app bundle
        let data = try! Data(contentsOf: url) //loads all the data of that url within a new constant datatype called data
        //crashing the app is a good practice if we know the app is unsafe and user data is at risk
        places = try! JSONDecoder().decode([Location].self, from: data)
        //convert our json file into array of location objects
    }
}
