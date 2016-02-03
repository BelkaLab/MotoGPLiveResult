//
//  ApiManager.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

class ApiManager {
  //Shared ApiManager instance
  static var sharedInstance = ApiManager()
  
  func getRidersChart() -> [Rider] {
    var mockRidersChart = [Rider]()
    
    for i in 0...10 {
      let rider = Rider(id: i, name: String(i) + "Franco")
      if let  rider = rider {
        mockRidersChart.append(rider)
      }
    }
    
    return mockRidersChart
  }
}
