//
//  WanderLustApp.swift
//  WanderLust
//
//  Created by Samik Saraswat on 02/09/23.
//

import SwiftUI

@main
struct WanderLustApp: App {
    @StateObject var locations = Locations() //handles the classes
    //requires Locations conform to ObservableObject ->imp
    
    var body: some Scene {
        WindowGroup {
            TabView(){
                NavigationView(){ //fix the overlapping with the navigation bar - adds a navigation view at top
                    ContentView(location: locations.primary)  //decides what's the first thing to show as soon as the app is launched
                    //primary instance loads the first json object -> in our case its the highlands
                }
                .tabItem{ //adds an icon in the tab as an tabitem
                    Image(systemName: "airplane.circle.fill") //built in system icons-SF Symbols
                    //SF icons are vectors -> resizable and weights - skinny or thick icons
                    Text("Discover") //the tab icon name
                }
                NavigationView{
                    WorldView()
                }
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Locations")
                }
                NavigationView{
                    TipsView()
                }
                .tabItem{
                    Image(systemName: "questionmark.circle.fill")
                    Text("FAQ")
                }
            }
            .environmentObject(locations) //passing the object in the environment ->locations shared with everything
            
        }
    }
}
