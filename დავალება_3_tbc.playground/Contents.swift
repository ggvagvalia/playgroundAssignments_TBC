import UIKit

var greeting = "Hello, playground"

//3. დავალება - Swift Basics Control Flow


//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

var firstNumber = 2
var secondNumber = 3
var thirdNumber = 5

print(firstNumber*secondNumber*thirdNumber)

print("-------------------")

//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.

var newNumber = 5
newNumber % 2 == 0 ? print("რიცხვი - \(newNumber) არის ლუწი") : print("რიცხვი - \(newNumber) არის კენტი")

print("-------------------")

//3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ

var personName: String? = "gvantsa"
if let personName {
    print(personName)
} else {
    print("no name")
}
print("-------------------")

//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.

var isRaining: Bool = false
if isRaining {
    print("ქოლგის წაღება არ დამავიწყდეს")
} else {
    print("დღეს ქოლგა არ დამჭირდება")
}

print("-------------------")

//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”
var myFirsNumber = 5
var mySecondNumber = 7

if myFirsNumber > mySecondNumber {
    print("\(myFirsNumber) მეტია \(mySecondNumber)-ზე")
} else if mySecondNumber > myFirsNumber {
        print("\(mySecondNumber) მეტია \(myFirsNumber)-ზე")
} else {
    print("\(myFirsNumber) და \(mySecondNumber) ერთმანეთის ტოლი რიცხვებია")
}

print("-------------------")

//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.

let firstCharacterOfMyName: Character
firstCharacterOfMyName = "g"
print(firstCharacterOfMyName)

// an
//var myNameIs = "gvantsa"
//let myNameCharacter = myNameIs.first
//print(myNameCharacter ?? "")

print("-------------------")

//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი

var someNumber = 55
if someNumber % 11 == 0 {
    print("\(someNumber) ერთი და იმავე ციფრებისაგან შემდგარი რიცხვია")
} else {
    print("\(someNumber) არ არის ერთი და იმავე ციფრებისაგან შემდგარი რიცხვი")
}

//ან
//var someNumber = 55
//someNumber % 11 == 0 ? print(true) : print(false)

print("-------------------")

//8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.

var numberOfMonths = 1
if numberOfMonths >= 3 && numberOfMonths <= 5 {
    print("გაზაფხული")
} else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("ზაფხული")
} else if numberOfMonths >= 9 && numberOfMonths <= 11 {
    print("შემოდგომა")
} else if numberOfMonths == 12 || numberOfMonths <= 2  {
    print("ზამთარი")
} else {
    print("❌")
}

print("-------------------")

//Optional:
//
//9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”

var wholeNumber = 12

if wholeNumber % 3 == 0 && wholeNumber % 4 == 0 {
    print("იყოფა 3-ზე და 4-ზე")
} else if wholeNumber % 3 == 0 {
    print("იყოფა 3-ზე")
} else if wholeNumber % 4 == 0 {
    print("იყოფა 4-ზე")
} else {
    print("❌")
}

print("-------------------")

//10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი

var num1 = 5
var num2 = -5
var someString: String
someString = abs(num1) - abs(num2) == 0 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"
print(someString)

