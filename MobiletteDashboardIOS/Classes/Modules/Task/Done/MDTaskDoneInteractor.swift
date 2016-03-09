//
//  MDTaskDoneInteractor.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import MBLogger

class MDTaskDoneInteractor:
    MDTaskDoneInteractorInput
{
	// MARK: - Property
    
    weak var output: MDTaskDoneInteractorOutput? = nil
    var networkController: MDTaskDoneNetworkProtocol? = nil

    private var taskDoneRepository: TaskRepository = TaskRepository()
    
    // MARK: - MDTaskDone interactor input interface

    func findTasksDone()
    {
        if self.taskDoneRepository.tasks.count > 0 {
            let doneTaskItems = self.doneTaskItemsWithDoneTasks(self.taskDoneRepository.tasks)
            self.output?.didFindTasksDone(doneTaskItems)
        } else {
            self.networkController?.fetchTasksDone()
                .then { [unowned self] JSONItems -> Void in
                    let tasksDone = self.tasksWithDoneTaskJSONItems(JSONItems)
                    self.taskDoneRepository.removeAllTasks()
                    self.taskDoneRepository.addTasks(tasksDone)
                    let item = self.doneTaskItems(JSONItems)
                    MBLog.app(MBLog.Level.High, object: "Did find done tasks: \(item).")
                    self.output?.didFindTasksDone(item)
                }
                .error { [unowned self] error -> Void in
                    MBLog.app(MBLog.Level.High, object: "Did fail to find done tasks.")
                    self.output?.didFailToFindTasksDone(error)
            }
        }
    }
    
    // MARK: - Converting raw datas
    
    private func doneTaskItems(doneTaskJSONItems: [DoneTaskJSONItem]) -> [DoneTaskItem]
    {
        var doneTaskItems: [DoneTaskItem] = []
        for item in doneTaskJSONItems {
            let doneTaskItem = DoneTaskItem(doneTaskJSONItem: item)
            doneTaskItems.append(doneTaskItem)
        }
        return doneTaskItems
    }
    
    private func tasksWithDoneTaskJSONItems(
        doneTaskJSONItems: [DoneTaskJSONItem]
        ) -> [Task]
    {
        var tasks: [Task] = []
        for item in doneTaskJSONItems {
            let task = Task(doneTaskJSONItem: item)
            tasks.append(task)
        }
        return tasks
    }
    
    private func doneTaskItemsWithDoneTasks(
        tasks: [Task]
        ) -> [DoneTaskItem]
    {
        var doneTaskItems: [DoneTaskItem] = []
        for task in tasks {
            let doneTaskItem = DoneTaskItem(task: task)
            doneTaskItems.append(doneTaskItem)
        }
        return doneTaskItems
    }
}
