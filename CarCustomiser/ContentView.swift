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
            engineUpgrade = false
            coins = 100
            
            if currentCar >= starterCars.cars.count {
                currentCar = 0
            }
        }
    }
    @State private var coins:Int = 100
    let exhaustCost:Int = 50
    let tiresCost:Int = 30
    let engineCost:Int = 75
    
    
    
    @State private var exhaustPackage:Bool = false
    @State private var tiresPackage:Bool = false
    @State private var engineUpgrade:Bool = false
    
    //the state determines what is shown on the screen
    @State private var starterCars = StarterCars()
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (get: {exhaustPackage},
                                                   set: {newValue in
                            
                                                    self.exhaustPackage = newValue
                                                    print(newValue)
                                                    if self.exhaustPackage {
                                                        self.starterCars.cars[currentCar].topSpeed += 10
                                                        self.starterCars.cars[currentCar].acceleration -= 0.3
                                                        self.coins -= self.exhaustCost
                                                        
                                                    } else {
                                                        self.starterCars.cars[currentCar].topSpeed -= 10
                                                        self.starterCars.cars[currentCar].acceleration += 0.3
                                                        self.coins += self.exhaustCost
                                                    }
                                                   
                                                    
                                                   })
        let tiresPackageBinding = Binding<Bool> (get: {tiresPackage},
                                                 set: {newValue in
                                                    
                                                    //check if user has enough funds or already owns package
                                                    self.tiresPackage = newValue
                                                    if self.tiresPackage {
                                                        self.starterCars.cars[currentCar].handling += 2
                                                        self.coins -= self.tiresCost
                                                    } else {
                                                        self.starterCars.cars[currentCar].handling -= 2
                                                        self.coins += self.tiresCost
                                                    }
                                             
                                                
                                                 })
        let engineBinding = Binding<Bool> (get: {engineUpgrade},
                                           set: {newValue in
                                              
                                              //check if user has enough funds or already owns package
                                              self.engineUpgrade = newValue
                                              if self.engineUpgrade {
                                                    self.starterCars.cars[currentCar].topSpeed += 27
                                                    self.starterCars.cars[currentCar].acceleration -= 0.7
                                                    self.coins -= self.engineCost
                                              } else {
                                                    self.starterCars.cars[currentCar].topSpeed -= 27
                                                    self.starterCars.cars[currentCar].acceleration += 0.7
                                                    self.coins += self.engineCost
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
                Toggle("Exhaust Package (Costs \(exhaustCost))", isOn: exhaustPackageBinding).disabled(exhaustCost > coins && !exhaustPackage)
                Toggle("Racing Tires Package (Costs \(tiresCost))", isOn: tiresPackageBinding).disabled(tiresCost > coins && !tiresPackage)
                Toggle("Engine Upgrade (Costs \(engineCost))", isOn: engineBinding).disabled(engineCost > coins && !engineUpgrade)
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
