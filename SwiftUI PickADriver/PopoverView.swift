//
//  PopoverView.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import SwiftUI

struct PopoverView: View {
    @State var enteredStudentName: String = ""
    @Binding var showPopover: Bool
    
    @Binding var students: [String]
    
    var body: some View {
        NavigationStack {
            Text("Name must be unique")
            TextField("Enter Student Name", text: $enteredStudentName)
                .onSubmit {
                    if enteredStudentName != "" {
                        students.append(enteredStudentName)
                    }
                    showPopover = false
                }
            Spacer()
            Button("Done") {
                if enteredStudentName != "" {
                    students.append(enteredStudentName)
                }
                showPopover = false
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .navigationTitle("New Student")
            
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        
    }
}
