//
//  MDTasksSelectedViewController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit

class MDTasksSelectedViewController:
    UIViewController,
    MDTasksSelectedViewInterface
{
	// MARK: - Property

    var presenter: MDTasksSelectedModuleInterface? = nil
    private var selectedTasks: [SelectedTaskViewItem] = []
    
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
    
    // MARK: View Interface
    
    func setSelectedTaskViewItem(selectedTaskViewItems: [SelectedTaskViewItem])
    {
        self.selectedTasks = selectedTaskViewItems
    }
}
