//
//  CarsListView.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/20/24.
//

import SwiftUI

struct CarsListView: View {
   @ObservedObject var analyzer: TripAnalyzer
   
    var body: some View {
       NavigationStack {
          List(analyzer.getCarsList()) { car in
             NavigationLink {
                VehicleEditorView(car: car)
             } label: {
                HStack {
                   Text(String(car.getYear()))
                   Text(car.getMake())
                   Text(car.getModel())
                }
             }
          }
          .navigationTitle("Cars list")
          NavigationLink {
             VehicleBuilderView(analyzer: analyzer)
          } label: {
             Text("Add")
          }
       }
    }
}

#Preview {
   CarsListView(analyzer: analyzer)
}
