//
//  Vehicle.swift
//  TripCostCalculator
//
//  Created by Mckay Larman on 11/1/24.
//

class Vehicle {
   // Member Variables
   private var make: String = ""
   private var model: String = ""
   private var year: Int = 0
   private var milePerGallon: Double = 0.0
   
   // Init
   init(make: String, model: String, year: Int, milePerGallon: Double) {
      self.make = make
      self.model = model
      self.year = year
      self.milePerGallon = milePerGallon
   }
   
   func calcMPG(miles: Double, gallon: Double) {
      milePerGallon = miles / gallon
   }
   
   func getMPG() -> Double {
      milePerGallon
   }
   
   func displayVehicleInfo() {
      print(" Vehicle Info")
      print("===============")
      print("  Make:  \(make)")
      print("  Model: \(model)")
      print("  Year:  \(year)")
      print("  MPG:   \(milePerGallon)")
      print("---------------")
   }
   
}
