//
//  OAuth1APIService.swift
//  MobiletteDashboardIOS
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import MobiletteFoundation
import PromiseKit
import OAuthSwift

class OAuth1APIService: OAuth1APIProtocol {
    
    private let oauthswift = OAuth1Swift(
        consumerKey: "d0d775fa9641cb751701dd0d5b6d97b8",
        consumerSecret: "8af70198205893baed05fc8639a743c575afedfca505533920219d4fc58aea31",
        requestTokenUrl: "https://trello.com/1/OAuthGetRequestToken",
        authorizeUrl: "https://trello.com/1/OAuthAuthorizeToken",
        accessTokenUrl: "https://trello.com/1/OAuthGetAccessToken"
    )

    func authorize() -> Promise<MBOAuthCredential>
    {
        return Promise<MBOAuthCredential> { [weak self] fullfil, reject in
            let credential: MBOAuthCredential
            do {
                credential = try MBOAuthCredential.retreiveCredential()
            }
            catch _ as MBError {
                self?.performAuthorize()
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
    
    private func performAuthorize() -> Promise<MBOAuthCredential>
    {
        return Promise<MBOAuthCredential> { fullfil, reject in
            
            
            oauthswift.authorizeWithCallbackURL(
                NSURL(string: "https://oauthswift.herokuapp.com/callback/trello")!,
                success: { credential, response, parameters in
                    print(credential.oauth_token)
//                    print(credential.oauth_token_secret)
//                    print(parameters["user_id"])
                    
                    if let credential = self.buildCredential(credential) {
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
                },
                failure: { error in
                    reject(error)
                }
            )
        }
    }
    
    private func buildCredential(parameters: OAuthSwiftCredential) -> MBOAuthCredential?
    {
//        if let refreshToken = parameters["refresh_token"],
//            let accessToken = parameters["access_token"],
//            let date = parameters["expires_in"] as? NSDate
//        {
//            let credential = MBOAuthCredential(userIdentifier: username, accessToken: "\(accessToken)", refreshToken: "\(refreshToken)", expirationDate: date)
//            return credential
//        }
        return nil
    }
}