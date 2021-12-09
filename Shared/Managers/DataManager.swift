//
//  DataManager.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import CoreData
import Foundation

protocol GoalDataManagerProtocol {
    func createGoal(title: String, icon: String)
}

typealias DataManagerProtocol = GoalDataManagerProtocol

final class DataManger {
    static let shared = DataManger()

    private let persistenceController: PersistenceController
    private var context: NSManagedObjectContext { persistenceController.container.viewContext }

    init(persistenceController: PersistenceController = .shared) {
        self.persistenceController = persistenceController
    }
}

// MARK: - GoalDataManagerProtocol

extension DataManger: GoalDataManagerProtocol {
    func createGoal(title: String, icon: String) {
        context.performAndWait {
            let request: NSFetchRequest<DGGoal> = DGGoal.fetchRequest()
            do {
                let goals = try context.fetch(request)
                for (index, goal) in goals.enumerated() {
                    goal.position = Int16(index + 1) // +1 so we leave 0 open for the one we will add
                }
                
                let goal = DGGoal(context: context)
                goal.id = UUID()
                goal.title = title
                goal.icon = icon
                goal.position = 0 // so at the top
                goal.addedOn = Date()
                goal.modifiedOn = Date()
                
                try context.save()
                
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
