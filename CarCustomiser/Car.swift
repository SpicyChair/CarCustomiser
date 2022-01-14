//
//  Car.swift
//  CarCustomiser
//
//  Created by Hin, Ethan-Scott (WING) on 14/01/2022.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration:Double
    var handling:Int
    
    func displayStats () -> String {
        return "Make: \(make)\nModel: \(model)\nTop Speed: \(topSpeed)mph\nAcceleration: \(acceleration)s\nHandling: \(handling)"
    }
    
}
