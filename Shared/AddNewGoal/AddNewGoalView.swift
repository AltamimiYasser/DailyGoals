//
//  AddNewGoalView.swift
//  DailyGoals
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import SwiftUI

struct AddNewGoalView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = AddNewGoalViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .padding()
                }
                
                Spacer()
                
                Button {
                    vm.save { success in
                        if success {
                            dismiss()
                        }
                    }
                } label: {
                    Text("Create")
                        .bold()
                        .padding()
                }
            }
            Divider()
            Form {
                Section {
                    TextField("title", text: $vm.title)
                }
                
                Section("Icon") {
                    Picker("Icon", selection: $vm.icon) {
                        ForEach(vm.icons, id: \.self) { icon in
                            Text(icon)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}

struct AddNewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoalView()
    }
}
