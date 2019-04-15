//
//  OperationViewController.swift
//  Multitasking
//
//  Created by MarkFly on 2019/4/15.
//  Copyright © 2019 MarkFly. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController
{
    var operations = [BlockOperation]()
    let queue = OperationQueue.init()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let op1 = BlockOperation.init {
//            self.queue.isSuspended = true
            //下面還是會跑完
            NSLog("1來也~~~~")
            printIsReady()
        }
        //雖然op2依賴op1, 但不用等completionBlock跑完
//        op1.completionBlock = {
//            self.queue.isSuspended = true
//        }
        let op2 = BlockOperation.init {
            NSLog("2來也~~~~")
            printIsReady()
        }
        let op3 = BlockOperation.init {
            NSLog("3來也~~~~")
            printIsReady()
        }
        //隊列已空
//        op3.completionBlock = {
//            print(self.queue.operations)
//        }
        
        operations = [op1,op2,op3]
        //優先度...好像沒什麼用
//        op3.queuePriority = .veryHigh
//        op2.queuePriority = .normal
//        op1.queuePriority = .veryLow
        //相依
//        op2.addDependency(op1)
//        op3.addDependency(op2)
        //不會因為取消導致相依的任務不執行
//        op2.cancel()
        //也不會因為取消了就把相依的任務移出
//        print(op3.dependencies)
        
        //死鎖2(但不會閃退, 只是都不跑)
        op2.addDependency(op1)
        op1.addDependency(op2)
        
        queue.addOperations(operations, waitUntilFinished: false)
        
        func printIsReady()
        {
            for (index, element) in self.operations.enumerated()
            {
                print("\(index) is \(element.isReady)")
            }
        }
    }
}
