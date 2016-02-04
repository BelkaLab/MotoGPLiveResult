//
//  NSTimeInterval+lapTimeString.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 04/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import Foundation

extension NSTimeInterval {
  func lapTimeString() -> String {
    var output = ""
    
    let minutes = floor(self / 60)
    let seconds = self - (minutes * 60)
    let intMinutes = Int(minutes)
    
    output = "\(intMinutes)'\(seconds)"
    
    return output
  }
}
