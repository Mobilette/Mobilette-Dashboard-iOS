//
//  TaskItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class TaskItem:
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
            //+ "<# property name #>: \(self.<# property name #>)" + "\n"
            + "}" + "\n"
    }
}

// MARK: - Equatable protocol

func ==(lhs: TaskItem, rhs: TaskItem) -> Bool {
    return lhs.identifier == rhs.identifier
}