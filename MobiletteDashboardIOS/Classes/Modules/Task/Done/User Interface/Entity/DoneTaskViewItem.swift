//
//  DoneTaskViewItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class DoneTaskViewItem:
    Equatable,
    CustomStringConvertible
{
    // MARK: - Property
    
    var identifier: String?
    
    // MARK: - Life cycle
    
    init() {}
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ DoneTaskViewItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            + "}" + "\n"
    }
}

extension DoneTaskViewItem
{
    convenience init(doneTaskItem: DoneTaskItem)
    {
        self.init()
        self.identifier = doneTaskItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: DoneTaskViewItem, rhs: DoneTaskViewItem) -> Bool {
    return lhs.identifier == rhs.identifier
}