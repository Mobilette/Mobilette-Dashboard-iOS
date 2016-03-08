//
//  MDTaskDoneNetworkProtocol.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit

protocol MDTaskDoneNetworkProtocol: class
{
    func fetchTasksDone() -> Promise<[DoneTaskJSONItem]>
}