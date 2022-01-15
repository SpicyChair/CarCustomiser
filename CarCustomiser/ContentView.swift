//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Hin, Ethan-Scott (WING) on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentCar:Int = 0 {
        didSet {
            if currentCar >= starterCars.cars.count {
                currentCar = 0
            }
        }
    }
    @State private var exhaustPackage:Bool = false
    @State private var tiresPackage:Bool = false
    //the state determines what is shown on the screen
    @State private var starterCars = StarterCars()
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (get: {exhaustPackage},
                                                   set: {newValue in
                                                    self.exhaustPackage = newValue
                                                    if self.exhaustPackage {
                                                        self.starterCars.cars[currentCar].topSpeed += 10
                                                        self.starterCars.cars[currentCar].acceleration -= 0.3
                                                        
                                                    } else {
                                                        self.starterCars.cars[currentCar].topSpeed -= 10
                                                        self.starterCars.cars[currentCar].acceleration += 0.3
                                                    }
                                                    
                                                   })
        let tiresPackageBinding = Binding<Bool> (get: {tiresPackage},
                                                 set: {newValue in
                                                    self.tiresPackage = newValue
                                                    if self.tiresPackage {
                                                        self.starterCars.cars[currentCar].handling += 2
                                                    } else {
                                                        self.starterCars.cars[currentCar].handling -= 2
                                                    }
                                                 })
        
        Form {
        VStack(alignment: .leading, spacing: 20){
            Text(starterCars.cars[currentCar % 4].displayStats())
            Button("Next Car", action:{
                currentCar = currentCar + 1
            })
            
            
        }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Racing Tires Package", isOn: tiresPackageBinding)
            }
        
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
