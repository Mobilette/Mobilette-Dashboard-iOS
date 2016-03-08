//
//  DoneTaskJSONItem.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import ObjectMapper

class DoneTaskJSONItem:
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
        return "{ DoneTaskJSONItem" + "\n"
            + "identifier: \(self.identifier)" + "\n"
            + "}" + "\n"
    }
}

extension DoneTaskItem
{
    convenience init(doneTaskJSONItem: DoneTaskJSONItem)
    {
        self.init()
        self.identifier = doneTaskJSONItem.identifier
    }
}

// MARK: - Equatable protocol

func ==(lhs: DoneTaskJSONItem, rhs: DoneTaskJSONItem) -> Bool {
    return lhs.identifier == rhs.identifier
}