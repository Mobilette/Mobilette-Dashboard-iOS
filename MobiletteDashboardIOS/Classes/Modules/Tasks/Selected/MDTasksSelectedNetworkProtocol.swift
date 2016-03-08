//
//  MDTasksSelectedNetworkProtocol.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit

protocol MDTasksSelectedNetworkProtocol: class
{
    func fetchTaskTrelloSelected() -> Promise<[SelectedTaskJSONItem]>
}