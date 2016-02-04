//
//  ApiManager.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import Darwin
import UIKit

class ApiManager {
  //Shared ApiManager instance
  static var sharedInstance = ApiManager()
  
  func getRidersChart() -> [Rider] {
    var mockRidersChart = [Rider]()
    let numbers = [99, 46, 93, 26, 38]
    let names = ["Jorge", "Valentino", "Marc", "Dani", "Bradlay"]
    let surnames = ["Lorenzo", "Rossi", "Marquez", "Pedrosa", "Smith"]
    let colors: [UIColor] = [.blueColor(), .blueColor(), .redColor(), .redColor(), .blackColor()]
    let fontColors: [UIColor] = [.redColor(), .yellowColor(), .whiteColor(), .whiteColor(), .orangeColor()]
    
    for i in 0...names.count-1 {
      let rider = Rider(id: numbers[i], name: names[i],surname: surnames[i], backgroundColor: colors[i], fontColor: fontColors[i])
      if let  rider = rider {
        mockRidersChart.append(rider)
      }
    }
    
    return ApiManager.randomArrayOfStuff(mockRidersChart)
  }
  
  //Almost the same random function used from jflinter (the creator of dwifft)
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
