//
//  MyGoalsView.swift
//  Shared
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import CoreData
import SwiftUI

struct MyGoalsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: DGGoal.fetchRequest())
    private var goals: FetchedResults<DGGoal>
    @State private var navigationButtonID = UUID()

    @State private var showingAddNew = false
    private var columns: [GridItem] { [GridItem(.adaptive(minimum: 100, maximum: 160), spacing: 10)] }

    var body: some View {
        NavigationView {
            Group {
                if goals.isEmpty {
                    Text("No goals yet")
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(goals) { goal in
                                MyGoalsItemView(goal: goal)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(Text("Goals"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addNewButton
                }
            }
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showingAddNew) {
            showingAddNew = false
        } content: {
            AddNewGoalView()
                .onDisappear {
                    navigationButtonID = UUID()
                }
        }

    }

    private var addNewButton: some View {
        Button {
            showingAddNew = true
        } label: {
            Text("New")
        }
        .id(navigationButtonID)
    }
}

struct MyGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        MyGoalsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
