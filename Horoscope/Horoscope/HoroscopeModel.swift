//
//  HoroscopeModel.swift
//  Horoscope
//
//  Created by Ian Bailey on 1/13/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import Foundation


struct Horoscope: Decodable {
    var sunsign: String
    var date: String
    var horoscope: String
    var mood: String
    var keywords: String
}
