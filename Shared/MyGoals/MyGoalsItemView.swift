//
//  MyGoalsItemView.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import SwiftUI

struct MyGoalsItemView: View {
    @ObservedObject var goal: DGGoal
    var body: some View {
        VStack {
            Text(goal.icon).font(.system(size: 60))
            Text(goal.title)
                .font(.footnote)
                .foregroundColor(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fill)
        .padding(4)
        .background(Color.glBackgroundColor)
        .cornerRadius(8.0)
        .shadow(color: .gray, radius: 3, x: 0, y: 0)
    }
}

struct MyGoalsItemView_Previews: PreviewProvider {
    private static var goal: DGGoal {
        let goal = DGGoal(context: PersistenceController.preview.container.viewContext)
        goal.id = UUID()
        goal.icon = "🏃‍♂️"
        goal.title = "Jogging A lot of the time"
        goal.position = 0
        goal.addedOn = Date()
        goal.modifiedOn = Date()
        return goal
    }
    
    static var previews: some View {
        MyGoalsItemView(goal: goal)
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
