//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Hin, Ethan-Scott (WING) on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    let car = Car(make:"Porsche", model:"911 Turbo", topSpeed:200, acceleration:8.2, handling: 5)
    
    var body: some View {
        VStack{
            Text(car.displayStats())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
