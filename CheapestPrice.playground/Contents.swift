import Foundation

struct City {
    var cityId: Int
    var flights: [Flight] = []
}

struct Flight {
    var source: Int
    var destination: Int
    var price: Int
}

class Solution {
    
    var cities: [City] = []
    var visitedCities: Set<Int> = []
    var lowestPrices: [Int] = []
    var previousCities: [Int] = []
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        let edges = flights
        lowestPrices = Array(repeating: Int.max, count: n)
        lowestPrices[src] = 0
        previousCities = Array(repeating: 0, count: n)
        visitedCities.insert(0)
        cities = setUpCities(n)
        cities = setUpFlights(edges, cities: cities)
        
        let src = cities[src]
        findCheapestPrice(src: src, maxHops: K, hops: 0)
        
        let lowestPrice = lowestPrices[dst]
        return lowestPrice == Int.max ? -1 : lowestPrice
    }
    
    func findCheapestPrice(src: City, maxHops: Int, hops: Int) {
        if src.flights.isEmpty {
            return
        }
        var flights = src.flights
        flights = flights.sorted() { $0.price < $1.price }
//        for flight in flights {
        if let flight = flights.first {
            let source = flight.source
            let destination = flight.destination
            let price = flight.price
            let destPrice = lowestPrices[destination]
            let updatedPrice = lowestPrices[source] + price
            if updatedPrice < destPrice {
                lowestPrices[destination] = updatedPrice
                previousCities[destination] = source
            }
            
            if !visitedCities.contains(destination) {
                findCheapestPrice(src: cities[destination], maxHops: maxHops, hops: hops)
            }
        }
        visitedCities.insert(src.cityId)
    }
    
    func setUpCities(_ n: Int) -> [City] {
        var cities: [City] = []
        for i in 0..<n {
            let city = City(cityId: i, flights: [])
            cities.append(city)
        }
        return cities
    }
    
    func setUpFlights(_ edges: [[Int]], cities: [City]) -> [City] {
        var cities = cities
        for edge in edges {
            let cityIndex = edge[0]
            let FlightIndex = edge[1]
            let price = edge[2]
            var city = cities[cityIndex]
            let flight = Flight(source: cityIndex, destination: FlightIndex, price: price)
            city.flights.append(flight)
            cities[cityIndex] = city
        }
        return cities
    }
}

//let n = 3
//let flights = [[0,1,100],[1,2,100],[0,2,500]]
//let src = 0
//let dst = 2
//let K = 0

let n = 4
let flights = [[0,1,1],[0,2,5],[1,2,1],[2,3,1]]
let src = 0
let dst = 3
let K = 1

let solution = Solution()

print(solution.findCheapestPrice(n, flights, src, dst, K))
