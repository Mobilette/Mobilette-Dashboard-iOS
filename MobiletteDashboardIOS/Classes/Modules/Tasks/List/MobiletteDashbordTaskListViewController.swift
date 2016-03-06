//
//  MobiletteDashbordTaskListViewController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit

class MobiletteDashbordTaskListViewController:
    UIViewController,
    MobiletteDashbordTaskListViewInterface
{
	// MARK: - Property

    var presenter: MobiletteDashbordTaskListModuleInterface? = nil
    private var tasks: [TaskListViewItem] = []
    
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
    
    func setTaskListView(taskListViewItem: [TaskListViewItem])
    {
        self.tasks = taskListViewItem
    }
}
