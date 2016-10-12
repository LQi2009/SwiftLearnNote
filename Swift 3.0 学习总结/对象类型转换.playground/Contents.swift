//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类型转换
class MediaItem {
    
    var name: String
    
    init (name: String) {
        
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String , director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String ,artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [Movie(name: "Casablance",director: "Michael"),Song(name: "blue suede shoes",artist: "elvis"),Movie(name: "cotizen",director: "orson"),Song(name: "the one",artist: "chesney"),Song(name: "never",artist: "rick")]

var movieCount = 0
var songCount = 0

//类型判断 is
for item in library {
    
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

movieCount
songCount

//类型转换 as  as?
for item in library {
    
    if let movie = item as? Movie {
        print("Movie: \(movie.name)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)'")
    }
}


// AnyObject 类型
let someObject: [AnyObject] = [Movie(name: "2001",director: "stanley"),Movie(name: "Moon",director: "dincan"),Movie(name: "Alien",director: "ridley")]

for object in someObject {
    
    let movie = object as! Movie
    
    print("Movie: \(movie.name)")
    
}


// Any 类型
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "costbusters", director: "ivan"))

