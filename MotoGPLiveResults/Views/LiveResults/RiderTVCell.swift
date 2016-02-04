//
//  RiderTVCell.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import UIKit

class RiderTVCell: UITableViewCell {

  @IBOutlet private weak var labelName: UILabel!
  @IBOutlet private weak var numberView: ColoredNumber!
  @IBOutlet private weak var lapTimeLabel: UILabel!
  
  var rider: Rider? {
    didSet {
        configureCell()
    }
  }
  
  private func configureCell() {
    if let rider = rider {
      let lightFont = UIFont.systemFontOfSize(24, weight: UIFontWeightLight)
      let mediumFont = UIFont.systemFontOfSize(24, weight: UIFontWeightMedium)
      let string = NSMutableAttributedString(string: rider.name + " ", attributes: [NSFontAttributeName: lightFont])
      string.appendAttributedString(NSAttributedString(string: rider.surname, attributes: [NSFontAttributeName: mediumFont]))
      labelName.attributedText = string
      numberView.number = rider.id
      numberView.fontColor = rider.fontColor
      numberView.bgColor = rider.backgroundColor
    }
  }
}
