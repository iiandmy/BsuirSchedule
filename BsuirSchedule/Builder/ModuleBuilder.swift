//
//  ModuleBuilder.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import UIKit

protocol Builder {
    static func createScheduleModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createScheduleModule() -> UIViewController {
        let networkService = NetworkService()
        let scheduleView = ScheduleViewController()
        let schedulePresenter = SchedulePresenter(view: scheduleView, schedule: nil)
        networkService.getSchedule(forGroup: "051005") { schedule in
            if let schedule = schedule {
                schedulePresenter.schedule = schedule
                scheduleView.reloadTableView()
            }
        }
        scheduleView.presenter = schedulePresenter
        return scheduleView
    }
}
