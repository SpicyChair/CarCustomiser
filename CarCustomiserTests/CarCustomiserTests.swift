//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Hin, Ethan-Scott (WING) on 14/01/2022.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesCarWithAllAttributesSet() {
    
        let car = Car(make:"Porsche", model:"911 Turbo", topSpeed:200, acceleration:8.2, handling: 5)
        
        XCTAssertEqual(car.make, "Porsche")
        XCTAssertEqual(car.model, "911 Turbo")
        XCTAssertEqual(car.topSpeed, 200)
        XCTAssertEqual(car.acceleration, 8.2)
        XCTAssertEqual(car.handling, 5)
        
        
    }
    
    func testCarReturnsFormattedAttributesOnDisplayStats() {
        let car = Car(make:"Porsche", model:"911 Turbo", topSpeed:200, acceleration:8.2, handling: 5)
        
        XCTAssertEqual(car.displayStats(), "Make: Porsche\nModel: 911 Turbo\nTop Speed: 200mph\nAcceleration: 8.2s\nHandling: 5")
    }
    

}
