//
//  SearchPresenter.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 5.06.22.
//

import UIKit

protocol SearchPresenterProtocol {
    func searchGroups(withNums nums: String)
    func saveSchedule(forGroup group: String)
}

class SearchPresenter: SearchPresenterProtocol {
    
    var view: SearchViewProtocol!
    
    var groups: [Group]! {
        didSet {
            view.loadGroups(groups)
        }
    }
    
    func searchGroups(withNums nums: String) {
        guard let groups = groups else { return }
        view.loadGroups(groups.filter{ group in
            group.name.hasPrefix(nums)
        })
    }
    
    func saveSchedule(forGroup group: String) {
        let network = NetworkService()
        network.getSchedule(forGroup: group) { schedule in
            ScheduleRepo.shared.schedule = schedule?.schedules
        }
        network.getCurrentWeek { week in
            ScheduleRepo.shared.currentWeek = week
        }
        view.showAlert(withTitle: "Success!", andMessage: "Schedule was loaded.")
    }
}
