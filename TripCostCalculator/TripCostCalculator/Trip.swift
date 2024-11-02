//
//  Trip.swift
//  TripCostCalculator
//
//  Created by Mckay Larman on 11/1/24.
//


class Trip {
   private var miles: Double = 0.0
   private var days: Int = 0
   
   /// initalizer
   init(miles: Double, days: Int) {
      self.miles = miles
      self.days = days
   }
   
   /// Read-only for miles
   ///
   /// -Returns: miles
   func getMiles() -> Double {
      miles
   }
   
   /// Read-only for days
   ///
   /// -Returns: days
   func getDays() -> Int {
      days
   }
}
