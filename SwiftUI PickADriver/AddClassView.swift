//
//  AddClassView.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import SwiftUI

struct AddClassView: View {
    
    //   var classRoster: ClassData
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showAddClassTextField = false
    @State private var newClassPeriod: String = ""
    
    var body: some View {
        Button(action: {
            showAddClassTextField.toggle()
        }, label: {
            VStack {
                Image(systemName: "plus.app")
                    .font(.system(size: 35))
                    .padding(5)
                Text("Add Another Class")
                    .font(.subheadline)
            }
        })
        
        
        if showAddClassTextField {
            HStack {
                TextField("Enter class period number", text: $newClassPeriod)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        addClass()
                    }
                Button("Add Class") {
                    addClass()
                }
            }
        }
    }
    
    private func addClass() {
        if let period = Int(newClassPeriod) {
            let newClass = ClassData(periodNumber: period, names: [])
            // insert the classes array into SwiftData:
            modelContext.insert(newClass)
        }
        // Reset the text field and hide it
        newClassPeriod = ""
        showAddClassTextField.toggle()
    }
}
    
    #Preview {
        AddClassView()
    }
