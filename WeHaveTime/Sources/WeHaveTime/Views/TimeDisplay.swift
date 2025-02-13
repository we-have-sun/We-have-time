
import SwiftUI
import SwiftData
import WeHaveTime

@Observable
public class ProjectModel {
    public var project: TimeEntry
    
    public init(project: TimeEntry) {
        self.project = project
    }
}

public struct TimeDisplay: View {
   
    public var project: ProjectModel
    
    public init(project: TimeEntry) {
        let projectModel = ProjectModel(project: project)
        self.project = projectModel
    }
    
    public var body: some View {
        ForEach(project.project.subentries) { time in
            if time.isRunning {
                RunningTime(time: time)
            } else {
                Text("Past Duration: \(time.duration)")
                    .font(.caption)
            }
            
            
        }
    }
}
