//
//  SelectedTaskJSONItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import ObjectMapper

class SelectedTaskJSONItem:
    Equatable,
    CustomStringConvertible,
    Mappable
{
    // MARK: - Property

    var identifier: String?

    // MARK: - Life cycle

    init() {}
    
    // MARK: - Mappable protocol

    required init?(_ map: Map)
    {
        mapping(map)
    }
    
    func mapping(map: Map)
    {
        identifier <- map["id"]
    }
    
    // MARK: - Printable protocol
    
    var description: String {
        return "{ SelectedTaskJSONItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            //+ "<# property name #>: \(self.<# property name #>)" + "\n"
            + "}" + "\n"
    }
}

extension SelectedTaskItem
{
    convenience init(selectedTaskJSONItem: SelectedTaskJSONItem)
    {
        self.init()
        self.identifier = selectedTaskJSONItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: SelectedTaskJSONItem, rhs: SelectedTaskJSONItem) -> Bool {
    return lhs.identifier == rhs.identifier
}