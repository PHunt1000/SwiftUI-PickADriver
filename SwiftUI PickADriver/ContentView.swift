//
//  ContentView.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var classes: [ClassData]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(classes) { classData in
                    NavigationLink(destination: StudentListView(classData: classData))
                    {
                        Text("Period: \(classData.periodNumber)")
                    }
                }
            }
            .navigationTitle("Class Rosters")
            .padding(10)
            
            AddClassView()
        }
    }
}

#Preview {
    ContentView()
}
