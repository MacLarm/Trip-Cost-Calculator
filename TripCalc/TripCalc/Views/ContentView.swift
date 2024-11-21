//
//  ContentView.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

import SwiftUI

struct ContentView: View {
   @StateObject private var analyzer = TripAnalyzer()
   
    var body: some View {
       NavigationStack {
          VStack {
             // Heading
             Text("Trip Analyzer")
                .font(.title)
             HStack {
                Spacer()
                   .frame(width: 50)
                Text("Car")
                Spacer()
                Text("Cost")
                Spacer()
                   .frame(width: 50)
             }
             .font(.title2)
             .padding()
             
             // Car list
             List(analyzer.getCarsList()) {car in
                HStack{
                   Text(String(car.getYear()))
                   Text(car.getMake())
                   Text(car.getModel())
                   Spacer()
                   Text("$\(String(format: "%.2f", analyzer.getCost(vehicle: car)))")
                   Spacer()
                      .frame(width: 20)
                }
             }
             
             Spacer()
             
             // Nav Buttons
             HStack {
                Spacer()
                   .frame(width: 75)
                NavigationLink {
                   TripBuilderView(analyzer: analyzer)
                } label: {
                   Text("Trip")
                      .font(.title3)
                      .bold()
                }
                
                Spacer()
                
                NavigationLink{
                   CarsListView(analyzer: analyzer)
                } label: {
                   Text("Cars")
                      .font(.title3)
                      .bold()
                }
                
                Spacer()
                   .frame(width: 75)
             }
          }
       }
    }
}

#Preview {
    ContentView()
}
