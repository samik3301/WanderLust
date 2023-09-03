//
//  WorldView.swift
//  WanderLust
//
//  Created by Samik Saraswat on 03/09/23.
//

import MapKit //SwiftUI dont contain the Maps
import SwiftUI

struct WorldView: View {
    @EnvironmentObject var locations: Locations
    //defining the starting region
    //State means dynamically shared with SwiftUI- data is imp dont destroy
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    //the 2D coordinates are for centering the map at london
    //the span coordinates lets you pan around the map

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: locations.places
        ){
            //adding stuff on the map using the location object and the map annotations to add the flags of each unique country present in our json file
            location in //conform to Identifiable -> make it unique for every value
            MapAnnotation(coordinate: CLLocationCoordinate2D(
                latitude: location.latitude,
                longitude: location.longitude
            )){
                NavigationLink(destination: ContentView(location: location)){
                    //moving our flag inside the navigation view to add more stuff related to that flag country to pop up when you press the flag
                    
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 50, height: 20 )
                        .shadow(radius: 3) //for transparent flags like japan
                }
                
            }
        }
            //need 2 way binding -> $ read and write both
        .navigationTitle("Locations")
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
