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
//        self.circleLayer?.backgroundColor = bgColor.CGColor
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
  }
}
