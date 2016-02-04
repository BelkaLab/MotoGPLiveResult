//
//  LiveResults.swift
//  MotoGPLiveResults
//
//  Created by Massimo Frasson on 03/02/16.
//  Copyright © 2016 Belka. All rights reserved.
//

import UIKit
import Dwifft

class LiveResults: UITableViewController {
  
  private var dataSource = [Rider]() {
    didSet {
      self.diffCalculator?.rows = dataSource
    }
  }
  
  private var diffCalculator: TableViewDiffCalculator<Rider>?
  private var timer: NSTimer?
  
  //Lifecycle methods
  override func viewDidLoad() {
    setupTableView()
    reloadData()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    setupRefresh()
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    timer?.invalidate()
  }
  
  private func setupRefresh() {
    //lanciare refresh in altro tread
    timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "reloadData", userInfo: nil, repeats: true)
  }
  
  private func setupTableView() {
    diffCalculator = TableViewDiffCalculator<Rider>(tableView: self.tableView, initialRows: dataSource)
  }
  
  func reloadData() {
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
