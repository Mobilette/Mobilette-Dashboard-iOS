//
//  OAuth2PasswordGrantService.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 25/01/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import p2_OAuth2
import MobiletteFoundation
import PromiseKit

class OAuth2PasswordGrantService: OAuth2APIProtocol
{
    // MARK: - Property
    
    private let oauth2 = OAuth2PasswordGrant(settings: [
        "client_id": "<# Client ID#>",
        "client_secret": "<# Client secret#>",
        "authorize_uri": "<# Authorize uri#>",
        "token_uri": "<# Token uri #>",
        "verbose": true,
        "keychain": false
        ] as OAuth2JSON)
    
    func authorize(
        username username: String,
        password: String
        ) -> Promise<MBOAuthCredential>
    {
        return Promise<MBOAuthCredential> { [weak self] fullfil, reject in
            let credential: MBOAuthCredential
            do {
                credential = try MBOAuthCredential.retreiveCredential(userIdentifier: username)
            }
            catch _ as MBError {
                self?.performAuthorize(username: username, password: password)
                    .then { credential -> Void in
                        fullfil(credential)
                }
                    .error { error in
                        reject(error)
                }
                return
            }
            catch _ {
                let error = MBUserDefaultsError.Unknown(0)
                reject(error.error)
                return
            }
            fullfil(credential)
        }
    }
    
    private func performAuthorize(
        username username: String,
        password: String
        ) -> Promise<MBOAuthCredential>
    {
        return Promise<MBOAuthCredential> { fullfil, reject in
            oauth2.username = username
            oauth2.password = password
            
            oauth2.onAuthorize = { [weak self] parameters in
                if let credential = self?.buildCredential(parameters, username: username) {
                    do {
                        try credential.storeToKeychain()
                    }
                    catch let error as MBError {
                        reject(error.error)
                        return
                    }
                    catch _ {
                        let error = MBUserDefaultsError.Unknown(0)
                        reject(error.error)
                        return
                    }
                    fullfil(credential)
                }
                else {
                    // TODO: reject with specific error
                }
            }
            oauth2.onFailure = { error in
                if let error = error {
                    reject(error)
                }
            }
            oauth2.authorize()
        }
    }
    
    private func buildCredential(parameters: OAuth2JSON, username: String) -> MBOAuthCredential?
    {
        if let refreshToken = parameters["refresh_token"],
            let accessToken = parameters["access_token"],
            let date = parameters["expires_in"] as? NSDate
        {
            let credential = MBOAuthCredential(userIdentifier: username, accessToken: "\(accessToken)", refreshToken: "\(refreshToken)", expirationDate: date)
            return credential
        }
        return nil
    }
}
