//
//  Schedule.swift
//  BsuirSchedule
//
//  Created by IlyaCool on 4.06.22.
//

struct Schedule: Codable {
    let saturday: [Pair]?
    let thursday: [Pair]?
    let friday: [Pair]?
    let monday: [Pair]?
    let tuesday: [Pair]?
    let wednesday: [Pair]?
    
    func getSchedule(forDay day: String) -> [Pair] {
        switch day {
        case "ПН": return monday ?? [Pair]()
        case "ВТ": return tuesday ?? [Pair]()
        case "СР": return wednesday ?? [Pair]()
        case "ЧТ": return thursday ?? [Pair]()
        case "ПТ": return friday ?? [Pair]()
        case "СБ": return saturday ?? [Pair]()
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
