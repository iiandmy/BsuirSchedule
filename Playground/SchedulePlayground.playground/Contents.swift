import Foundation

class Human {
    let age: Int!
    
    init(age: Int) {
        self.age = age
    }
}

class Worker: Human {
    let position: String!
    
    init(age: Int, position: String) {
        self.position = position
        super.init(age: age)
    }
}

let workerIvan = Worker(age: 18, position: "stuff")

enum weekDay: Int {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

let weekday = weekDay.Tuesday
let calendar = Calendar(identifier: .gregorian)


func dayOfWeek(forDate: String) -> Int? {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    let date = formatter.date(from: forDate)
    let dateComponents = calendar.dateComponents([.weekday], from: date!)
    let weekday = dateComponents.weekday
    
    return weekday
}

print(dayOfWeek(forDate: "28.10.2022"))
