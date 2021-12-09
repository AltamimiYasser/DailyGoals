//
//  Persistence+Preview.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import CoreData
import Foundation

extension PersistenceController {
    static func addPreviewDate(context: NSManagedObjectContext) {
        addGoal(icon: "🏃‍♂️", title: "Jogging", position: 0, isCompletedToday: true, context: context)
        addGoal(icon: "🧑‍💻", title: "Project", position: 1, isCompletedToday: false, context: context)
        addGoal(icon: "📚", title: "Reading", position: 2, isCompletedToday: false, context: context)
        addGoal(icon: "🍏", title: "Eat Healthy", position: 3, isCompletedToday: true, context: context)
        addGoal(icon: "🍩", title: "Avoid Sugar", position: 4, isCompletedToday: true, context: context)
    }

    static func addGoal(icon: String, title: String, position: Int16, isCompletedToday: Bool, context: NSManagedObjectContext) {
        let goal = DGGoal(context: context)
        goal.id = UUID()
        goal.icon = icon
        goal.title = title
        goal.position = position
        goal.addedOn = Date()
        goal.modifiedOn = Date()

        var records = Set<DGGoalRecord>()

        // records for 7 today, yesterday, the day before...etc, for 7 days
        for i in stride(from: isCompletedToday ? 0 : 1, through: 7, by: 2) {
            let record = DGGoalRecord(context: context)
            record.date = Date().addingTimeInterval(TimeInterval(-i * 864_400)) // 864400 - number of seconds in day
            records.insert(record)
        }
        goal.records = records
    }
}
