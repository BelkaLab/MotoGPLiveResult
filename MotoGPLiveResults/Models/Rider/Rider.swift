//
//  Rider.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

func == (lhs: Rider, rhs: Rider) -> Bool {
  return lhs.id == rhs.id
}

class Rider: Equatable {
  
  //Public get fields
  private(set) var id: Int
  private(set) var name: String
  
  //Initializers
  init?(id: Int, name: String) {
    self.id = id
    self.name = name
    
    if name.isEmpty {
      return nil
    }
  }
}
