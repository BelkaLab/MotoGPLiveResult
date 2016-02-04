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
  
  private var dataSource: [Rider]?
  
  func getRidersChart() -> [Rider] {
    //If there is an existing datasource I just change one rider lapTime
    //Else I'm goigng to create a datasource
    if let dataSource = dataSource {
      let randomIndex = Int(arc4random()) % dataSource.count
      dataSource[randomIndex].generateRandomLapTime()
    }else {
      //Mock datasource values
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
      dataSource = mockRidersChart
    }
    
    dataSource!.sortInPlace { (rider1, rider2) -> Bool in
      return rider1.lapTime < rider2.lapTime
    }
    return dataSource!
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
