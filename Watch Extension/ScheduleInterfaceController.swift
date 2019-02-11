//
//  ScheduleInterfaceController.swift
//  Watch Extension
//
//  Created by Rani on 2/7/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {
    @IBOutlet weak var flightTable: WKInterfaceTable!
    var flights = Flight.allFlights()
  var selectedIndex: Int = 0
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
      
      for index in 0...flightTable.numberOfRows {
        guard let controller = flightTable.rowController(at: index) as? FlightRowController else {
          continue
        }
        controller.flight = flights[index]
      }
    }
  
  override func didAppear() {
    super.didAppear()
    guard flights[selectedIndex].checkedIn, let controller = flightTable.rowController(at: selectedIndex) as? FlightRowController else {
      return
    }
    animate(withDuration: 0.35) {
      controller.updateForCheckIn()
    }
  }
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    selectedIndex = rowIndex
    let flight = flights[rowIndex]
    let controllers = ["Flight", "CheckIn"]
    presentController(withNames: controllers, contexts: [flight, flight])
  }
}
