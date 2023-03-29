//
//  Club.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-04-04.
//

import Foundation

struct Club {
    var name: String
    var nickname: String
    var city: String
    var stadium: Stadium
    var desc: String
    var europeanChampion: [Int]
    var franceChampion: [Int]
}

struct Stadium {
    var name: String
    var lat: Double
    var lon: Double
    var capacity: Int
}
