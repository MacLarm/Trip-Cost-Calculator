//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Mckay Larman on 11/19/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
       NavigationSplitView {
          // Get list of landmark from json.
          List(landmarks) { landmark in
             NavigationLink { // Destination
                LandmarkDetail(landmark: landmark)
             } label: { // Link descriptor
                LandmarkRow(landmark: landmark)
             }
          }
          .navigationTitle("Landmarks") // Title
       } detail: {
          Text("Select a landmark") // for Ipad
       }
    }
}

#Preview {
    LandmarkList()
}
