//
//  Date+weekDay.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

import Foundation

extension Date {
    func getNextDay() -> Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
    
    func getDayNumber() -> Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    
    func getDayNumberString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: self)
    }
    
    func getWeekDay() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func getMonth() -> Int? {
        return Calendar.current.dateComponents([.month], from: self).month
    }
    
    func getWeekNumber(for date: Date, currentNumber: Int) -> Int {
        var res = currentNumber
        var currDate = self
        let toDate = date
        while (currDate.getMonth() != toDate.getMonth() &&
               currDate.getDayNumber() != toDate.getDayNumber()) {
            
            if (currDate.getWeekDay() == 1) {
                res += 1
            }
            currDate = currDate.getNextDay()
        }
        return res
    }
    
    func getWeekDayString() -> String {
        switch self.getWeekDay() {
        case 1: return "ВС"
        case 2: return "ПН"
        case 3: return "ВТ"
        case 4: return "СР"
        case 5: return "ЧТ"
        case 6: return "ПТ"
        default: return "СБ"
        }
    }
    
    func getMonthString() -> String {
        switch self.getMonth() {
        case 1: return "января"
        case 2: return "февраля"
        case 3: return "марта"
        case 4: return "апреля"
        case 5: return "мая"
        case 6: return "июня"
        case 7: return "июля"
        case 8: return "августа"
        case 9: return "сентября"
        case 10: return "октября"
        case 11: return "ноября"
        default: return "декабря"
        }
    }
}
