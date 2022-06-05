//
//  SchedulePresenter.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import Foundation

protocol SchedulePresenterProtocol: AnyObject {
    init(view: ScheduleViewProtocol, schedule: Schedule?)
    func getSchedule(forDay day: String, inWeek week: Int, forSubgroup subgroup: Int) -> [Pair]
    func refreshSchedule()
}

class SchedulePresenter: SchedulePresenterProtocol {
    let view: ScheduleViewProtocol
    var schedule: Schedule?
    var currentWeek: Int?
    
    required init(view: ScheduleViewProtocol, schedule: Schedule?) {
        self.view = view
        refreshSchedule()
    }
    
    func refreshSchedule() {
        self.schedule = ScheduleRepo.shared.schedule
        self.currentWeek = ScheduleRepo.shared.currentWeek
    }
    
    func getSchedule(forDay day: String, inWeek week: Int, forSubgroup subgroup: Int) -> [Pair] {
        return schedule?.getSchedule(forDay: day).filter { pair in
            pair.weekNumber.contains(week) && (subgroup == 0 ? true : pair.numSubgroup == 0 || pair.numSubgroup == subgroup)
        } ?? [Pair]()
    }
       
}
