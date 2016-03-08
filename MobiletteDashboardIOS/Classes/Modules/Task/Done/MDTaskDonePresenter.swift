//
//  MDTaskDonePresenter.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class MDTaskDonePresenter:
    MDTaskDoneModuleInterface,
    MDTaskDoneInteractorOutput
{
	// MARK: - Property
    
    weak var view: MDTaskDoneViewInterface? = nil
    var interactor: MDTaskDoneInteractorInput? = nil
    var wireframe: MDTaskDoneWireframe? = nil

    // MARK: - MDTaskDone module interface

    func updateView()
    {
    	self.retrieveTasksDone()
    }
    
    func retrieveTasksDone()
    {
        self.interactor?.findTasksDone()
    }
    
    // MARK: - MDTaskDone interactor output interface

    func didFindTasksDone(doneTasks: [DoneTaskItem])
    {
        let doneTaskViewItems = self.doneTaskViewItem(doneTasks)
        self.view?.setDoneTasksViewItem(doneTaskViewItems)
    }
    
    func didFailToFindTasksDone(error: ErrorType)
    {
        
    }
    
    // MARK: - Converting entities
    
    private func doneTaskViewItem(doneTaskItems: [DoneTaskItem]) -> [DoneTaskViewItem]
    {
        var doneTaskViewItems: [DoneTaskViewItem] = []
        for item in doneTaskItems {
            let doneTaskViewItem = DoneTaskViewItem(doneTaskItem: item)
            doneTaskViewItems.append(doneTaskViewItem)
        }
        return doneTaskViewItems
    }
}