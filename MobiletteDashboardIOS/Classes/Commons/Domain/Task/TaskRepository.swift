//
//  TaskRepository.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class TaskRepository:
    Equatable,
    CustomStringConvertible
{
    // MARK: - Property
    
    var tasks: [Task] = []
    
    // MARK: - Life cycle
    
    init() {}
    
    // MARK: - Repository
    
    func addTasks(tasks: [Task])
    {
        self.tasks.appendContentsOf(tasks)
    }
    
    func addTask(task: Task)
    {
        self.tasks.append(task)
    }
    
    func removeAllTasks()
    {
        self.tasks.removeAll(keepCapacity: false)
    }
    
    func removeTask(task: Task)
    {
        if let index = self.tasks.indexOf(task) {
            self.tasks.removeAtIndex(index)
        }
    }
    
    func findAllTasks() -> [Task]
    {
        return self.tasks
    }
    
    func findTaskWithIdentifier(identifier: String?) -> [Task]
    {
        return self.tasks.filter({
            return $0.identifier == identifier
        })
    }
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ TaskRepository" + "\n"
            + "tasks: \(self.tasks)" + "\n"
            + "}" + "\n"
    }
}

// MARK: - Equatable protocol

func ==(lhs: TaskRepository, rhs: TaskRepository) -> Bool {
    return lhs.tasks == rhs.tasks
}