//
//  TaskJSONItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import ObjectMapper

class TaskJSONItem:
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
        return "{ TaskJSONItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            + "}" + "\n"
    }
}

extension TaskItem
{
    convenience init(taskJSONItem: TaskJSONItem)
    {
        self.init()
        self.identifier = taskJSONItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: TaskJSONItem, rhs: TaskJSONItem) -> Bool {
    return lhs.identifier == rhs.identifier
}