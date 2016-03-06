//
//  MobiletteDashboardIOSLoginTrelloViewController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift

class MobiletteDashboardIOSLoginTrelloViewController:
    UIViewController,
    MobiletteDashboardIOSLoginTrelloViewInterface
{
	// MARK: - Property

    var presenter: MobiletteDashboardIOSLoginTrelloModuleInterface? = nil

	// MARK: - Life cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter?.updateView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trelloConnectButton(sender: UIButton?)
    {
        let oauthswift = OAuth1Swift(
            consumerKey:    "d0d775fa9641cb751701dd0d5b6d97b8",
            consumerSecret: "8af70198205893baed05fc8639a743c575afedfca505533920219d4fc58aea31",
            requestTokenUrl:    "https://trello.com/1/OAuthGetRequestToken",
            authorizeUrl:       "https://trello.com/1/OAuthAuthorizeToken",
            accessTokenUrl:     "https://trello.com/1/OAuthGetAccessToken"
        )
        oauthswift.authorizeWithCallbackURL(
            NSURL(string: "https://oauthswift.herokuapp.com/callback/trello")!,
            success: { credential, response, parameters in
                print(credential.oauth_token)
                print(credential.oauth_token_secret)
                print(parameters["user_id"])
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
    }
}
