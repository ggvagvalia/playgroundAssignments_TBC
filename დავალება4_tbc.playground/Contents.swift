import UIKit

//4. დავალება - Control Flow, Functions and Closures

//1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.
print("- 1 ")

var number = 1
var multipliedNumber = 1

while number < 20 {
    if !number.isMultiple(of: 2) {
        multipliedNumber *= number
    }
    number += 1
}

print("multiplication of odd numbers from 1 to 20 is \(multipliedNumber)")

//2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

print("- 2 ")

var myString = "Test"
var reversedString = ""
for char in myString {
    reversedString = String(char) + reversedString
}
print(reversedString)

//3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
print("- 3 ")

//let someVariable = 1
//while someVariable > 0 {
//    switch someVariable {
//    case 1:
//        print("🔴->🌕->🟢->🔴->🌕")
//    default:
//        break
//    }
//}
//4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

print("- 4 ")

var numberOfTickets = 5
var ticketsLeft = numberOfTickets
while numberOfTickets > 0 {
    numberOfTickets -= 1
    ticketsLeft = numberOfTickets
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(ticketsLeft) რაოდენობა")
    if ticketsLeft == 0 {
        print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")
    }
}

//5. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

print("- 5 ")

var myArray = [4,1,3,4,7,10]
var sortedArray = myArray.sorted()
var containsSameElements = false

for index in 0..<(sortedArray.count - 1) {
    if sortedArray[index] == sortedArray[index + 1] {
        containsSameElements = true
        break
    }
}

switch containsSameElements {
case true:
    print("array შეიცავს მსგავს ელემენტებს")
case false:
    print("array-ში ყველა ელემენტი განსხვავებულია")
}

//6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას
print("- 6 ")

let subtructedNumber = { (number1: Int, number2: Int) in
    print(number1 - number2)
}
subtructedNumber(5, 3)
//7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.
print("- 7 ")

func gamotvaleTanxmovani (word: String) {
    let yvelaTanxmovani = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZბგდვზთკლმნპჟრსტფქღყშჩცძწჭხჯჰ"
    var count = 0
    
    for char in word {
        if yvelaTanxmovani.contains(char) {
            count += 1
        }
    }
    print(count)
}
gamotvaleTanxmovani(word: "Hello - ჰელოუუ")

//Oprtional:
//
//
//
//1. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.
print("Oprtional")
print("- 1 ")

var myIntArray1 = [8,4,9,9,0,2]
var myIntArray2 = [1,0,9,2,3,7,0,1]
var mySortedArray = myIntArray1 + myIntArray2
print(mySortedArray)

var arrayCount = mySortedArray.count

for i in 0..<arrayCount {
    var minimumNumber = i
    for j in i + 1..<arrayCount {
        if mySortedArray[j] < mySortedArray[minimumNumber] {
            minimumNumber = j
        }
    }
    if minimumNumber != i {
        mySortedArray.swapAt(i, minimumNumber)
    }
}
print(mySortedArray)

//2. დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ
print("- 2 ")

func calculate(number: Int) {
    var someNumber = 1
    for i in 1...number {
        someNumber *= i
    }
    print(someNumber)
}
calculate(number: 4)
//3. შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.
print("- 3 ")

var myLastArray: [Int] = []
var evenNumbers: [Int] = []
var oddNumbers: [Int] = []

myLastArray.append(contentsOf: 1...10)
print(myLastArray)

for i in 0..<myLastArray.count {
    if myLastArray[i].isMultiple(of: 2) {
        evenNumbers.append(myLastArray[i])
    } else {
        oddNumbers.append(myLastArray[i])
    }
}
print(evenNumbers)
print(oddNumbers)
