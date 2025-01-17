//
//  NavigationModel.swift
//
//
//  Created by Natalia Terlecka on 17/01/2025.
//

import Foundation
import SwiftUI

public class NavigationModel: ObservableObject {
    @Published public var path: [TimeEntry] = []
    @Published public var selectedProject: TimeEntry?
    @Published public var selectedTime: TimeEntry?
    
    public init() {}
}
