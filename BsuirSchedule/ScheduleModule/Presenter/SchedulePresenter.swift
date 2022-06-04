//
//  SchedulePresenter.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 24.04.22.
//

import Foundation

protocol SchedulePresenterProtocol: AnyObject {
    init(view: ScheduleViewProtocol, schedule: Answer?)
    func getSchedule(forDay day: String) -> [Pair]
    func getPairCount() -> Int?
    func getPair(withNumber number: Int) -> Pair?
}

class SchedulePresenter: SchedulePresenterProtocol {
    let view: ScheduleViewProtocol
    var schedule: Answer?
    var currentWeek: Int!
    
    required init(view: ScheduleViewProtocol, schedule: Answer?) {
        self.view = view
        self.schedule = schedule
    }
    
    func getSchedule(forDay day: String) -> [Pair] {
        return (schedule?.schedules.getSchedule(forDay: day))!.filter{ pair in
            pair.weekNumber.contains(currentWeek)
        }
    }
    
    func getPairCount() -> Int? {
        return schedule?.schedules.monday.count
    }
    
    func getPair(withNumber number: Int) -> Pair? {
        return schedule?.schedules.monday[number]
    }
        
}
