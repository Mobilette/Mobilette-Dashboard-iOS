//
//  Task.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class Task:
    Equatable,
    CustomStringConvertible
{
    // MARK: - Property
    
    var identifier: String? = nil
    
    // MARK: - Life cycle
    
    init() {}
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ Task" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            + "}" + "\n"
    }
}

extension Task
{
    convenience init(doneTaskJSONItem: DoneTaskJSONItem)
    {
        self.init()
        self.identifier = doneTaskJSONItem.identifier
    }
}

extension DoneTaskItem
{
    convenience init(task: Task)
    {
        self.init()
        self.identifier = task.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: Task, rhs: Task) -> Bool {
    return lhs.identifier == rhs.identifier
}