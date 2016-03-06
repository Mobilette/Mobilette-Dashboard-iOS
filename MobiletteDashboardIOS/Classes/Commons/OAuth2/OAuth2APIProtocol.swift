//
//  OAuth2APIProtocol.swift
//  MobiletteDashboardIOS
//
//  Created by Romain ASNAR on 31/01/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit
import MobiletteFoundation

protocol OAuth2APIProtocol
{
    func authorize(
        username username: String,
        password: String
        ) -> Promise<MBOAuthCredential>
}
