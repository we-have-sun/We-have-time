//
//  File.swift
//  
//
//  Created by Natalia Terlecka on 19/12/2024.
//

import SwiftData
import Foundation

// Example model
@Model
public final class TimeEntry {
    public var name: String
    public var createdAt: Date
    
    public init(name: String, createdAt: Date = .now) {
        self.name = name
        self.createdAt = createdAt
    }
}


public struct DatabaseManager {
    public init() {}
    
    // Setup the SwiftData container
    public func setupContainer() -> ModelContainer {
        let schema = Schema([
            TimeEntry.self,
            // Add other model types here
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
