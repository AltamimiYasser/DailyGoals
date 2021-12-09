//
//  AddNewGoalViewModel.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import Foundation

final class AddNewGoalViewModel: ObservableObject {
    @Published var title = ""
    @Published var icon = GoalIcon.all[0]
    
    let icons = GoalIcon.all
    private let dataManger: DataManagerProtocol
    
    init(dataManger: DataManagerProtocol = DataManger.shared) {
        self.dataManger = dataManger
    }
    
    func save(completion: (_ success: Bool) -> Void) {
        var success = false
        defer { completion (success) } // this line will only run after the scope of the function scope exists
        guard !title.isEmpty else { return }
        dataManger.createGoal(title: title, icon: icon)
        success = true // if we reach this line that means we successfully created a goal
    }
}
