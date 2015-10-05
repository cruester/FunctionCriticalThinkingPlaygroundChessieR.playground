//This playground determines what time I should leave my house for my 12 o'clock class

import UIKit

let gasGauge = 0.47 //This constant stores the number on my gas gauge
let threshold = 0.25 //This constant stores the minimum amount of gas the car can have in its tank before I want to fill it.
let weather: String = "Rain" //This constant describes the weather

//This closure returns the value that the addGasTime function will use 
//to determine if it should return a value or not
let myClosure = { (fullness: Double, threshold : Double) -> Bool in
    
   return fullness < threshold};

//This closure returns the value that the addWeatherTime function
//will use to determine if it should return a value or not
let weatherClosure = { (weatherMarker: String) -> Bool in
    return (weatherMarker == "Snow")||(weatherMarker == "Rain")};


//This function calculates my departure time
func departureTime() -> Int
{
    //This function returns the base time it takes to get to school
    func addBaseTime() -> Int
    {
        var baseTime = 15 //It takes me 15 mins minimum to get to school
        return baseTime
    }
    
    let minimumTime = addBaseTime() //Here, I assign my base time to a variable so it's easier to use
    
    //This function adds time needed to get gas before school if needed
    //If the closure returns true, it means I need to allot more time
    func addGasTime(v1: Bool) -> Int
    {
        var accumulator = 0
        if v1
        {
            accumulator += 15
        }
        else
        {
            accumulator += 0
        }
    
        return accumulator
    }
    
    let closureVal = myClosure(gasGauge, threshold) //Here, I pass arguments into the closure and assign the whole
                                                    // thing to a variable so I can pass that into the addGasTime function
    
    var departure = 60 - minimumTime - addGasTime(closureVal) //departure keeps track of what time I need to leave
    
    //This function adds time needed to battle the weather
    //If the closure returns true, there's bad weather and I need more time
    func addWeatherTime(v2: Bool) -> Int
    {
        var accumulator = 0
        if v2
        {
            accumulator += 15
        }
        else
        {
            accumulator += 0
        }
        return accumulator
    }
    
    let weatherClosureVal = weatherClosure(weather)
    
    
    departure = departure - addWeatherTime(weatherClosureVal)
    
    return departure
    
}

println("You should leave at 11:\(departureTime())")







