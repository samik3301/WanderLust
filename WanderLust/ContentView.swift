//
//  ContentView.swift
//  WanderLust
//
//  Created by Samik Saraswat on 02/09/23.
//

import SwiftUI

struct ContentView: View {
    let location: Location //placeholder
    
    var body: some View {
        ScrollView { //changed VStack to ScrollView to scroll
            /*
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
             */
            //Text("Goodbye, world!")
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text(location.country)
                .font(.title) //smaller title than large title
                .foregroundColor(.secondary)  //secondary color to the primary color
                //.padding(.bottom)
            Text(location.description)
                //.font(.system(size: 16)) //custom font size
            Text("Did you know?")
                .font(.title3)
                //.multilineTextAlignment(.)
                .bold()
                .padding(.top)
            Text(location.more)
        }.navigationTitle("Discover") //adds a navigation bar title
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            ContentView(location: Locations().primary)
        }
    }
}
