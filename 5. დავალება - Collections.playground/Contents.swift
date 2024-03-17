import Foundation

//1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)
print("- 1")

func readBackwards(word: String) -> Bool {
    var wordArray: [Character] = []
    var reversedWordArray: [Character] = []
    
    for i in word {
        wordArray.append(i)
    }
    //    print(wordArray)
    for i in wordArray {
        reversedWordArray.insert(i, at: 0)
    }
    //    print(reversedWordArray)
    if reversedWordArray == wordArray {
        return true
    } else {
        return false
    }
}
//ან
//func readBackwards(word: String) -> Bool {
//    var reversedWord = String(word.reversed())
//    if  word == reversedWord {
//        return true
//    } else {
//        return false
//    }
//}
print(readBackwards(word: "მადამ"))
readBackwards(word: "abcd")

//2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
print("- 2")

func multiplyElementsOf(array: [Int]) -> [Int] {
    var temporaryVar = array
    var newValue: [Int] = []
    
    for i in temporaryVar {
        var multiplied = i * i
        newValue.append(multiplied)
    }
    return newValue
}

print(multiplyElementsOf(array: [4,5]))

//3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
print("- 3")

var myEvenArray = { (array: [Int]) in
    var temp: [Int] = []
    for i in array {
        if i.isMultiple(of: 2) {
            temp.append(i)
        }
    }
    return temp
}
print(myEvenArray([2,3,7,10,11]))
//4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
print("- 4")

func addInts(number: [Int], closure: @escaping () -> Void) {
    print("1...2...3...4...5")
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        var newNumber = 0
        for i in number {
            newNumber += i
        }
        print("delayed answer - sum of array elements is -\(newNumber).")
        closure()
    }
}
addInts(number: [3,4,5]) {
    
}
//func addInts(number: [Int], closure: @escaping (Int) -> Void) {
//    print("1...2...3...4...5")
//    var newNumber = 0
//    for i in number {
//        newNumber += i
//    }
//    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//        closure(newNumber)
//    }
//}
//addInts(number: [3,4,5]) { num in
//    print("delayed answer - sum of array elements is -\(num)")
//}
//

//5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
print("- 5")

var contactsDictionary: [String: Int] = [
    "ana": 12,
    "ia": 34
]

contactsDictionary["salome"] = 56
print(contactsDictionary["ia"] ?? 0)

for (key, value) in contactsDictionary {
    print("\(key) - \(value)")
}

contactsDictionary.removeValue(forKey: "ia")


//6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
print("- 6")

func returnLetter(namesDictionary: [String: Int]) -> [String] {
    var tempArray: [String] = []
    for i in namesDictionary.keys.sorted() {
        tempArray.append(i)
    }
    return tempArray
}
print(returnLetter(namesDictionary: [
    "gvantsa": 3,
    "ana": 1,
    "beka": 2
]))

//7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
print("- 6")
var myDoublesArray = [2, 3.1, 4, 7.3, 8, 7]
var highest = myDoublesArray[0]
for i in myDoublesArray {
    if i > highest {
        highest = i
    }
}
print(highest)
//1. Optional:

//1. მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:
//
let lelaWhatMovementIsThis: [String: Int] = [
    
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

//1.1 დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
print("-1.1")

func calculateMinutesOf(myDictionary: [String: Int]) {
    var sumOfMinutes = 0
    
    for i in lelaWhatMovementIsThis.values {
        sumOfMinutes += i
    }
    
    let minutes = sumOfMinutes / 60
    let seconds = sumOfMinutes % 60
    
    print("💃🕺 in total lela's songs are \(minutes) minutes and \(seconds) seconds long 💃🕺.")
    
}

calculateMinutesOf(myDictionary: lelaWhatMovementIsThis)

//1.2 დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.
print("-1.2")

func findDuration(myDictionary1: [String: Int]) {
    var longestSongName: String?
    var shortestSongName: String?
    
    var longestDuration = myDictionary1.first?.value
    var shortestDuration = myDictionary1.first?.value
    
    for (name, duration) in myDictionary1 {
        if duration > longestDuration ?? 0 {
            longestDuration = duration
            longestSongName = name
        }
        if duration < shortestDuration ?? 0 {
            shortestDuration = duration
            shortestSongName = name
        }
    }
    
    print("ყველაზე ხანგრძლივი სიმღერის სახელია -\(longestSongName ?? "no song")- ყველაზე ხანმოკლე სიმღერის სახელია -\(shortestSongName ?? "no song")-.")
}

findDuration(myDictionary1: lelaWhatMovementIsThis)

//1.3 დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
print("-1.3")
func calculateAverage(myDictionary: [String: Int]) {
    var values = myDictionary.values
    var sum = 0
    
    for value in values {
        sum += value
    }
    print(" avarage duration is -\(sum / values.count) seconds.")
}

calculateAverage(myDictionary: lelaWhatMovementIsThis)

//1.4 დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს
print("-1.4")

func pickRandom(song: [String: Int]) {
    var randomElement = Int.random(in: 0..<song.count)
    var temporaryArray = Array(song.keys)
    print(temporaryArray[randomElement])
}

pickRandom(song: lelaWhatMovementIsThis)

//ან
//    func pickRandom(song: [String: Int]) {
//        if let song = song.keys.first {
//            print(song)
//        }
//    }
//    pickRandom(song: lelaWhatMovementIsThis)
//
