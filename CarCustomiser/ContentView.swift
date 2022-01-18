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
            exhaustPackage = false
            tiresPackage = false
            
            if currentCar >= starterCars.cars.count {
                currentCar = 0
            }
        }
    }
    @State private var coins:Int = 100
    let exhaustCost:Int = 65
    let tiresCost:Int = 35
    
    
    
    @State private var exhaustPackage:Bool = false
    @State private var tiresPackage:Bool = false
    //the state determines what is shown on the screen
    @State private var starterCars = StarterCars()
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (get: {exhaustPackage},
                                                   set: {newValue in
                                                    if self.coins >= self.exhaustCost || self.exhaustPackage {
                                                        //check if user has enough funds or already owns package
                                                        self.exhaustPackage = newValue
                                                        if self.exhaustPackage {
                                                            self.starterCars.cars[currentCar].topSpeed += 10
                                                            self.starterCars.cars[currentCar].acceleration -= 0.3
                                                            self.coins -= self.exhaustCost
                                                            
                                                        } else {
                                                            self.starterCars.cars[currentCar].topSpeed -= 10
                                                            self.starterCars.cars[currentCar].acceleration += 0.3
                                                            self.coins += self.exhaustCost
                                                        }
                                                    } else {
                                                        Alert(
                                                            title: Text("Error"),
                                                            message: Text("Not enough funds!")
                                                        )
                                                        //do something with the alert
                                                    }
                                                    
                                                   })
        let tiresPackageBinding = Binding<Bool> (get: {tiresPackage},
                                                 set: {newValue in
                                                    if self.coins >= self.tiresCost || self.tiresPackage {
                                                        //check if user has enough funds or already owns package
                                                        self.tiresPackage = newValue
                                                        if self.tiresPackage {
                                                            self.starterCars.cars[currentCar].handling += 2
                                                            self.coins -= self.tiresCost
                                                        } else {
                                                            self.starterCars.cars[currentCar].handling -= 2
                                                            self.coins += self.tiresCost
                                                        }
                                                    } else {
                                                        Alert(
                                                            title: Text("Error"),
                                                            message: Text("Not enough funds!")
                                                        )
                                                        //do something with the alert
                                                    }
                                                    
                                                 })
        
        Form {
        VStack(alignment: .leading, spacing: 20){
            Text(starterCars.cars[currentCar].displayStats())
            Button("Next Car", action:{
                currentCar = currentCar + 1
            })
            
            
        }
            Section {
                Toggle("Exhaust Package (Costs \(exhaustCost))", isOn: exhaustPackageBinding)
                Toggle("Racing Tires Package (Costs \(tiresCost))", isOn: tiresPackageBinding)
            }
            Section {
                Text("Available Funds: \(coins)")
            }
        
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
