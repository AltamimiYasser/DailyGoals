//
//  ContentView.swift
//  Shared
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: DGGoal.fetchRequest())
    private var goals: FetchedResults<DGGoal>

    var body: some View {
        List {
            ForEach(goals) { goal in
                HStack {
                    Text(goal.title)
                    Text(goal.icon)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
