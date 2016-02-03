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




