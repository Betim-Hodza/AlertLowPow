//
//  LowPowView.swift
//  AlertLowPow
//
//  Created by Betim Hodza on 10/23/24.
//

import SwiftUI
import Foundation

struct LowPowView: View {
    @ObservedObject var lowPowViewModel = LowPowViewModel()
    
    var body: some View {
        VStack {
            Text("\(lowPowViewModel.lowPowModel.lowPowerMode.description)")
            Button("Toggle"){
                lowPowViewModel.toggle()
            }.alert(isPresented: $lowPowViewModel.lowPowModel.lowPowerMode) {
                Alert(title: Text("Low Power Mode on"), message: Text("Please turn it off"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

#Preview {
    LowPowView()
}