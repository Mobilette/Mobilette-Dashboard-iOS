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

    // MARK: - MDTasksSelected interactor input interface

    func findTaskTrelloSelected()
    {
        self.networkController?.fetchTaskTrelloSelected()
        .then { [unowned self] JSONItem -> Void in
        let item = self.selectedItems(JSONItem)
        MBLog.app(MBLog.Level.High, object: "Did <# successful action #>: \(item).")
        self.output?.didFindTaskTrelloSelected(item)
        }
        .error { [unowned self] error -> Void in
            MBLog.app(MBLog.Level.High, object: "Did fail to <# failure action #>.")
            self.output?.didFailToFindTaskTrelloSelected(error)
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
}
