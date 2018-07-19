// Todd Wenker
// CSE355
// Quiz 1
// Jan 22, 2017

import Cocoa

// Question 1
var age:Int?
let gravity = 9.8

// Question 2
var temp:Int = 100

switch temp {
case _ where temp >= 80:
    print("Swimming")
case 60...79:
    print("Tennis")
case 40...59:
    print("Golf")
case _ where temp <= 39:
    print("Skiing")
default:
    print("X")
}

// Question 3

let a = "ABCDE"
var b:String = ""

for index in stride(from:(a.count-1),to: -1, by: -1){
    b += String(a[a.index(a.startIndex, offsetBy: index)])
}
print(b)

// Question 4
// part i
func oddEvenSum(array:[Int]) ->(oddSum:Int,evenSum:Int){
    var oddSum:Int = 0
    var evenSum:Int = 0
    for x in array{
        // if x is odd
        if (x % 2) == 1{
            oddSum += x
        }
        else {
            evenSum += x
        }
    }
    
    return (oddSum, evenSum)
}

// part ii
func minMaxLengthString(array:[String]) -> (minLength:Int, maxLength:Int){
    var minLength:Int = array[0].count
    var maxLength:Int = array[0].count
    for x in array{
        if x.count < minLength{
            minLength = x.count
        }
        else if x.count > maxLength{
            maxLength = x.count
        }
    }
    
    return(minLength,maxLength)
}

// part iii
func searchArray(array:[Int],target:Int) -> (Bool){
    for x in array{
        if x == target{
            return true
        }
    }
    return false
}
// Question 5
var cities = [2.2:"Paris",8.7:"London", 3.4:"Berlin",11.9:"Moscow",2.8:"Kiev"]
var highestPop:Double = 0
for (cityPop,cityName) in cities{
    if cityPop > highestPop{
        highestPop = cityPop
    }
}
let largestCity = cities[highestPop]!
print("Highest pop: \(largestCity)")

var lowestPop:Double = 100
for(cityPop,cityName) in cities{
    if cityPop < lowestPop{
        lowestPop = cityPop
    }
}
let smallestCity = cities[lowestPop]!
print("Lowest pop: \(smallestCity)")

// Question 6
var students : [[String:Any]] =
    [[ "firstName": "John", "lastName": "Wilson", "gpa": 2.4 ], [ "firstName": "Nancy", "lastName": "Smith", "gpa": 3.5 ], [ "firstName": "Michael", "lastName": "Liu", "gpa": 3.1 ]]
var topStudent = students[0]
for dict in students{
    if let x = dict["gpa"] as? Double {
        if let y = topStudent["gpa"] as? Double {
            if x > y{
                topStudent = dict
            }
        }
    }
}

let firstName = topStudent["firstName"]!
let lastName = topStudent["lastName"]!
print("Highest GPA student: \(firstName) \(lastName)")







