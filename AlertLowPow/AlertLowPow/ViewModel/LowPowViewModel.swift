//
//  LowPowViewModel.swift
//  AlertLowPow
//
//  Created by Betim Hodza on 10/23/24.
//

import Foundation
import SwiftUI

class LowPowViewModel: ObservableObject {
    @Published var lowPowModel = LowPowModel( )
    
    init(lowPowModel: LowPowModel = LowPowModel( )) {
        print("initializing")
        self.lowPowModel = lowPowModel
        NotificationCenter.default.addObserver(
            self, selector: #selector(getLowPowStatus), name: NSNotification.Name.NSProcessInfoPowerStateDidChange,
            object: nil
        )
    }
    
    func toggle() {
        print("toggling")
        if (lowPowModel.lowPowerMode == true) {
            lowPowModel.lowPowerMode = false
        }
        else {
            lowPowModel.lowPowerMode = true
        }
    }
    
    @objc func getLowPowStatus(_ notification: Notification) {
        print("getting lowPowStatus")
        DispatchQueue.main.async {
            guard ProcessInfo.processInfo.isLowPowerModeEnabled == true
            else {
                self.lowPowModel.lowPowerMode = false
                self.lowPowModel.showingAlert = false
                return
            }
            self.lowPowModel.lowPowerMode = true
            self.lowPowModel.showingAlert = true
        }
        
    }
    
    // https://www.hackingwithswift.com/example-code/system/how-to-detect-low-power-mode-is-enabled
    func notificationPower() {
        print("notificationPower")
        NotificationCenter.default.addObserver(
            self, selector: #selector(getLowPowStatus), name: NSNotification.Name.NSProcessInfoPowerStateDidChange,
            object: nil
        )
    }
}
