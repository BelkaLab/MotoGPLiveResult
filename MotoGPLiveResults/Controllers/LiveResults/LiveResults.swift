//
//  LiveResults.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import UIKit

class LiveResults: UITableViewController {
  
  private var dataSource = [Rider]()
  
  //Lifecycle methods
  override func viewDidLoad() {
    dataSource = ApiManager.sharedInstance.getRidersChart()
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Race 1"
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("RiderCell") as? RiderTVCell
    cell!.rider = dataSource[indexPath.row]
    return cell!
  }
}
