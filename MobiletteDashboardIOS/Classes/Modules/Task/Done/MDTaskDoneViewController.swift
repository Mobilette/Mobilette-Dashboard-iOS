//
//  MDTaskDoneViewController.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import UIKit

class MDTaskDoneViewController:
    UIViewController,
    MDTaskDoneViewInterface
{
	// MARK: - Property

    var presenter: MDTaskDoneModuleInterface? = nil
    private var doneTasks: [DoneTaskViewItem] = []
    
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
    
    func setDoneTasksViewItem(doneTaskViewItems: [DoneTaskViewItem])
    {
        self.doneTasks = doneTaskViewItems
    }
}
