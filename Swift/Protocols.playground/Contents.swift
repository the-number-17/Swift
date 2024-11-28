//By Aviral on Nov 28th 2024
import Foundation
print("Hey .. ")

let myName = "Aviral"
print(myName)

let myNumber=17
print(myNumber)

let myBooleanValue = false
print(myBooleanValue)
//CustomStringConvertible protocol
//requires a description variable
class Shoe:CustomStringConvertible {
    var description: String {
        return "The shoe has \(color) and is of size \(size) and \(hasLaces ? "has" : "does not have") laces"
    }
    var color: String
    var size:Int
    var hasLaces:Bool
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
        
        }
    }

let myShoe = Shoe(color: "Purple", size: 8, hasLaces: true)
print(myShoe)
                                                                                                
 //Equatable protocol
//Should have a static function for "=="
//Why String prints directly for an instance but a class shows lldb error?
struct Employee: Equatable,Comparable,Codable{
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName < rhs.firstName
    }
    //can be done through classes as well
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    init(firstName: String, lastName: String, jobTitle: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
        self.phoneNumber = phoneNumber
    }
    static func ==(lhs: Employee, rhs: Employee) -> Bool{
            return  lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.jobTitle == rhs.jobTitle && lhs.phoneNumber == rhs.phoneNumber
    }
}
struct Company: Codable{
    var employee: [Employee]
    let name: String
    init(employeea: [Employee], name: String) {
        self.employee = employee
        self.name = name
    }
}
//The two instances of a class can be compared using the identity operaator that is "==="
// The identity operator checks whether the instances are allocated in the same memory or not hence you can only check class intances , as struct are value type not instance types

let Employee1 = Employee(firstName: "chandu", lastName: "mohan", jobTitle: "singer", phoneNumber: "12345676890")
let Employee2 = Employee(firstName: "deva", lastName: "shish", jobTitle: "dancer", phoneNumber: "0987654321")
let Employee3 = Employee(firstName: "monu", lastName: "ding", jobTitle: "boxer", phoneNumber: "3456789012")
let Employee4 = Employee(firstName: "chonu", lastName: "dong", jobTitle: "sweeper", phoneNumber: "9876543210")
let Employee5 = Employee(firstName: "sonu", lastName: "dang", jobTitle: "player", phoneNumber: "1567890113")
//if Employee1 == Employee2
//    //It will work for != as well as swift automaticallly recognizes its use
//{
//    print("Both Are Same")
//}
var employees = [Employee1, Employee2, Employee3, Employee4, Employee5]
//Conmparable protocol
//Should have static function of "<" AND should also conform to the EQUATABLE protocol
var sortedEmployees = employees.sorted(by: <)
for emp in sortedEmployees {
    print(emp)
}
//CODEABLE PROTOCOL
//Requires ab encode method
