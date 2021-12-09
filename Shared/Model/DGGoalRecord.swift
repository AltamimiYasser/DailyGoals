//
//  DGGoalRecord.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import Foundation
import CoreData

@objc(DGGoalRecord)
final class DGGoalRecord: NSManagedObject {
    @NSManaged var date: Date
    @NSManaged var goal: DGGoal?
}

extension DGGoalRecord {
    class func fetchRequest() -> NSFetchRequest<DGGoalRecord> {
        let request = NSFetchRequest<DGGoalRecord>()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \DGGoalRecord.date, ascending: false)]
        return request
    }
}

extension DGGoalRecord: Identifiable { }
