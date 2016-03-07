//
//  SelectedTaskViewItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class SelectedTaskViewItem:
    Equatable,
    CustomStringConvertible
{
    // MARK: - Property
    
    var identifier: String?
    
    // MARK: - Life cycle
    
    init() {}
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ SelectedTaskJSONItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            //+ "<# property name #>: \(self.<# property name #>)" + "\n"
            + "}" + "\n"
    }
}

extension SelectedTaskViewItem
{
    convenience init(selectedTaskItem: SelectedTaskItem)
    {
        self.init()
        self.identifier = selectedTaskItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: SelectedTaskViewItem, rhs: SelectedTaskViewItem) -> Bool {
    return lhs.identifier == rhs.identifier
}