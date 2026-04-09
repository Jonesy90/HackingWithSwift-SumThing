//
//  ContentView.swift
//  HackingWithSwift-SumThing
//
//  Created by Michael Jones on 09/04/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var board = Board(.medium)
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Grid(horizontalSpacing: 2, verticalSpacing: 2) {
                    ForEach(0..<board.exampleCells.count, id: \.self) { row in
                        GridRow {
                            let userRow = board.userCells[row]
                            
                            ForEach(0..<userRow.count, id: \.self) { col in
                                let selected = row == board.selectedRow && col == board.selectedCol
                                
                                CellView(number: userRow[col], isSelected: selected) {
                                    board.selectedRow = row
                                    board.selectedCol = col
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle(Text("SumThing"))
        }
    }
}

#Preview {
    ContentView()
}
