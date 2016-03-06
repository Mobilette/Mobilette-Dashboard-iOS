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
        self.presenter?.connectUserWithTrello()
    }
}
