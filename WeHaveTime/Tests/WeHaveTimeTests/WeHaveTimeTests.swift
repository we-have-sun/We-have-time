import XCTest
import SwiftData
@testable import WeHaveTime

final class WeHaveTimeTests: XCTestCase {
    func testExample() throws {
        let time = WeHaveTime()
        let calculate = time.calculateTime()
        
        XCTAssertEqual(calculate, 40)
    }
    func testDatabaseSetup() throws {
        // Arrange
        let manager = DatabaseManager()
        
        // Act
        let container = manager.setupContainer()
        
        // Assert
        XCTAssertNotNil(container)
        
        // Test creating an item
        let context = ModelContext(container)
        let item = TimeEntry(name: "Test Item")
        context.insert(item)
        
        // Verify item was saved
        let descriptor = FetchDescriptor<TimeEntry>()
        let items = try context.fetch(descriptor)
        XCTAssertEqual(items.first?.name, "Test Item")
    }

}
