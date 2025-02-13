//
//  RunningTime.swift
//  SyncTime
//
//  Created by Nicho on 04/10/2024.
//

import SwiftUI
import WeHaveTime

public struct RunningTime: View {
    
    let time: TimeEntry
    @State private var elapsedTime: TimeInterval
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    
    public init(time: TimeEntry) {
        self.time = time
        let initialElapsedTime = Date().timeIntervalSince(time.startDate ?? Date.now)
        _elapsedTime = State(initialValue: initialElapsedTime)
    }
    
    public var body: some View {
        Text(WeHaveTime.timeString(interval: elapsedTime))
            .font(.body)
            .monospaced()
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onReceive(timer) { _ in
                elapsedTime = Date().timeIntervalSince(time.startDate ?? Date.now)
            }
    }    
}

