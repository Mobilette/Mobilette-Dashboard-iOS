//
//  MBDUserLoginViewInterface.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Romain ASNAR on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

protocol MBDUserLoginViewInterface: class
{
    func userDidDenyGrantAccess(title title: String, message: String)
    func userDidGrantAccessWithError(title title: String, message: String)
}
