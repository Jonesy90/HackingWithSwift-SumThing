//
//  CellView.swift
//  HackingWithSwift-SumThing
//
//  Created by Michael Jones on 09/04/2026.
//

import SwiftUI

struct CellView: View {
    let number: Int
    let isSelected: Bool
    var onSelected: () -> Void
    
    var displayNumber: String {
        if number == 0 {
            return ""
        } else {
            return String(number)
        }
    }
    
    var body: some View {
        Button(action: onSelected) {
            Text(displayNumber)
                .font(.largeTitle)
                .monospacedDigit() // Numbers take up the same amount of room, no matter what value they have.
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit) // It will stay in a square box the entire time. It won't be stretched.
                .foregroundStyle(isSelected ? .white : .primary)
                .background(isSelected ? .blue : .clear)
                .border(.primary.opacity(0.3), width: 1)
                .contentShape(Rectangle()) // Make the whole thing tap anywhere to trigger the button.
        }
        .buttonStyle(.plain) // The system will not try to colour the whole button for us.
    }
}

#Preview {
    CellView(number: 7, isSelected: true, onSelected: {})
}
