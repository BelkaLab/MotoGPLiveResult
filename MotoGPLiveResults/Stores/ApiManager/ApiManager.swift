//
//  ApiManager.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import Darwin

class ApiManager {
  //Shared ApiManager instance
  static var sharedInstance = ApiManager()
  
  func getRidersChart() -> [Rider] {
    var mockRidersChart = [Rider]()
    let names = ["Beppe", "Franco", "Giovanni"]
    
    for i in 0...names.count-1 {
      let rider = Rider(id: i, name: names[i])
      if let  rider = rider {
        mockRidersChart.append(rider)
      }
    }
    
    return ApiManager.randomArrayOfStuff(mockRidersChart)
  }
  
  //To delete
  private static func randomArrayOfStuff(riders: [Rider]) -> [Rider] {
    var possibleStuff = riders
    for i in 0..<possibleStuff.count - 1 {
      let j = Int(arc4random_uniform(UInt32(possibleStuff.count - i))) + i
      if i != j {
        swap(&possibleStuff[i], &possibleStuff[j])
      }
    }
    return Array(possibleStuff)
  }
}
