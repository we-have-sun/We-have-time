//
//  TimerAttributes.swift
//  WeHaveTime
//
//  Created by Natalia Terlecka on 10/02/2025.
//


#if canImport(ActivityKit)
import ActivityKit
#endif

import SwiftUI

#if os(iOS)
public struct TimerAttributes: ActivityAttributes {
    public typealias TimerStatus = ContentState
    public struct ContentState: Codable, Hashable {
        var startTime: Date
        var projectName: String
        
        public init(startTime: Date, projectName: String) {
            self.startTime = startTime
            self.projectName = projectName
        }
    }
    
    public init() { }
}

#endif
