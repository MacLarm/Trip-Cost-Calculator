//
//  Vehicle.swift
//  TripCostCalculator
//
//  Created by Mckay Larman on 11/1/24.
//

/// Basic vehicle class.
class Vehicle {
   // Member Variables
   private var make: String = ""
   private var model: String = ""
   private var year: Int = 0
   private var milePerGallon: Double = 0.0
   
   /// Initalizer for the class.
   init(make: String, model: String, year: Int, milePerGallon: Double) {
      self.make = make
      self.model = model
      self.year = year
      self.milePerGallon = milePerGallon
   }
   
   /// Updates the Miles per Gallon of the object
   ///
   /// -Paramaters:
   ///   -miles: Miles driven on a tank of gas
   ///   -gallon: The number of gallons it took to fill up your gas tank.
   func updateMPG(miles: Double, gallon: Double) {
      milePerGallon = miles / gallon
   }
   
   /// Read-only for make
   ///
   /// -Returns: make
   func getMake() -> String {
      make
   }
   
   /// Read-only for model
   ///
   /// -Returns: model
   func getModel() -> String {
      model
   }
   
   /// Read-only for year
   ///
   /// -Returns: year
   func getYear() -> Int {
      year
   }
   
   /// Read-only for MPG
   ///
   /// -Returns: milePerGallon.
   func getMPG() -> Double {
      milePerGallon
   }
   
   /// Calculate and return how much it costs to go a mile in the vehicle
   ///
   /// -Paramaters: the price of gas
   /// -Returns: the cost of the gas needed to go 1 mile.
   func pricePerMile(gasPrice:Double) -> Double {
      let gallonUsed = 1/milePerGallon
      return gallonUsed * gasPrice
   }
   
   /// Prints to the terminal all important info about a vehicle.
   func displayVehicleInfo() {
      print("  Vehicle Info")
      print("================")
      print("  Make:  \(make)")
      print("  Model: \(model)")
      print("  Year:  \(year)")
      print("  MPG:   \(milePerGallon)")
      print("----------------")
   }
}
