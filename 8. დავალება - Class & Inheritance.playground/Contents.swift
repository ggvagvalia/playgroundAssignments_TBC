import UIKit

//8. დავალება - Class & Inheritance

//1. შევქმნათ Class Book.
//Properties: bookID(უნიკალური??--------??იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
//
class Book {
    var bookID = UUID()
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: UUID, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func bookBorrowed() {
        isBorrowed ? true : false
    }
    func bookReturned() {
        isBorrowed ? false : true
    }
}
//2. შევქმნათ Class Owner
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
//
class Owner {
    var ownerId = UUID()
    var name: String
    var borrowedBooks: [Book]
    
    
    init(ownerId: UUID, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func takeBook(library: Library, myBook: Book) {
        if !myBook.isBorrowed {
            borrowedBooks.append(myBook)
            myBook.isBorrowed = true
            
            print("✅ owner - \(name), you can take a book named - \(myBook.title).")
            
            var removeBookAtIndex: Int?
            for (index, book) in library.booksArray.enumerated() {
                if book.title == myBook.title {
                    removeBookAtIndex = index
                    break
                }
            }
            if let removeBookAtIndex {
                library.booksArray.remove(at: removeBookAtIndex)
            }
        } else {
            print("☹️ sorry, you can't take this book, - \(myBook.title) - is already borrowed.")
        }
    }
    
    func returnBook(inLibrary: Library, myBook: Book) {
        if myBook.isBorrowed {
            var indexTemp: Int?
            for (index, book) in borrowedBooks.enumerated() {
                if book.title == myBook.title {
                    indexTemp = index
                    break
                }
            }
            if let indexTemp {
                inLibrary.booksArray.append(myBook)
                myBook.isBorrowed = false
                borrowedBooks.remove(at: indexTemp)
                
                print("book - \(myBook.title) is returned")
            }
            
        } else {
            print("book - \(myBook.title) is not borrowed ")
        }
    }
}

//3. შევქმნათ Class Library

//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var booksArray: [Book]
    var ownersArray: [Owner]
    
    init(booksArray: [Book], ownersArray: [Owner]) {
        self.booksArray = booksArray
        self.ownersArray = ownersArray
    }
    
    func addBook(newBook: Book) {
        booksArray.append(newBook)
    }
    func addOwners(newOwner: Owner) {
        ownersArray.append(newOwner)
    }
    func findAllBooksWeHave() {
        
        var available: [Book] = []
        for book in booksArray {
            if !book.isBorrowed {
                available.append(book)
            }
        }
        if available.isEmpty {
            print("there are no books available.")
            
        } else {
            
            for book in available {
                print("\(book.title) - currently available")
            }
        }
    }
    func findBorrowed() {
        for owner in ownersArray {
            for book in owner.borrowedBooks {
                if book.isBorrowed {
                    print(book.title)
                }
            }
        }
        for owner in ownersArray {
            for book in owner.borrowedBooks {
                if book.isBorrowed {
                    print("owner - \(owner.name) borrowed - \(book.title).")
                }
            }
        }
    }
    
    func findIdOf(ownerid: UUID) {
        for owner in ownersArray {
            if owner.ownerId == ownerid {
                print(owner.name)
            } else {
                print("no owner was found with this id.")
            }
        }
        
    }
    
    func findWhoBorrowed(owner: Owner) {
        if !owner.borrowedBooks.isEmpty {
            for book in owner.borrowedBooks {
                print("\(book.title) is borrowed by - \(owner.name).")
                
            }
        }
    }
    
    func takeAFreeBook(owner: Owner) {
        for book in booksArray {
            if !book.isBorrowed {
                owner.borrowedBooks.append(book)
                book.isBorrowed = true
                print("book - \(book.title) was borrowed by - \(owner.name)")
            }
        }
        print("no books available.")
    }
}

//4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

let unicID = UUID()

var book1 = Book(bookID: unicID, title: "book1", author: "book1 author", isBorrowed: false)
var book2 = Book(bookID: unicID, title: "book2", author: "book2 author", isBorrowed: false)
var book3 = Book(bookID: unicID, title: "book3", author: "book3 author", isBorrowed: false)
var book4 = Book(bookID: unicID, title: "book4", author: "book4 author", isBorrowed: false)

var owner1 = Owner(ownerId: unicID, name: "first owner", borrowedBooks: [])
var owner2 = Owner(ownerId: unicID, name: "second owner", borrowedBooks: [])
var owner3 = Owner(ownerId: unicID, name: "third owner", borrowedBooks: [])

var libraryVariable = Library(booksArray: [book1, book2], ownersArray: [owner1, owner2])

for book in libraryVariable.booksArray {
    print(book.title)
}
for owner in libraryVariable.ownersArray {
    print(owner.name)
}
print("---------")

libraryVariable.addBook(newBook: book3)
libraryVariable.addOwners(newOwner: owner3)

for book in libraryVariable.booksArray {
    print(book.title)
}
for owner in libraryVariable.ownersArray {
    print(owner.name)
}

print("---------")

owner1.borrowedBooks

owner1.takeBook(library: libraryVariable, myBook: book1)
owner2.takeBook(library: libraryVariable, myBook: book1)
owner1.takeBook(library: libraryVariable, myBook: book3)
owner3.takeBook(library: libraryVariable, myBook: book4)

print("---------")

owner1.returnBook(inLibrary: libraryVariable, myBook: book1)
owner2.takeBook(library: libraryVariable, myBook: book1)

print("--------------")

libraryVariable.findBorrowed()

print("--------------")

libraryVariable.findAllBooksWeHave()

print("--------------")



//Optional:
//
//
//
//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
class Generator {
    
    var array = ["დავინახე თუ არა მივხვდი, რომ – დევიღუპე ",
                 "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად.",
                 "სულის ტკივილამდე ვტკივილობ…",
                 "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
                 "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ",
                 "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე",
                 "თქვენ მოჰკალით ძერა?",
                 "ბებიააა... ბებია... ოლია მათხოვარი მევიდა..."]
    
    func returnRandom() -> String {
        if !array.isEmpty {
            let random = Int.random(in: 0..<array.count)
            return array[random]
        } else {
            return "❌"
        }
    }
    
    func addExpression(new: String) {
        array.append(new)
    }
    func removeExpression(remove: [String]) {
        
    }
}

var randomJoke = Generator()
print(randomJoke.returnRandom())
randomJoke.addExpression(new: "მზე აღარ ამოდის ჩაგვიჭრეს")
print(randomJoke.array[randomJoke.array.count-1])
