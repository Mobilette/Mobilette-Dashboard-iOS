//
//  MobiletteDashbordTaskListPresenter.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class MobiletteDashbordTaskListPresenter:
    MobiletteDashbordTaskListModuleInterface,
    MobiletteDashbordTaskListInteractorOutput
{
	// MARK: - Property
    
    weak var view: MobiletteDashbordTaskListViewInterface? = nil
    var interactor: MobiletteDashbordTaskListInteractorInput? = nil
    var wireframe: MobiletteDashbordTaskListWireframe? = nil

    // MARK: - MobiletteDashbordTaskList module interface

    func updateView()
    {
    	self.retrieveListOfTasks()
    }
    
    func retrieveListOfTasks()
    {
        self.interactor?.findListOfTrelloTasks()
    }
    
    // MARK: - MobiletteDashbordTaskList interactor output interface

    func didFindListOfTrelloTasks(tasks: [TaskItem])
    {
        let tasksViewItem = self.taskListView(tasks)
        self.view?.setTaskListView(tasksViewItem)
    }
    
    func didFailToFindListOfTrelloTasks(error: ErrorType)
    {
        
    }
    
    // MARK: - Converting entities
    
    private func taskListView(tasks: [TaskItem]) -> [TaskListViewItem]
    {
        var taskListViewItems: [TaskListViewItem] = []
        for item in tasks {
            let taskItem = TaskListViewItem(taskItem: item)
            taskListViewItems.append(taskItem)
        }
        return taskListViewItems
    }
}