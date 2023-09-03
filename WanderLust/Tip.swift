//
//  Tip.swift
//  WanderLust
//
//  Created by Samik Saraswat on 03/09/23.
//

import Foundation

struct Tip: Codable{
    let text: String
    let children: [Tip]? //array of Tip
    //representing using optionality -> just in case the children are there or not there
    //it takes into account all the possibilities making the code more robust
     
}
