//
//  MDTasksSelectedPresenter.swift
//  MobiletteDashboardIOS
//
//  Mobilette template version 1.0
//
//  Created by Benaly Issouf M'sa on 07/03/16.
//  Copyright © 2016 Mobilette. All rights reserved.
//

import Foundation

class MDTasksSelectedPresenter:
    MDTasksSelectedModuleInterface,
    MDTasksSelectedInteractorOutput
{
	// MARK: - Property
    
    weak var view: MDTasksSelectedViewInterface? = nil
    var interactor: MDTasksSelectedInteractorInput? = nil
    var wireframe: MDTasksSelectedWireframe? = nil

    // MARK: - MDTasksSelected module interface

    func updateView()
    {
    	self.retrieveSelectedTasksOnTrello()
    }
    
    func retrieveSelectedTasksOnTrello()
    {
        self.interactor?.findTaskTrelloSelected()
    }
    
    // MARK: - MDTasksSelected interactor output interface

    func didFindTaskTrelloSelected(selectedTasks: [SelectedTaskItem])
    {
        let selectedItems = self.selectedViewItems(selectedTasks)
        self.view?.setSelectedTaskViewItem(selectedItems)
    }
    
    func didFailToFindTaskTrelloSelected(error: ErrorType)
    {
        
    }
    
    // MARK: - Converting entities
    
    private func selectedViewItems(selectedTaskItems: [SelectedTaskItem]) -> [SelectedTaskViewItem]
    {
        var selectedItems: [SelectedTaskViewItem] = []
        for item in selectedTaskItems {
            let selectedItem = SelectedTaskViewItem(selectedTaskItem: item)
            selectedItems.append(selectedItem)
        }
        return selectedItems
    }
}