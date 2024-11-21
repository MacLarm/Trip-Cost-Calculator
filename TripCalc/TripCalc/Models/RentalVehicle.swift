//
//  RentalVehicle.swift
//  TripCalc
//
//  Created by Mckay Larman on 11/19/24.
//

/// Like a vehicle class, but with a cost per day added.
class RentalVehicle : Vehicle {
   private var costPerDay: Double = 0.0
   
   init(make: String, model: String, year: Int, milePerGallon: Double, costPerDay: Double) {
      super.init(make: make, model: model, year: year, milePerGallon: milePerGallon)
      self.costPerDay = costPerDay
   }
   
   /// Display info on the rental.
   override func displayVehicleInfo() {
      print("      Vehicle Info")
      print("=========================")
      print("  Make:          \(getMake())")
      print("  Model:         \(getModel())")
      print("  Year:          \(getYear())")
      print("  MPG:           \(getMPG())")
      print("  Rental Costs: $\(costPerDay)")
      print("-------------------------")
   }
   
   override func getRenalCost() -> Double {
      costPerDay
   }
   
   
   /// Tells you how much would be spent on rental fees for a given time.
   ///
   /// -Paramaters: the number of days the rental will be had
   /// -Returns: The rental fee
   func rentalFees(numDays: Int) -> Double {
      return costPerDay * Double(numDays)
   }
}
