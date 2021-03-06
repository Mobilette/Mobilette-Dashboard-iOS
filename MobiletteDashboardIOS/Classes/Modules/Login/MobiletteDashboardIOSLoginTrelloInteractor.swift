//
//  MobiletteDashboardIOSLoginTrelloInteractor.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class MobiletteDashboardIOSLoginTrelloInteractor:
    MobiletteDashboardIOSLoginTrelloInteractorInput
{
	// MARK: - Property
    
    weak var output: MobiletteDashboardIOSLoginTrelloInteractorOutput? = nil
    var networkController: MobiletteDashboardIOSLoginTrelloNetworkProtocol? = nil

    // MARK: - MobiletteDashboardIOSLoginTrello interactor input interface

    func connectUserWithTrello()
    {
        self.networkController?.userTrelloAuthentification()
    }
    
    // MARK: - Converting raw datas
}
