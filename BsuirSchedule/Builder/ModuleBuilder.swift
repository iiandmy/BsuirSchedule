//
//  ModuleBuilder.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import UIKit

protocol Builder {
    static func createScheduleModule() -> UIViewController
    static func createSearchModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createScheduleModule() -> UIViewController {
        let scheduleView = ScheduleViewController()
        let schedulePresenter = SchedulePresenter(view: scheduleView, schedule: nil)
        scheduleView.presenter = schedulePresenter
        return scheduleView
    }
    
    static func createSearchModule() -> UIViewController {
        let networkService = NetworkService()
        let searchView = SearchViewController()
        let searchPresenter = SearchPresenter()
        networkService.getGroups { groups in
            if let groups = groups {
                searchPresenter.groups = groups
            }
        }
        searchView.presenter = searchPresenter
        searchPresenter.view = searchView
        return searchView
    }
}
