//
//  IssueViewController.swift
//  Multitasking
//
//  Created by 謝飛飛 on 2019/4/16.
//  Copyright © 2019 MarkFly. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        //        tryQueue()
        //        priorityInverstion()
        //        raceCondition()
        crash()
    }
    
    func tryQueue()
    {
        //        let queue = DispatchQueue.init(label: "")
        let queue = DispatchQueue.init(label: "", attributes: .concurrent)
        
        //        //串行同步, 同步會塞車所以照順序
        //        //並行同步, 同上
        //        queue.sync {
        //            print(1)
        //        }
        //        print(2)
        //        queue.sync {
        //            print(3)
        //        }
        //        print(4)
        
        //        //串行異步, 異步順序不定, 但一定先1再3, 先2再4, 先2再3
        //        //並行異步, 同上
        //        queue.async {
        //            print(1)
        //        }
        //        print(2)
        //        queue.async {
        //            print(3)
        //        }
        //        print(4)
        
        //        //串行異步包同步, 152死鎖
        //        //並行異步包同步, 同步只會塞住一個線程, 開了多條, 所以不會死鎖, 15234or12534or12354or12345(5跟234順序不定)
        //        print(1)
        //        queue.async {
        //            print(2)
        //            queue.sync {
        //                print(3)
        //            }
        //            print(4)
        //        }
        //        print(5)
        
        //串行同步包異步, 12345,12435,12453(3什麼時候回來不知道)
        //並行同步包異步,       12435,12453
        print(1)
        queue.sync {
            print(2)
            queue.async {
                print(3)
            }
            print(4)
        }
        print(5)
    }
    
    func crash()
    {
        let queue = DispatchQueue.global()
        var arr = [Int]()
        for i in 0..<10000 {
            queue.async {
                print("add \(i)")
                arr.append(i)
            }
        }
        
    }
    
    func raceCondition()
    {
        var num = 0
        DispatchQueue.global().async {
            for _ in 1...10000
            {
                num += 1
            }
        }
        
        for _ in 1...10000
        {
            num += 1
        }
        
        print(num)
    }
    
    func priorityInverstion()
    {
        let highQ = DispatchQueue.global(qos: .userInitiated)
        let lowQ = DispatchQueue.global(qos: .utility)
        let semaphore = DispatchSemaphore.init(value: 1) //信號燈
        
        lowQ.async {
            print("low")
        }
        highQ.async {
            print("high")
        }
        
        //        lowQ.async {
        //            semaphore.wait()
        //            print("low")
        //            semaphore.signal()
        //        }
        //        highQ.async {
        //            semaphore.wait()
        //            print("high")
        //            semaphore.signal()
        //        }
    }
}
