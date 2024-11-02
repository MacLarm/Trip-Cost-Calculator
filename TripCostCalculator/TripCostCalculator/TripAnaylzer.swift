//
//  TripAnaylzer.swift
//  TripCostCalculator
//
//  Created by Mckay Larman on 11/1/24.
//


/// A class of compareing costs of different vehicles on a trip
class TripAnaylzer {
   private var trip: Trip
   private var gasPrice: Double
   private var cars: [Vehicle] = []
   
   /// Initializer
   init(trip: Trip, gasPrice: Double, _ cars: Vehicle...) {
      self.trip = trip
      self.gasPrice = gasPrice
      // You can pass in as many cars as you want, so we need to appened them to the array
      for car in cars {
         self.cars.append(car)
      }
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
