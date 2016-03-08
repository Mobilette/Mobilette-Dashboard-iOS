//
//  MDTaskDoneInteractorIO.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 08/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

protocol MDTaskDoneInteractorInput: class
{
    func findTasksDone()
}

protocol MDTaskDoneInteractorOutput: class
{
    func didFindTasksDone(doneTasks: [DoneTaskItem])
    func didFailToFindTasksDone(error: ErrorType)
}