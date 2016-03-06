//
//  MBDUserLoginNetworkController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import PromiseKit
// import ObjectMapper

class MBDUserLoginNetworkController: MBDUserLoginNetworkProtocol
{
    // MARK: - Property
    
    private let oauthService: OAuth1APIProtocol = OAuth1APIService()
    
    // MARK: - Life cycle

    // MARK: - Network
    
    func authorizeWithTrello() -> Promise<String>
    {
        return Promise<String> { [weak self] fullfil, reject in
            let oauthService: OAuth1APIProtocol = OAuth1APIService()
            oauthService.authorize("trello", password: nil).then { credential -> Void in
                print(credential.token)
                if let token = credential.token {
                    fullfil(token)
                }
                }
                .error { error -> Void in
                    reject(error)
            }
        }
    }
    
    // MARK: - Error
    
    enum MBDUserLoginNetworkControllerError
    {
        case Mapping(String)
        
        var code: Int {
            switch self {
            case .Mapping:
                return 500
            }
        }
        
        var domain: String {
            return "NetworkControllerDomain"
        }
        
        var description: String {
            switch self {
            case .Mapping:
                return "Mapping Error."
            }
        }
        
        var reason: String {
            switch self {
            case .Mapping(let JSONString):
                return "Response string can not be mapped to the object.\nString: \(JSONString)."
            }
        }
        
        var error: NSError {
            let userInfo = [
                NSLocalizedDescriptionKey: self.description,
                NSLocalizedFailureReasonErrorKey: self.reason
            ]
            return NSError(domain: self.domain, code: self.code, userInfo: userInfo)
        }
    }
}