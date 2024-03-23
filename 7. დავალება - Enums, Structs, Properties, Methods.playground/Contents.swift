import UIKit

//
//7. დავალება - Enums, Structs, Properties, Methods
print("------------------------------------")

//1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.
enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
func checkWeek(day: WeekDay) {
    switch day {
    case .Saturday, .Sunday:
        print("\(day) is a non-working day")
    default:
        print("\(day) is a work day")
    }
}
checkWeek(day: .Thursday)
print("------------------------------------")

//2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio

    var prices: Int {
        if self == .TsigroviManto {
            return 700
        } else if self == .MoshishvlebuliMkerdi {
            return 500
        } else if self == .TuGapatio {
            return 300
        } else {
            return 0
        }
    }
    
     func printMyPrice(value: Self) -> String {
         return "price for - \(value) is \(value.prices)"
    }
    
}

var tempVariable = GialaSquad.MoshishvlebuliMkerdi.printMyPrice(value: .TsigroviManto)
print(tempVariable)


print("------------------------------------")

//3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
enum Weather {
    case Sunny(Celsius: Double)
    case Cloudy(Celsius: Double)
    case Rainy(Celsius: Double)
    case Snowy(Celsius: Double)
}

func giveRecomendationAbout(currentWeather: Weather) {
    switch currentWeather {
    case .Sunny(Celsius: let Celsius):
        if Celsius < 18 {
            print("it's hot, you can wear a summer dress")
        } else {
            print("it's hot, you should wear a summer dress, glasses and a hat.")
        }
    case .Cloudy(Celsius: let Celsius):
        if Celsius < 18 {
            print("it's cloudy, bring a jacket.")
        } else {
            print("it's cloudy, bring a rain coat just in case")
        }
    case .Rainy(Celsius: let Celsius):
        if Celsius < 18 {
            print("it's rainy, bring an umbrella and a rain coat.")
        } else {
            print("it's rainy, bring an umbrella")
        }
    case .Snowy(Celsius: let Celsius):
        if Celsius < 18 {
            print("it's freezing, you'll need to wear: gloves, scarf and a hat.")
        } else {
            print("wear gloves and boots")
        }
    }
}
var whatToWear: () = giveRecomendationAbout(currentWeather: .Rainy(Celsius: 18))

print("------------------------------------")


//4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: Int
}

var myKanyeArray: [Kanye] = []

var kanye1 = Kanye(album: "Graduation", releaseYear: 2007)
var kanye2 = Kanye(album: "Ye", releaseYear: 2018)
var kanye3 = Kanye(album: "Donda", releaseYear: 2021)

myKanyeArray.append(kanye1)
myKanyeArray.append(kanye2)
myKanyeArray.append(kanye3)

func returnAllAlbumInfo(myArray: [Kanye], year: Int) {
    for tempYear in myArray {
        if tempYear.releaseYear > year {
            print(" \"\(tempYear.album)\" was released after \(year)")
        }
    }
}

returnAllAlbumInfo(myArray: myKanyeArray, year: 2017)
print("------------------------------------")


//5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct CachedData {
    let initializer: () -> String
    lazy var lazyVar: String = self.initializer()
    
    var wrappedValue: String {
        mutating get { return lazyVar }
    }
    
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
}
struct myStructure {
    @CachedData var cachedData: String = "lazy ინიციალიზებულია"
}

var variable5 = myStructure()
print(variable5.cachedData)
print("------------------------------------")

//
//Optional:
//
//ბარბარემ გადაწყვიტა პროგრამირებასთან ერთად დამატებითი სამსახური დაეწყო და ტაროს სამკითხაო ჯიხური გახსნა. მისი სახელი უცებ გავარდა და ქართველი ვარსკვლავების ყურამდეც მივიდა. ერთ დღეს მას ჯიხურში ძალიან ნაცნობი სახეები გამოეცხადა, ბედინა და შავი პრინცი. პროფესიონალმა ნათელმხილველმა გაშალა კარტი და დაიწყო მათ მომავალში ხელების ფათური. ბარბარეს ტაროს დასტა საკმაოდ უნიკალურია, ის მხოლოდ 12 კარტს შეიცავს - Star, Empress, Tower, Hanged Man, Chariot, Moon, Hierophant, Devil, Lovers, Wheel of Fortune, Fool, Magician და მათ აღწერებს -
//
//* Star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას.
//
//* Empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში.
//
//* Tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის.
//
//* Hanged Man: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს.
//
//* Chariot: განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით.
//
//* Moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს.
//
//* Hierophant: წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან.
//
//* Devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას.
//
//* Lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით.
//
//* Wheel of Fortune: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია.
//
//* Fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას.
//
//* Magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით.
//
//1. შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.
//2. შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად
//3. შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით
//4. შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.
//შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.

enum TarotCard: String {
    case Star = "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
    case Empress = "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში"
    case Tower = "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის"
    case HangedMan = "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
    case Chariot = "განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
    case Moon = "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს"
    case Hierophant = "წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
    case Devil = "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას"
    case Lovers = "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით"
    case WheelofFortune = "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია"
    case Fool = "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას"
    case Magician = "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით"
    
    static func returnMy(card: Self) -> Self {
        return card
    }
    static func returnDescription(for card: Self) -> String {
        return "\(card) - \(card.rawValue)"
    }
}
var myCard = TarotCard.returnMy(card: .WheelofFortune)
print(myCard)
print("------------------------------------")
var myCardDescription = TarotCard.returnDescription(for: .Chariot)
print(myCardDescription)
print("------------------------------------")

struct TarotReading {
    var past: TarotCard
    var present: TarotCard
    var future: TarotCard
    
    init(past: TarotCard, present: TarotCard, future: TarotCard) {
        self.past = past
        self.present = present
        self.future = future
    }
    func printThisCard() {
        print("\(past), \(present), \(future)")
    }
}
var newVariable = TarotReading(past: .Chariot, present: .Empress, future: .Magician)
newVariable.printThisCard()
