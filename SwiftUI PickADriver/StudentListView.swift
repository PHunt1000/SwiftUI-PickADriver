//
//  StudentListView.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import SwiftUI

struct StudentListView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State var classData: ClassData
    
    @State var showPopover = false
    @State var enteredStudentName: String = ""
    @State private var isSelectingDriver = false
    @State private var displayedNames: [String] = []
    
    var body: some View {
        VStack {
            Text("Period: \(classData.periodNumber)")
                .font(.largeTitle)
                .padding(25)
            
            Spacer()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(displayedNames, id: \.self) { currentStudent in
                    Text(currentStudent)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onLongPressGesture(minimumDuration: 0.3) {
                            let nameToRemove = currentStudent
                            displayedNames.removeAll { $0 == nameToRemove }
                        }
                }
            }
            Spacer()
            
            Button(action: {
                if self.classData.names.count > 1 {
                    self.isSelectingDriver.toggle()
                    if self.isSelectingDriver {
                        // Start the driver selection process
                        self.pickDriver()
                    }
                }
            }, label: {
                VStack {
                    Image(systemName: isSelectingDriver ? "stop.fill" : "play.fill")
                        .font(.system(size: 35))
                        .padding(5)
                    Text(isSelectingDriver ? "Stop Picking" : "Pick A Driver")
                        .font(.subheadline)
                }
            })
            
            Spacer()
            
            Text("Press and hold to delete a name")
            
            Spacer()
            
            Button(action: {
                showPopover.toggle()
                modelContext.insert(classData)
            }, label: {
                VStack {
                    Image(systemName: "plus.app")
                        .font(.system(size: 35))
                        .padding(5)
                    Text("Add Student Name")
                        .font(.subheadline)
                }
            })
            .sheet(isPresented: $showPopover) {
                PopoverView(showPopover: $showPopover, students: $classData.names)
                
            }
        }
        .onAppear {
            // Initialize displayedNames with the original array of student names:
            self.displayedNames = self.classData.names
        }
        .onChange(of: classData.names) { oldValue, newValue in
            // Update displayedNames when the original data changes:
            self.displayedNames = self.classData.names
        }
    }
    private func pickDriver() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.isSelectingDriver && self.displayedNames.count > 1 {
                let randomIndex = Int.random(in: 0..<self.displayedNames.count)
                self.displayedNames.remove(at: randomIndex)
            } else {
                timer.invalidate()
                isSelectingDriver.toggle()
            }
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView(classData: ClassData(periodNumber: 1, names: ["Sue", "Bob", "Chris"]))
    }
}
