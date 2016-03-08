//
//  MDTasksSelectedInteractor.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import MBLogger

class MDTasksSelectedInteractor:
    MDTasksSelectedInteractorInput
{
	// MARK: - Property
    
    weak var output: MDTasksSelectedInteractorOutput? = nil
    var networkController: MDTasksSelectedNetworkProtocol? = nil

    private var taskSelectedRepository: TaskRepository = TaskRepository()
    
    // MARK: - MDTasksSelected interactor input interface

    func findTaskTrelloSelected()
    {
        if self.taskSelectedRepository.tasks.count > 0 {
            let selectedTaskItems = self.selectedTaskItemsWithSelectedTasks(self.taskSelectedRepository.tasks)
            self.output?.didFindTaskTrelloSelected(selectedTaskItems)
        } else {
            self.networkController?.fetchTaskTrelloSelected()
                .then { [unowned self] JSONItems -> Void in
                    let tasksSelected = self.tasksWithSelectedTaskJSONItems(JSONItems)
                    self.taskSelectedRepository.removeAllTasks()
                    self.taskSelectedRepository.addTasks(tasksSelected)
                    let item = self.selectedItems(JSONItems)
                    MBLog.app(MBLog.Level.High, object: "Did find selected tasks: \(item).")
                    self.output?.didFindTaskTrelloSelected(item)
                }
                .error { [unowned self] error -> Void in
                    MBLog.app(MBLog.Level.High, object: "Did fail to find selected tasks.")
                    self.output?.didFailToFindTaskTrelloSelected(error)
            }
        }
    }
    
    // MARK: - Converting raw datas
    
    private func selectedItems(selectedJSONItems: [SelectedTaskJSONItem]) -> [SelectedTaskItem]
    {
        var selectedItems: [SelectedTaskItem] = []
        for item in selectedJSONItems {
            let selectedItem = SelectedTaskItem(selectedTaskJSONItem: item)
            selectedItems.append(selectedItem)
        }
        return selectedItems
    }
    
    private func tasksWithSelectedTaskJSONItems(
        selectedTaskJSONItems: [SelectedTaskJSONItem]
        ) -> [Task]
    {
        var tasks: [Task] = []
        for item in selectedTaskJSONItems {
            let task = Task(selectedTaskJSONItem: item)
            tasks.append(task)
        }
        return tasks
    }
    
    private func selectedTaskItemsWithSelectedTasks(
        tasks: [Task]
        ) -> [SelectedTaskItem]
    {
        var selectedTaskItems: [SelectedTaskItem] = []
        for task in tasks {
            let selectedTaskItem = SelectedTaskItem(task: task)
            selectedTaskItems.append(selectedTaskItem)
        }
        return selectedTaskItems
    }
}
