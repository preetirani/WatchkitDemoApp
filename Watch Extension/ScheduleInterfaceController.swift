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
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    presentController(withName: "Flight", context: flight)
  }
}
