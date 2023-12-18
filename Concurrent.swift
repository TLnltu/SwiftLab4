import Foundation

let concurrentQueue: DispatchQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
var accountBalance: Int = 1000
let dispatchGroup: DispatchGroup = DispatchGroup()

func withdraw(amount: Int) {
    concurrentQueue.async(group: dispatchGroup) {
        if accountBalance >= amount {
            // Thread.sleep(forTimeInterval: 1)
            accountBalance -= amount
            print("Withdrawal successful. Remaining balance: \(accountBalance)")
        } else {
            print("Insufficient funds")
        }
    }
}

func refillBalance(amount: Int) {
    concurrentQueue.async(group: dispatchGroup) {
        // Thread.sleep(forTimeInterval: 1)
        accountBalance += amount
        print("Refill successful. Remaining balance: \(accountBalance)")
    }
}

// Симуляція кількох операцій зняття та поповнення, що відбуваються паралельно
for _ in 1...5 {
    withdraw(amount: 100)
    refillBalance(amount: 100)
}
// Затримка головного потоку на 3 секунди для завершення всіх асинхронних операцій
Thread.sleep(forTimeInterval: 3)
