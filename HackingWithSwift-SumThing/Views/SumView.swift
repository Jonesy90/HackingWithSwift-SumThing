//
//  SumView.swift
//  HackingWithSwift-SumThing
//
//  Created by Michael Jones on 09/04/2026.
//

import SwiftUI

struct SumView: View {
    @ScaledMetric(relativeTo: .title) var frameWidth = 50
    
    var number: Int
    
    var body: some View {
        Text(String(number))
            .font(.title)
            .monospacedDigit()
            .frame(width: frameWidth, height: frameWidth)
        
        
    }
}

#Preview {
    SumView(number: 9)
}
