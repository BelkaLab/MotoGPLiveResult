//
//  Rider.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import UIKit

func == (lhs: Rider, rhs: Rider) -> Bool {
  return lhs.id == rhs.id
}

class Rider: Equatable {
  
  //Public get fields
  private(set) var id: Int
  private(set) var name: String
  private(set) var surname: String
  private(set) var backgroundColor: UIColor
  private(set) var fontColor: UIColor
  private(set) var lapTime: NSTimeInterval?
  
  //Initializers
  init?(id: Int, name: String, surname: String, backgroundColor: UIColor, fontColor: UIColor) {
    self.id = id
    self.name = name
    self.surname = surname
    self.backgroundColor = backgroundColor
    self.fontColor = fontColor
    self.generateRandomLapTime()
    
    if name.isEmpty || surname.isEmpty {
      return nil
    }
  }
  
  func generateRandomLapTime() {
    lapTime = Double(arc4random() % 60 + 60)
  }
}
