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
  
  var rider: Rider? {
    didSet {
        configureCell()
    }
  }
  
  private func configureCell() {
    if let rider = rider {
      labelName.text = rider.name + " " + rider.surname
      numberView.number = rider.id
      numberView.fontColor = rider.fontColor
      numberView.bgColor = rider.backgroundColor
    }
  }
}
