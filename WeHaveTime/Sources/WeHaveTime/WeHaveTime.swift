// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftData

import Foundation

public struct WeHaveTime {
    public static func timeString(interval: TimeInterval) -> String {
        let hours = Int(interval) / 3600
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        let milliseconds = Int((interval - floor(interval)) * 1000)
        return String(format: "%02ih%02imn%02is%03i", hours, minutes, seconds, milliseconds)
    }
}
