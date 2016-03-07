//
//  RootWireframe.swift
//  MobiletteDashboardIOS
//
//  Created by Issouf M'sa Benaly on 9/15/15.
//  Copyright (c) 2015 Mobilette. All rights reserved.
//

import UIKit

class RootWireframe
{
    
    // MARK: - Presentation
    
    func presentRootViewController(fromWindow window: UIWindow)
    {
         self.presentMBDUserLoginViewController(fromWindow: window)
    }
    
    private func presentMBDUserLoginViewController(fromWindow window: UIWindow)
    {
        let presenter = MBDUserLoginPresenter()
        let interactor = MBDUserLoginInteractor()
        let networkController = MBDUserLoginNetworkController()
        let wireframe = MBDUserLoginWireframe()
        interactor.networkController = networkController
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        wireframe.presentInterface(fromWindow: window)
    }
}
