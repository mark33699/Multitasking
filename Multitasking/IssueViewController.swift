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

//        crash()
        //        priorityInverstion()
        //        raceCondition()
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
