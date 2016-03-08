//
//  SelectedTaskItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class SelectedTaskItem:
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

// MARK: - Equatable protocol

func ==(lhs: SelectedTaskItem, rhs: SelectedTaskItem) -> Bool {
    return lhs.identifier == rhs.identifier
}