//
//  MBDUserLoginViewController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit

class MBDUserLoginViewController:
    UIViewController,
    MBDUserLoginViewInterface
{
	// MARK: - Property

    var presenter: MBDUserLoginModuleInterface? = nil

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
    
    // MARK: - User login view interface
    
    func userDidDenyGrantAccess(title title: String, message: String)
    {
        self.displayError(title: title, message: message)
    }
    
    func userDidGrantAccessWithError(title title: String, message: String)
    {
        self.displayError(title: title, message: message)
    }
    
    private func displayError(title title: String, message: String)
    {
        let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    // MARK: - Action
    
    @IBAction func trelloConnectButton(sender: UIButton?)
    {
        self.presenter?.connectUserWithTrello()
    }
}
