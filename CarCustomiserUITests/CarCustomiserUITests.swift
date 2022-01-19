//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Hin, Ethan-Scott (WING) on 14/01/2022.
//

import XCTest

class CarCustomiserUITests: XCTestCase {


    func CheckSwitchDisabledWhenOutOfFunds() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (Costs 50)"]/*[[".cells[\"Exhaust Package (Costs 50)\"].switches[\"Exhaust Package (Costs 50)\"]",".switches[\"Exhaust Package (Costs 50)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Racing Tires Package (Costs 30)"]/*[[".cells[\"Racing Tires Package (Costs 30)\"].switches[\"Racing Tires Package (Costs 30)\"]",".switches[\"Racing Tires Package (Costs 30)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(!tablesQuery/*@START_MENU_TOKEN@*/.switches["Engine Upgrade (Costs 75)"]/*[[".cells[\"Engine Upgrade (Costs 75)\"].switches[\"Engine Upgrade (Costs 75)\"]",".switches[\"Engine Upgrade (Costs 75)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled)
    

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func CheckUpgradesCanBeResoldIfNoFunds() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (Costs 50)"]/*[[".cells[\"Exhaust Package (Costs 50)\"].switches[\"Exhaust Package (Costs 50)\"]",".switches[\"Exhaust Package (Costs 50)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Racing Tires Package (Costs 30)"]/*[[".cells[\"Racing Tires Package (Costs 30)\"].switches[\"Racing Tires Package (Costs 30)\"]",".switches[\"Racing Tires Package (Costs 30)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (Costs 50)"]/*[[".cells[\"Exhaust Package (Costs 50)\"].switches[\"Exhaust Package (Costs 50)\"]",".switches[\"Exhaust Package (Costs 50)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Racing Tires Package (Costs 30)"]/*[[".cells[\"Racing Tires Package (Costs 30)\"].switches[\"Racing Tires Package (Costs 30)\"]",".switches[\"Racing Tires Package (Costs 30)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
