//
//  FlightRowController.swift
//  Watch Extension
//
//  Created by Rani on 2/7/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject {

    @IBOutlet weak var separator: WKInterfaceSeparator!
    @IBOutlet weak var originLabel: WKInterfaceLabel!
    @IBOutlet weak var destinationLabel: WKInterfaceLabel!
    @IBOutlet weak var flightNumberLabel: WKInterfaceLabel!
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    @IBOutlet weak var planeImage: WKInterfaceImage!
    
    // 1
    var flight: Flight? {
        // 2
        didSet {
            // 3
            guard let flight = flight else { return }
            // 4
            originLabel.setText(flight.origin)
            destinationLabel.setText(flight.destination)
            flightNumberLabel.setText(flight.number)
            // 5
            if flight.onSchedule {
                statusLabel.setText("On Time")
            } else {
                statusLabel.setText("Delayed")
                statusLabel.setTextColor(.red)
            }
        }
    }
    
  func updateForCheckIn() {
    let color = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    planeImage.setTintColor(color)
    separator.setColor(color)
  }
}
