//
//  CheckInInterfaceController.swift
//  Watch Extension
//
//  Created by Rani on 2/11/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class CheckInInterfaceController: WKInterfaceController {
  @IBOutlet private var backgroundGroup: WKInterfaceGroup!
  @IBOutlet private var originLabel: WKInterfaceLabel!
  @IBOutlet private var destinationLabel: WKInterfaceLabel!
  
  var flight: Flight? {
    didSet {
      guard let flight = flight else { return }
      
      originLabel.setText(flight.origin)
      destinationLabel.setText(flight.destination)
    }
  }
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
      if let flight = context as? Flight {
        self.flight = flight
      }
    }

  @IBAction func checkInButtonTapped() {
    // 1
    let duration = 0.35
    let delay = DispatchTime.now() + (duration + 0.15)
    // 2
    backgroundGroup.setBackgroundImageNamed("Progress")
    // 3
    backgroundGroup.startAnimatingWithImages(in: NSRange(location: 0, length: 10),
                                             duration: duration,
                                             repeatCount: 1)
    // 4
    DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
      // 5
      self?.flight?.checkedIn = true
      self?.dismiss()
    }
  }
  
}
