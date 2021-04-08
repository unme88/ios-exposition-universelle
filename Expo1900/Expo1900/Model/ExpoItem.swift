//
//  exposition_universelle_1900.swift
//  Expo1900
//
//  Created by Sunny on 2021/04/07.
//

import Foundation

struct ExpoItem : Decodable {
    let expoTitle, location, description : String
    let numberOfVisitors : Int
    let openingPeriod : Date
    
    enum CodingKeys : String, CodingKey {
        case expoTitle = "title"
        case numberOfVisitors = "visitors"
        case openingPeriod = "duration"
        case location, description
    }
}
