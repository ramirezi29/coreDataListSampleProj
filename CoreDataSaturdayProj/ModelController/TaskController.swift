//
//  TaskController.swift
//  CoreDataSaturdayProj
//
//  Created by Ivan Ramirez on 3/16/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    // MARK: -  Shared Instance
    static let shared = TaskController()
    private init() {}
    
    // MARK: -  Source of Truth
    
    // MARK: - CRUD
    
    func createTask(name: String, dueDate: Date, notes: String) {
        Task(name: name, dueDate: dueDate, notes: notes)
        saveToPersistenceStore()
    }
    
    func updateTask(task: Task, name: String, dueDate: Date, notes: String) {
        task.name = name
        task.dueDate = dueDate
        task.notes = notes
        saveToPersistenceStore()
    }
    
    func deleteTask(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistenceStore()
    }
    
    // MARK: - Persistence
    private func saveToPersistenceStore(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error Saving To Persistent Store \(error) \n\(error.localizedDescription)")
        }
    }
    
    // MARK: - Fetch
    let fetchResultsController: NSFetchedResultsController<Task> = {
       //create fetch request
        let fetchRequest: NSFetchRequest = Task.fetchRequest()
        let completeSort = NSSortDescriptor(key: "isComplete", ascending: true)
        
        fetchRequest.sortDescriptors = [completeSort]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: - Other func
    func toggleComplete(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistenceStore()
    }
}
