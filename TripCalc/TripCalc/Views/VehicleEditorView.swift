//
//  VehicleEditorView.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/20/24.
//

import SwiftUI

struct VehicleEditorView: View {
//   @ObservedObject var car: RentalVehicle
   @State var car: RentalVehicle
   @State var make        = "" //car.getMake()
   @State var model       = "" //car.getModel()
   @State var yearString  = "" //car.getYear()
   @State var mpgString   = "" //car.getMPG()
   @State var costString  = "" //car.getRenalCost()
   
   var body: some View {
      VStack {
         Text("Vehicle Info")
            .font(.title)
         
         Form {
            HStack {
               Text("Make")
               Spacer()
               Text(car.getMake())
            }
            .frame(alignment: .leading)
            
            HStack {
               Text("Model")
               Spacer()
               Text(car.getModel())
            }
            .frame(alignment: .leading)
            
            HStack {
               Text("Year")
               Spacer()
               Text(String(car.getYear()))
            }
            .frame(alignment: .leading)
            
            HStack {
               Text("MPG")
               Spacer()
               Text(String(car.getMPG()))
            }
            .frame(alignment: .leading)
            
            HStack {
               Text("Cost per day")
               Spacer()
               Text(String(car.getRenalCost()))
            }
            .frame(alignment: .leading)
         }
      }
   }
}

#Preview {
   VehicleEditorView(car: RentalVehicle(make: "GMC", model: "Envoy", year: 2005, milePerGallon: 17, costPerDay: 0.0))
}
