//
//  MobiletteDashbordTaskListWireframe.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit

let MobiletteDashbordTaskListViewControllerIdentifier: String = "MobiletteDashbordTaskListViewController"

class MobiletteDashbordTaskListWireframe//: StoryboardSegueDelegate
{
	// MARK: - Property

    weak var presenter: MobiletteDashbordTaskListPresenter? = nil
    private weak var viewController: MobiletteDashbordTaskListViewController? = nil

    // MARK: - Storyboard segue

    /*    
    enum SegueIdentifier: String {
        case PushTo<# Next interface name #> = "pushMobiletteDashbordTaskListTo<# Next interface name #>"
    }
    */

    private var preparedSegue: UIStoryboardSegue? = nil

    // MARK: - Presentation

    func prepareInterface(fromSegue segue: UIStoryboardSegue)
    {
        let viewController = segue.destinationViewController as! MobiletteDashbordTaskListViewController
        viewController.presenter = self.presenter
        self.viewController = viewController
        self.presenter?.view = viewController
    }

    /*
    func prepareInterface(fromSegue segue: UIStoryboardSegue)
    {
        let navigationViewController = segue.destinationViewController as! UINavigationController
        if let viewController = navigationViewController.viewControllers.first as? MobiletteDashbordTaskListViewController {
            viewController.presenter = self.presenter
            self.viewController = viewController
            self.presenter?.view = viewController
        }
    }
    */

    /*
    func presentInterface(fromWindow window: UIWindow)
    {
    	/*
        let viewController = self.viewControllerFromStoryboard()
        */

    	/*
        let navigationViewController = self.navigationControllerFromStoryboard()
        if let viewController = navigationViewController.viewControllers.first as? MobiletteDashbordTaskListViewController
        */

        viewController.presenter = self.presenter
        self.viewController = viewController
        self.presenter?.view = viewController
    }
    */

    // MARK: - Prepare interface

    /*
    func prepare<# Interface name #>Interface()
    {
        var presenter = <# Interface name #>Presenter()
        var interactor = <# Interface name #>Interactor()
        var wireframe = <# Interface name #>Wireframe()
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        if let segue = self.preparedSegue {
            MBLog.view(MBLog.Level.High, object: "Did prepare <# Interface name #> interface.")
            wireframe.prepareInterface(fromSegue: segue)
        }
        else {
            MBLog.error(MBLog.Level.High, object: "Did fail to prepare <# Interface name #> interface.")
        }
    }
    */
    
    // MARK: - Storyboard
    
    /*
    private func mainStoryboard() -> UIStoryboard
    {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle:NSBundle.mainBundle())
        return storyboard
    }
    */
    
    /*
    private func viewControllerFromStoryboard() -> MobiletteDashbordTaskListViewController
    {
    let storyboard = self.mainStoryboard()
    let viewController = storyboard.instantiateViewControllerWithIdentifier(MobiletteDashbordTaskListViewControllerIdentifier) as! MobiletteDashbordTaskListViewController
    return viewController
    }
    */
    
    /*
    private func navigationControllerFromStoryboard() -> UINavigationController
    {
    let storyboard = self.mainStoryboard()
    let navigationController = storyboard.instantiateViewControllerWithIdentifier(MobiletteDashbordTaskListViewControllerIdentifier) as! UINavigationController
    return navigationController
    }
    */
}
