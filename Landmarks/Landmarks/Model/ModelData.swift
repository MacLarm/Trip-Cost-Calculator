//
//  ModelData.swift
//  Landmarks
//
//  Created by Mckay Larman on 11/19/24.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
   let data: Data
   
   // Load file from main bundle
   guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
   else {
      fatalError("Couldn't find \(filename) in main bundle.")
   }
   
   // Populate data.
   do {
      data = try Data (contentsOf: file)
   } catch {
      fatalError("Coudn't find \(filename) from main bundle:\n\(error) ")
   }
   
   // Decode data
   do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
   } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
   }
}
