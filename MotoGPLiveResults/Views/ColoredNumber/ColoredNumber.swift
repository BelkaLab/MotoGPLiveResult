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
        self.circleLayer.backgroundColor = bgColor.CGColor
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
  
  private var circleLayer = CALayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCircleView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupCircleView()
  }
  
  private func setupCircleView() {
    setCircleView()
    self.layer.addSublayer(circleLayer)
  }
  
  private func setCircleView() {
    circleLayer.frame = bounds
    circleLayer.cornerRadius = frame.height/2.0
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setCircleView()
    if let last = self.subviews.last {
      if last == numberLabel {
        self.bringSubviewToFront(numberLabel)
      }
    }
  }
}
