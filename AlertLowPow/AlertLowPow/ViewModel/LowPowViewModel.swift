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
    
    func toggle() {
        if (lowPowModel.lowPowerMode == true) {
            lowPowModel.lowPowerMode = false
        }
        else {
            lowPowModel.lowPowerMode = true
        }
    }
    
    func getLowPowStatus() {
        guard ProcessInfo.processInfo.isLowPowerModeEnabled == true
        else {
            lowPowModel.lowPowerMode = false
            return
        }
        lowPowModel.lowPowerMode = true
    }
}
