//
//  MobiletteDashboardIOSLoginTrelloInteractorIO.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

protocol MobiletteDashboardIOSLoginTrelloInteractorInput: class
{
    func connectUserWithTrello()
}

protocol MobiletteDashboardIOSLoginTrelloInteractorOutput: class
{
    func didConnectUserWithTrello(/* User credentials */)
    func didFailToConnectUserWithTrello(error: ErrorType)
}