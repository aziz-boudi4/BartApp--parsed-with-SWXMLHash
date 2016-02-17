//: Playground - noun: a place where people can play

// my key ZW44-PTQ7-9ULT-DWE9

import UIKit
import SWXMLHash
import Foundation


//http://api.bart.gov/api/etd.aspx?cmd=etd&orig=ALL&key=MW9S-E7SL-26DU-VV8V


let path = NSBundle.mainBundle().URLForResource("etd-allStations", withExtension: "xml")
let xmlText = try String(contentsOfURL: path!)
//NSBundle.mainBundle().pathForResource("etd-allStations", ofType: "xml")




let xml = SWXMLHash.config {
  config in
  config.shouldProcessLazily = true
  }.parse(xmlText)

let count = xml["root"].all.count

func enumerate(indexer: XMLIndexer){
  for child in indexer.children {
    NSLog(child.element!.name)
    enumerate(child)
  }

}
//print(xml["root"]["station"].all)


//enumerate(xml)

var station = [String]()

// get all the stations and put them in an array
for elem in xml["root"]["station"].all{
  var stations = elem["name"].element!.text!
  station.append(stations)

}

print(station)




class Station {
  var name : String  // Lake Merrit
  var destinations:[(dest:String, times:[Int])] // [[Daly City : [3, 10, 17]], [Dublin : [7, 22, 37]]]


  init(withName name: String, destinations:[(dest:String, times:[Int])]){
    self.name = name
    self.destinations = destinations

  }
}





// create an empty array of Station class
var stationsTest = [Station]()

// create an empty array of destination
var destination = [String]()


// retrieve the name of the depart stations and add them to and array of Station add the.name
for elem in xml["root"]["station"].all{
  for elem2 in elem["etd"].all{
    var stations = elem["name"].element!.text!
    var destinationStation = elem2["destination"].element!.text!
    
    var stationPlaceHolder = Station(withName: stations, destinations: [(dest:destinationStation,times:[1])])
    stationsTest.append(stationPlaceHolder)


  }

}


print(stationsTest[0].name)
print(stationsTest[0].destinations)

for elem in stationsTest {
  print("\(elem.name)...\(elem.destinations)")
}


//var destination = [String]()
//
// get all the stations and put them in an array
for elem in xml["root"]["station"][12]["etd"].all{
  var destinations = elem["destination"].element!.text!
  destination.append(destinations)

}
print(destination) // ["Pittsburg/Bay Point", "SF Airport"]



//var times = [String]()
////
//// get all the stations and put them in an array
//for elem in xml["root"]["station"][12]["etd"]["estimate"].all{
//  var time = elem["minutes"].element!.text!
//  times.append(time)
//
//}
//
//print(times)


//// this line gets the minutes of a specific destination
//print(".......\(xml["root"]["station"][0]["etd"][0]["estimate"][0]["minutes"].all)")
////[<minutes>3</minutes>]\






//var exampleDest:[(dest:String, times:[Int])] = [(dest:"", times:[1])]
//exampleDest.append((dest: "aziz", times: [1,2,3]))

