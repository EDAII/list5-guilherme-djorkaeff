import UIKit

class CoinChange: NSObject {
    private let sortedCoinSet: [Int]
    private var cache: [Int : [Int]]
    
    init(coinSet: [Int]) {
        self.sortedCoinSet = coinSet.sorted(by: { $0 > $1} )
        self.cache = [:]
    }
    
    func changeGreedy(_ value: Int) -> [Int] {
        var change:  [Int] = []
        var newValue = value
        
        for coin in sortedCoinSet {
            while newValue - coin >= 0 {
                change.append(coin)
                newValue -= coin
            }
            
            if newValue  == 0 {
                break
            }
        }
        
        return change
    }
}
