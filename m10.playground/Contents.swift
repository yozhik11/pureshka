// MARK: - задание 1

protocol CalorieCountProtocol {
    var calories: Int { get }
    func description() -> String
}

enum foodType: CalorieCountProtocol {
    case cutlet
    case puree
    var calories: Int {
        switch self {
        case .cutlet: return 260
        case .puree: return 75
        }
    }
    
    func description() -> String {
        switch self {
        case .cutlet: return "В одной котлетке \(calories) калорий"
        case .puree: return "В одной пюрешке \(calories) калорий"
        }
    }
}

final class CutletCount: CalorieCountProtocol {
    var calories: Int
    
    init (calories: Int) {
        self.calories = calories
    }
    
    func description() -> String {
        let quantity = Int(calories / 250)
        return "\(calories) калорий это \(quantity) котлет"
    }
}

struct PureeCount: CalorieCountProtocol {
    var calories: Int
    
    func description() -> String {
        let quantity = Int(calories / 75)
        return "\(calories) калорий это \(quantity) порций пюре"
    }
}

let sundayDinner = CutletCount(calories: 2200)
print (sundayDinner.description())

let mondayDinner = PureeCount(calories: 1800)
print (mondayDinner.description())

let howManyCalories = foodType.cutlet

switch howManyCalories {
case .cutlet: print(howManyCalories.description())
case .puree: print(howManyCalories.description())
}


//MARK: - задание 2

enum BalanceType {
    case positive, negative, neutral
}

protocol ClassVsStruct: Equatable  {
    var type: BalanceType { get }
    var amount: Int { get }
}

struct Balance: ClassVsStruct, Equatable {
    let type: BalanceType
    let amount: Int
}

class BalanceObject: ClassVsStruct, Equatable {
    let type: BalanceType
    var amount: Int = 0
    
    init (type: BalanceType, amount: Int) {
        self.type = type
        self.amount = amount
    }
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        return lhs.type == rhs.type && lhs.amount == rhs.amount
    }
    
    static func == (lhs: Balance, rhs: BalanceObject) -> Bool {
        return lhs.type == rhs.type && lhs.amount == rhs.amount
    }
    
    static func == (lhs: BalanceObject, rhs: Balance) -> Bool {
        return lhs.type == rhs.type && lhs.amount == rhs.amount
    }
}

let balance1 = Balance (type: .positive, amount: 20)
let balance2 = Balance (type: .negative, amount: 20)
balance1 == balance2 ? print ("равны") : print("не равны")

let balanceObject1 = BalanceObject(type: .neutral, amount: 20)
let balanceObject2 = BalanceObject(type: .neutral, amount: 20)
balanceObject1 == balanceObject2 ? print ("равны") : print("не равны")

balance1 == balanceObject2 ? print ("равны") : print("не равны")
balanceObject2 == balance2 ? print ("равны") : print("не равны")

//MARK: - задание 3

protocol Dog {
    var name: String { get set }
    var color: String { get set }
    
    func speak() -> String
}

extension Dog {
    func speak() -> String {
        if self is Haski {return "\(self.name) поёт"
        } else if self is Corgi {return "\(self.name) гавкает"
        } else {return "\(self.name) молчит"}
    }
}

struct Haski: Dog {
    var name: String
    var color: String
}

class Corgi: Dog {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct Hound: Dog {
    var name: String
    var color: String
}

var dogs: [Dog] = [Haski(name: "Хаски",color: "серый"), Corgi(name: "Корги",color: "рыжий"), Hound(name: "Гончая",color: "белый")]

for i in dogs {
    print (i.speak())
}

