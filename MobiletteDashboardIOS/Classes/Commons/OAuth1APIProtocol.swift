//
//  OAuth1APIProtocol.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit
import MobiletteFoundation

protocol OAuth2APIProtocol
{
    func authorize() -> Promise<MBOAuthCredential>
}