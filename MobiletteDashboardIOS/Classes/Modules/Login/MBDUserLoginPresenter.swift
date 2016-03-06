//
//  MBDUserLoginPresenter.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class MBDUserLoginPresenter:
    MBDUserLoginModuleInterface,
    MBDUserLoginInteractorOutput
{
	// MARK: - Property
    
    weak var view: MBDUserLoginViewInterface? = nil
    var interactor: MBDUserLoginInteractorInput? = nil
    var wireframe: MBDUserLoginWireframe? = nil

    // MARK: - MBDUserLogin module interface

    func updateView()
    {
    	
    }
    
    func connectUserWithTrello()
    {
        self.interactor?.connectUserWithTrello()
    }
    
    // MARK: - MBDUserLogin interactor output interface
    
    func didConnectUserWithTrello(/* User credentials */)
    {
        
    }
    
    func didFailToConnectUserWithTrello(error: NSError)
    {
        print(error.userInfo.keys)
    }

    // MARK: - Converting entities
}