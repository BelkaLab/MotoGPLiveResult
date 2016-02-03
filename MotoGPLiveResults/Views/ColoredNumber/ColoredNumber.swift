//
//  ColoredNumber.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import UIKit

class ColoredNumber: UIView {
  
  @IBOutlet private weak var numberLabel: UILabel!
  
  var bgColor: UIColor? {
    didSet{
      if let bgColor = bgColor {
        self.layer.backgroundColor = bgColor.CGColor
      }
    }
  }

  var fontColor: UIColor? {
    didSet{
      if let fontColor = fontColor {
        numberLabel.textColor = fontColor
      }
    }
  }
  
  var number: Int? {
    didSet{
      if let number = number {
        numberLabel.text = String(number)
      }
    }
  }
  
  override func drawRect(rect: CGRect) {
    super.drawRect(rect)
    
    self.clipsToBounds = true
    self.layer.cornerRadius = rect.height/2
  }
}
