import SwiftData
import SwiftUI

@Model
class Habit {
    var name: String
    var details: String
    var firstCompleted: Date
    var lastCompleted: Date
    var count: Int? {
        let calendar = Calendar.current
        let startOfDayStartDate = calendar.startOfDay(for: firstCompleted)
        let startOfDayEndDate = calendar.startOfDay(for: lastCompleted)
        let components = calendar.dateComponents([.day], from: startOfDayStartDate, to: startOfDayEndDate)
        return components.day ?? 0
    }
    
    init(name: String, details: String = "") {
        self.name = name
        self.details = details
        self.firstCompleted = Date.now
        self.lastCompleted = Date.now
    }
    
    func needsCompletion() -> Bool {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: Date())
        return lastCompleted < startOfToday
    }
}
