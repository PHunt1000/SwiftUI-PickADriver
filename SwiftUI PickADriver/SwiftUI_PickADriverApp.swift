//
//  SwiftUI_PickADriverApp.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import SwiftUI
import SwiftData

@main
//struct SwiftUI_PickADriverApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(for: ClassData.self)
//    }
//}

struct PickADriver_HackwichApp: App {
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: ClassData.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
