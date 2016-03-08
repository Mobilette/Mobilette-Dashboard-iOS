//
//  MobiletteDashbordTaskListInteractorIO.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 06/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

protocol MobiletteDashbordTaskListInteractorInput: class
{
    func findListOfTrelloTasks()
}

protocol MobiletteDashbordTaskListInteractorOutput: class
{
    func didFindListOfTrelloTasks(tasks: [TaskItem])
    func didFailToFindListOfTrelloTasks(error: ErrorType)
}