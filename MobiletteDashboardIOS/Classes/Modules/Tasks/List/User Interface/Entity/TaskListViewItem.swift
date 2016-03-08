//
//  TaskListViewItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class TaskListViewItem:
    Equatable,
    CustomStringConvertible
{
    // MARK: - Property
    
    var identifier: String?
    
    // MARK: - Life cycle
    
    init() {}
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ TaskJSONItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            + "}" + "\n"
    }
}

extension TaskListViewItem
{
    convenience init(taskItem: TaskItem)
    {
        self.init()
        self.identifier = taskItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: TaskListViewItem, rhs: TaskListViewItem) -> Bool {
    return lhs.identifier == rhs.identifier
}