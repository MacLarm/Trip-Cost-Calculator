//
//  TripBuilderView.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

import SwiftUI
enum ConversionError: Error {
    case invalidFormat
}

struct TripBuilderView: View {
   @ObservedObject var analyzer: TripAnalyzer
   @State private var milesString = ""
   @State private var daysString = ""
   @State private var gasPriceString = ""
   
    var body: some View {
       VStack {
          Spacer()
          // Header
          Text("Trip")
             .font(.title)
          
          // input feilds
          Form {
             HStack {
                Text("Miles")
                TextField(analyzer.getMiles(), text: $milesString)
                   .textFieldStyle(.roundedBorder)
             }
             HStack {
                Text("Days")
                TextField(analyzer.getDays(), text: $daysString)
                   .textFieldStyle(.roundedBorder)
             }
             HStack {
                Text("Avg. Gas Price")
                TextField(analyzer.getGasPrice(), text: $gasPriceString)
                   .textFieldStyle(.roundedBorder)
             }
          }
          .padding()
          
          Button("Enter") {
              do {
                 guard let miles = Double(milesString) else {
                    throw ConversionError.invalidFormat
                 }
             
                 guard let days = Int(daysString) else {
                    throw ConversionError.invalidFormat
                 }
                 
                 guard let gasPrice = Double(gasPriceString) else {
                    throw ConversionError.invalidFormat
                 }
                  
                 analyzer.setTrip(miles: miles, days: days)
                 analyzer.setGasPrice(price: gasPrice)
                 
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
   TripBuilderView(analyzer: analyzer)
}
