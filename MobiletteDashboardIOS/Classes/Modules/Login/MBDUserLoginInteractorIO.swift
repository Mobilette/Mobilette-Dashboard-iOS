//
//  MBDUserLoginInteractorIO.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

protocol MBDUserLoginInteractorInput: class
{
    func connectUserWithTrello()
}

protocol MBDUserLoginInteractorOutput: class
{
    func didConnectUserWithTrello(/* User credentials */)
    func didFailToConnectUserWithTrello(error: NSError)
}