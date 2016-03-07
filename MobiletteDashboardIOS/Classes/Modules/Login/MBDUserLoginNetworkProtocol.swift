//
//  MBDUserLoginNetworkProtocol.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit

protocol MBDUserLoginNetworkProtocol: class
{
    func authorizeWithTrello() -> Promise<String>
}