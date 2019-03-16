//
//  Task+Conv.swift
//  CoreDataSaturdayProj
//
//  Created by Ivan Ramirez on 3/16/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    // NOTE: - Gave context a default value
    // NOTE: - If values are given new properties than they will override whats writting in the .xcdatamodeld file file
    convenience init(name: String, dueDate: Date, notes: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        // NOTE: - In order to not over ride the context already set in the .xcdatamodeld file -> self.init(context: context)
        self.init(context: context)
        
        self.name = name
        self.dueDate = dueDate
        self.notes = notes
//        self.isComplete = isComplete
    }
    
}

