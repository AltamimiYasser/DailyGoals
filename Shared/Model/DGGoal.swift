//
//  DGGoal.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import CoreData
import Foundation

@objc(DGGoal)
final class DGGoal: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var icon: String
    @NSManaged var title: String
    @NSManaged var position: Int16
    @NSManaged var addedOn: Date
    @NSManaged var modifiedOn: Date
    @NSManaged var isRemoved: Bool
    @NSManaged var records: Set<DGGoalRecord>?
}

extension DGGoal {
    class func fetchRequest() -> NSFetchRequest<DGGoal> {
        let request = NSFetchRequest<DGGoal>(entityName: "DGGoal")
        request.predicate = NSPredicate(format: "isRemoved = false")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \DGGoal.position, ascending: true)]
        return request
    }
}

extension DGGoal: Identifiable {}
