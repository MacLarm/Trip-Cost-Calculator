//
//  TripAnaylzer.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

import Foundation

/// A class of compareing costs of different vehicles on a trip
class TripAnalyzer: Identifiable, ObservableObject {
   @Published var trip: Trip
   @Published var gasPrice: Double
   @Published var cars: [RentalVehicle] = []
   
   /// Initializer
   init(trip: Trip, gasPrice: Double, _ cars: RentalVehicle...) {
      self.trip = trip
      self.gasPrice = gasPrice
      // You can pass in as many cars as you want, so we need to appened them to the array
      for car in cars {
         self.cars.append(car)
      }
   }
   
   init() {
      self.trip = Trip()
      self.gasPrice = 0
      self.cars = []
   }
   
   func getCarsList() -> [RentalVehicle] {
      cars
   }
   
   /// TRIP
   func setTrip(miles: Double, days: Int) {
      trip.setDays(days: days)
      trip.setMiles(miles: miles)
   }
   
   func setGasPrice(price: Double) {
      gasPrice = price
   }
   
   func getMiles() -> String {
      String(trip.getMiles())
   }
   
   func getDays() -> String {
      String(trip.getDays())
   }
   
   func getGasPrice() -> String {
      String(gasPrice)
   }
   
   /// CAR
   func addCar(car: RentalVehicle) {
      cars.append(car)
   }
   
   func getCarMake(_ i: Int) -> String {
      cars[i].getMake()
   }
   
   func getCarModel(_ i: Int) -> String {
      cars[i].getModel()
   }
   
   func getCarYear(_ i: Int) -> String {
      String(cars[i].getYear())
   }
   
   func getCarMPG(_ i: Int) -> String {
      String(cars[i].getMPG())
   }
   
   func getCarCost(_ i: Int) -> String {
      String(cars[i].getRenalCost())
   }
   
   /// Displays the results compareing the costs of all the cars.
   func displaySummary() {
      // Variables for printing the costs
      var cost: Double
      var costString: String
      
      // Loop through each vehicle
      for car in cars {
         // Display the car's info
         car.displayVehicleInfo()
         
         // Set up the cost for printing.
         cost = getCost(vehicle: car)
         costString = String(format: "%.2f", cost)
         
         // Print the costs.
         print("Cost for this trip: $\(costString)")
         print()
      }
      print()
   }
   
   /// Get the cost of one vehicle on the trip.
   ///
   /// -Paramaters: vehicle
   /// -Returns: How much that car would cost on this trip
   func getCost(vehicle: Vehicle) -> Double {
      // we will use this constant to make it more readable.
      let miles = trip.getMiles()
      var cost = 0.0
      
      // Add how much we will spend on gas for the trip
      cost += vehicle.pricePerMile(gasPrice: gasPrice) * miles
      
      // Check to see if it is a rental vehicle, and add rental fees
      if let rental = vehicle as? RentalVehicle {
         cost += rental.rentalFees(numDays: trip.getDays())
      }
      return cost
   }
}
