//
//  Schedule.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

struct Schedule: Codable {
    let saturday: [Pair]
    let thursday: [Pair]
    let friday: [Pair]
    let monday: [Pair]
    let tuesday: [Pair]
    let wednesday: [Pair]
    
    func getSchedule(forDay day: String) -> [Pair] {
        switch day {
        case "ПН": return monday
        case "ВТ": return tuesday
        case "СР": return wednesday
        case "ЧТ": return thursday
        case "ПТ": return friday
        case "СБ": return saturday
        default: return [Pair]()
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case saturday = "Суббота"
        case thursday = "Четверг"
        case friday = "Пятница"
        case monday = "Понедельник"
        case tuesday = "Вторник"
        case wednesday = "Среда"
    }
}
