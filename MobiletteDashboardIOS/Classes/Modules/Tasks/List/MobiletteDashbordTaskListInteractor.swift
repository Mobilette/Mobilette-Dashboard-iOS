//
//  MobiletteDashbordTaskListInteractor.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation
import MBLogger

class MobiletteDashbordTaskListInteractor:
    MobiletteDashbordTaskListInteractorInput
{
	// MARK: - Property
    
    weak var output: MobiletteDashbordTaskListInteractorOutput? = nil
    var networkController: MobiletteDashbordTaskListNetworkProtocol? = nil

    // MARK: - MobiletteDashbordTaskList interactor input interface

    func findListOfTrelloTasks()
    {
        self.networkController?.fetchListOfTrelloTasks()
        .then { [unowned self] JSONItem -> Void in
        let item = self.tasksItem(JSONItem)
        MBLog.app(MBLog.Level.High, object: "Did find trello task's list: \(item).")
        self.output?.didFindListOfTrelloTasks(item)
        }
        .error { [unowned self] error -> Void in
            MBLog.app(MBLog.Level.High, object: "Did fail to Did find trello task's list.")
            self.output?.didFailToFindListOfTrelloTasks(error)
        }
    }
    
    // MARK: - Converting raw datas
    
    private func tasksItem(taskJSONItems: [TaskJSONItem]) -> [TaskItem]
    {
        var taskItems: [TaskItem] = []
        for item in taskJSONItems {
            let taskItem = TaskItem(taskJSONItem: item)
            taskItems.append(taskItem)
        }
        return taskItems
    }
}
