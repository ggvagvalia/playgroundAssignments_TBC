import UIKit

// თქვენი დავალებაა კარგათ გაერკვეთ როგორ მუშაობს ARC სხვადასხვა იმპლემენტაციების გამოყენებით.
//
//1. შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//2. აუცილებელია ქლოჟერების გამოყენება
//3. აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
//4. აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//5. დაიჭირეთ self ქლოჟერებში
//6. გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით

protocol Workable {
    func Work()
}

class Profession: Workable {
    
    
    let description: String
    weak var employee: Employee?
    
    init(description: String, employee: Employee? = nil) {
        self.description = description
        self.employee = employee
    }
    
    deinit {
        print("\(description) - is deallocated.")
    }
    
    func makeEmployeeWork(hour: Int) {
        employee?.doSome { [weak self] in
            print("\(self?.employee?.name ?? "") - has to work as a -\(self?.description ?? "") for \(hour) - hours.")
        }
    }
    func Work() {
        print("\(employee?.name ?? "-")- s job description is -\(description)")
    }
}

class Employee: Workable {
    let name: String
    var profession: Profession?
    
    init(name: String, profession: Profession? = nil) {
        self.name = name
        self.profession = profession
    }
    deinit {
        print("\(name) - is deallocated.")
    }
    
    func doSome(work: () -> Void) {
        work()
    }
    func Work() {
        print("\(name) - works as a - \(profession?.description ?? "-")")
    }
}

var firstEmployee: Employee? = Employee(name: "ana")
var firstProfession: Profession? = Profession(description: "🕵🏻‍♀️")

// strong reference
firstEmployee?.profession = firstProfession
firstEmployee?.Work()

// weak reference
firstProfession?.employee = firstEmployee
firstProfession?.Work()

print("---------------------------")
firstProfession?.makeEmployeeWork(hour: 8)
print("---------------------------")

print(firstEmployee?.profession?.description ?? "")
print("---------------------------")


//firstEmployee-ს განილების შედეგი - Employe-ს reference count = 0; Profession-ის -1 count.
firstEmployee = nil

// Profession-ზე strong reference-ის განილება; Profession-ის reference count = 0.
firstProfession = nil


print("---------------------------")
print(firstEmployee?.profession?.description as Any)
print(firstProfession?.makeEmployeeWork(hour: 8) as Any)
print(firstProfession?.Work() as Any)
print("---------------------------")


class Person {
    var name: String
    var hobby: Hobbby?
    
    init(name: String, hobby: Hobbby? = nil) {
        self.name = name
        self.hobby = hobby
    }
    deinit {
        print("\(name) - is deallocated.")
    }
}
class Hobbby {
    var description: String
    unowned var person: Person?
    
    init(description: String, person: Person? = nil) {
        self.description = description
        self.person = person
    }
    deinit {
        print("\(description) - is deallocated.")
    }
}
var firstPerson: Person? = Person(name: "ia")
var firstHobby: Hobbby? = Hobbby(description: "💃")

firstPerson?.hobby = firstHobby
firstHobby?.person = firstPerson


firstHobby?.person = nil
firstPerson = nil
firstHobby = nil


