//
//  TripCalcApp.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

import SwiftUI

var trip = Trip(miles: 2000, days: 2)
var samurai = RentalVehicle(make: "Suzuki", model: "Samurai", year: 1988, milePerGallon: 25, costPerDay: 0)
var gmc = RentalVehicle(make: "GMC", model: "ENVOY", year: 2005, milePerGallon: 16, costPerDay: 0)
var rental = RentalVehicle(make: "Toyota", model: "Prius", year: 2024, milePerGallon: 51, costPerDay: 120)
var analyzer = TripAnalyzer(trip: trip, gasPrice: 3, samurai, gmc, rental)

@main
struct TripCalcApp: App {
   
   @StateObject private var analyzer = TripAnalyzer()
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(analyzer)
        }
    }
}
