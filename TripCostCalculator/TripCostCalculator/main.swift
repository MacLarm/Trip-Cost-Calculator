//
//  main.swift
//  TripCostCalculator
//
//  Created by Mckay Larman on 11/1/24.
//

import Foundation

// Compare two cars
let merle = Vehicle(make: "GMC", model: "Envoy", year: 2005, milePerGallon: 17.0) // your car
let rental = RentalVehicle(make: "Nissan", model: "Rouge",
                           year: 2023, milePerGallon: 38, costPerDay: 56) // a rental

// Trip stats
let stGeorge = Trip(miles: 1100, days: 5)

// Make the summary
let summary = TripAnaylzer(trip: stGeorge, gasPrice: 3.10, merle, rental)
summary.displaySummary()
