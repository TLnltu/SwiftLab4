import Foundation

let myOperationQueue: OperationQueue = OperationQueue()
var accountBalance: Int = 1000
let balanceAccessQueue = DispatchQueue(label: "com.example.balanceAccessQueue", attributes: .concurrent)

func withdraw(amount: Int) {
    myOperationQueue.addOperation {
            if accountBalance >= amount {
                //Thread.sleep(forTimeInterval: 1)
                accountBalance -= amount
                print("Withdrawal successful. Remaining balance: \(accountBalance)")
            } else {
                print("Insufficient funds")
            }
    }
}

func refillBalance(amount: Int) {
    myOperationQueue.addOperation {
            //Thread.sleep(forTimeInterval: 1)
            accountBalance += amount
            print("Refill successful. Remaining balance: \(accountBalance)")
    }
}

for _ in 1...5 {
    withdraw(amount: 100)
    refillBalance(amount: 100)
}

Thread.sleep(forTimeInterval: 3)
