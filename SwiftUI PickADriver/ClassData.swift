//
//  ClassData.swift
//  SwiftUI PickADriver
//
//  Created by Peggy Hunt on 1/26/24.
//

import Foundation
import SwiftData

/*
 - NOTE - if this were a Struct instead of a class, we wouldn't need the initializer, but since it's a class, we need the init
 */

@Model
class ClassData: Identifiable {
    var id = UUID()
    var periodNumber: Int
    var names: [String]
    
    init(periodNumber: Int, names: [String]) {
        self.periodNumber = periodNumber
        self.names = names
    }
    
//        func addStudent(_ studentName: String) {
//            names.append(studentName)
//        }
//    
//        func removeStudent(id: UUID) {
//        if let index = self.names.firstIndex(where: { $0.id == id }) {
//            self.names.remove(at: index)
//        }
//    }
}
