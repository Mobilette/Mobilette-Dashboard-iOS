//
//  MBDUserLoginInteractor.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import MobiletteFoundation
import MBLogger

class MBDUserLoginInteractor:
    MBDUserLoginInteractorInput
{
	// MARK: - Property
    
    weak var output: MBDUserLoginInteractorOutput? = nil
    var networkController: MBDUserLoginNetworkProtocol? = nil

    // MARK: - MBDUserLogin interactor input interface
    
    func connectUserWithTrello()
    {
        self.networkController?.authorizeWithTrello()
        .then { [weak self] JSONItem -> Void in
//        let item = self.<# convert method #>(JSONItem)
//        MBLog.app(MBLog.Level.High, object: "Did <# successful action #>: \(item).")
//        self.output?.didConnectUserWithTrello(item)
        }
        .error { [weak self] error -> Void in
            MBLog.app(MBLog.Level.High, object: "Did fail to connect with trello.")
            self?.output?.didFailToConnectUserWithTrello(error as NSError)
        }
    }

    // MARK: - Converting raw datas
}
