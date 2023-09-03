//
//  TipsView.swift
//  WanderLust
//
//  Created by Samik Saraswat on 03/09/23.
//

import SwiftUI

struct TipsView: View {
    let tips : [Tip]
    
    init() {
        //! means it will work otherwise the app crashes
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")! //finds locations.json within the iOS app bundle
        let data = try! Data(contentsOf: url) //loads all the data of that url within a new constant datatype called data
        //crashing the app is a good practice if we know the app is unsafe and user data is at risk
        tips = try! JSONDecoder().decode([Tip].self, from: data)
        //convert our json file into array of Tip into tips objects
    }
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //list forms nice table of data in iOS
        //Note swiftUI does not like having dynamic data
        //it needs to know what makes the data unique
        //id: \.text means read the text property from each tip and use it as an unique identifier
        
        //children: \.children to view the child
        
        
        List(tips, id: \.text, children: \.children) {tips in
            if tips.children != nil {
                //icon+text neatly aligned -> use labels
                Label(tips.text, systemImage: "quote.bubble")
                    .font(.headline) //adjusts the text and positions it uniformly
            }else{
                Text(tips.text)
            }
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
