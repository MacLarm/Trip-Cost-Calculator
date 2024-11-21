//
//  VehicleBuilderView.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

import SwiftUI

struct VehicleBuilderView: View {
   @ObservedObject var analyzer: TripAnalyzer
   @State var make        = "" // analyzer.getCarMake(0)
   @State var model       = "" // analyzer.getCarModel(0)
   @State var yearString  = "" // analyzer.getCarYear(0)
   @State var mpgString   = "" // analyzer.getCarMPG(0)
   @State var costString  = "" // analyzer.getCarCost(0)
   
    var body: some View {
       VStack {
          Text("Vehicle Builder")
             .font(.title)
          
          Form {
             HStack {
                Text("Make")
                TextField("GMC", text: $make)
                   .textFieldStyle(.roundedBorder)
             }
             
             HStack {
                Text("Model")
                TextField("Envoy", text: $model)
                   .textFieldStyle(.roundedBorder)
             }
             
             HStack {
                Text("Year")
                TextField("2005", text: $yearString)
                   .textFieldStyle(.roundedBorder)
             }
             
             HStack {
                Text("MPG")
                TextField("18", text: $mpgString)
                   .textFieldStyle(.roundedBorder)
             }
             
             HStack {
                Text("Cost per day")
                TextField("0", text: $costString)
                   .textFieldStyle(.roundedBorder)
             }
          }
          
          Button("Add") {
              do {
                 guard let mpg = Double(mpgString) else {
                    throw ConversionError.invalidFormat
                 }
                 guard let year = Int(yearString) else {
                    throw ConversionError.invalidFormat
                 }
                 guard let cost = Double(costString) else {
                    throw ConversionError.invalidFormat
                 }
                 
                 let car = RentalVehicle(make: make,
                                         model: model,
                                         year: year,
                                         milePerGallon: mpg,
                                         costPerDay: cost)
                 
                 analyzer.addCar(car: car)
                 
              } catch ConversionError.invalidFormat {
                  print("Invalid format: cannot convert to double or int")
              } catch {
                  print("An unexpected error occurred: \(error)")
              }
          }
       }
       
    }
}

#Preview {
   VehicleBuilderView(analyzer: analyzer)
}
