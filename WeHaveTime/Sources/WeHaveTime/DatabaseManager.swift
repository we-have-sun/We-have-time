//
//  File.swift
//  
//
//  Created by Natalia Terlecka on 19/12/2024.
//

import SwiftData
import Foundation

@Model
public final class TimeEntry {
    public var name: String = "Untitled TimeEntry"
    public var createdAt: Date
    
    public var duration: Int64 = 0
    public var isRunning: Bool = false
    public var startDate: Date? = Date.now
    public var endDate: Date? = nil

    public var subentries: [TimeEntry] = [TimeEntry]()
    public var parent: TimeEntry?
    
    public var hasRunningTimers: Bool {
        return subentries.contains { $0.isRunning }
    }
    
    public init(name: String, createdAt: Date = .now) {
        self.name = name
        self.createdAt = createdAt
    }
   
    public init(name: String, duration: Int64, startDate: Date, endDate: Date? = nil, parent: TimeEntry? = nil, isRunning: Bool, createdAt: Date = .now) {
        self.name = name
        self.duration = duration
        self.startDate = startDate
        self.endDate = endDate
        self.isRunning = isRunning
        self.parent = parent
        self.createdAt = createdAt
    }

    public func calculatedDuration() -> Int64 {
        return Int64(endDate?.timeIntervalSince(startDate!) ?? 0)
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = TimeEntry(name: name, duration: duration, startDate:startDate ?? Date.now, endDate: endDate ?? Date.now, isRunning: isRunning)
        return copy
    }
}

public struct DatabaseManager {
    public init() {}
    
    // Setup the SwiftData container
    public func setupContainer() -> ModelContainer {
        let schema = Schema([
            TimeEntry.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    public static func createProject(name: String = "", modelContext: ModelContext) throws -> TimeEntry {
        let project = TimeEntry(name: name, createdAt: .now)
        modelContext.insert(project)
        try modelContext.save()
        return project
    }
    
    public static func deleteAllProjects(modelContext: ModelContext) -> Bool {
        do {
            try modelContext.delete(model: TimeEntry.self)
            try modelContext.save()
            return true
        } catch {
            print("Failed to clear TimeEntry records: \(error)")
            return false
        }
    }
}
