import UIKit

//1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)
enum Gender {
    case female
    case male
}
//2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender
protocol SuperBeing {
    var name: String { get  }
    var strength: Int { get }
    var speed: Int? { get }
    var weakness: String { get }
    var gender: Gender { get }
}
//3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა
extension SuperBeing {
    var strength: Int {
        return 200
    }
    var speed: Int {
        return 100
    }
}
//4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
//8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
//11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

//PS: ყველა ფროფერთი არის თქვენზე დამოკიდებული რა მნიშვნელობას მიიღებს. სურვილისამებრ შეგიძლიათ დაბეჭდილი მნიშვნელობებიც შეცვალოთ

class Superhero: SuperBeing {
    var speed: Int?
    
    var name: String
    var weakness: String
    var gender: Gender
    
    var outfitColor: String?
    var equipment: String?
    var vehicle: String?
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    func rescue(victimName: String) {
        print("\(name) - არ შეუშინდა სახიფათო სიტუაციას და - \(victimName) სიკვდილს გადაარჩინა.")
    }
    
    func combat(with: SuperVillain) {
        print("\(name) - შეერკინა და დაამარცხა - \(with.name).")
    }
    
}

class SuperVillain: SuperBeing {
    var speed: Int?
    
    var name: String
    var weakness: String
    var gender: Gender
    
    var evilScheme: String?
    var obsession: String?
    var rivalry: String?
    
    init(name: String, weakness: String, gender: Gender) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }
    
    func attack(superhero: Superhero) {
        print("\(name) - გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა - \(superhero.name) მის შეჩერებას თუ შეძლებს")
    }
    
    func experimentation(subject: String) {
        print("\(name) - ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) - აღმოჩნდა” ")
    }
    
}

var heroStory1 = Superhero(name: "Batman", weakness: "vulnerable to physical trauma", gender: .male, outfitColor: "black", equipment: "Batarang", vehicle: "Batmobile")
var heroStory2 = Superhero(name: "Captain America", weakness: "ability to get mortally wounded", gender: .male, outfitColor: "red and blue", equipment: "vibranium shield", vehicle: "Chevrolet van")
var heroStory3 = Superhero(name: "Profssor-X", weakness: "stronger telepathy or resistance", gender: .male, outfitColor: "blue", equipment: "Cerebro", vehicle: "hoverchair")
var heroStory4 = Superhero(name: "Spider-Man", weakness: "Ethyl Chloride", gender: .male, outfitColor: "red and blue", equipment: "spider sense", vehicle: "Spider-Mobile")
var heroStory5 = Superhero(name: "Wolverine", weakness: "Muramasa Blade", gender: .male, outfitColor: "yellow and blue", equipment: "swords", vehicle: "wolverine-car")

var villainStory1 = SuperVillain(name: "Penguin", weakness: "weak to the affections of pretty women", gender: .male)
var villainStory2 = SuperVillain(name: "Red Skull", weakness: "arrogance and overconfidence often lead to his downfall.", gender: .male)
var villainStory3 = SuperVillain(name: "Ra's al Ghul", weakness: "vulnerable to mental Illness.", gender: .male)
var villainStory4 = SuperVillain(name: "Mysterio", weakness: "armor break and a crack in a Helmet", gender: .male)
var villainStory5 = SuperVillain(name: "Thanos", weakness: "arrogance and overconfidence. This flaw often leads him to underestimate his opponents", gender: .male)


//6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
print("-------------------------------------")
heroStory2.rescue(victimName: "ზვიადი")


//7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს - “‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)
print("-------------------------------------")
heroStory4.combat(with: villainStory4)


//9. გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს - “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
print("-------------------------------------")
villainStory5.attack(superhero: heroStory2)

//10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს - “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
print("-------------------------------------")
villainStory2.experimentation(subject: "ზაზა")

//
//Optional:
//
//
//წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
//
//-“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.
//
//1. დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
//2. ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
//3. დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)
print("-------------------------------------")

func compareSwiftness<T: SuperBeing>(firstHero: T, secondHero: T) -> String {
    if let firstSpeed = firstHero.speed, let secondSpeed = secondHero.speed {
        if firstSpeed > secondSpeed {
            print("\(firstHero.name) is faster that \(secondHero.name)")
        } else if firstSpeed < secondSpeed {
            print("\(secondHero.name) is faster that \(firstHero.name)")
        } else {
            print("\(secondHero.name)-s and \(firstHero.name)-s speed is the same.")
        }
    }
    return("first heros speed - \(firstHero.speed ?? 0), second heros speed is - \(secondHero.speed ?? 0) ")
}
var leqsseni = Superhero(name: "ლექს-სენი", weakness: "bigTiko", gender: .male, outfitColor: "blue", equipment: "equipment", vehicle: "vehicle")
var drake = Superhero(name: "დრეიკი", weakness: "rihanna", gender: .male, outfitColor: "black", equipment: "equipment", vehicle: "vehicle")
leqsseni.speed = 200
drake.speed = 110
compareSwiftness(firstHero: leqsseni, secondHero: drake)
