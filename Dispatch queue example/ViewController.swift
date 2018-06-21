//
//  ViewController.swift
//  Dispatch queue example
//
//  Created by Ekramul Hoque on 30/5/18.
//  Copyright © 2018 Ekramul Hoque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var inactiveQueue:DispatchQueue!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //        simpleQueue()
        //        queuesWithQosAtrribute()
        
        concurrentQueue()

        // if let... inactiveQueue isn't nil? - start is!
        if let queue = inactiveQueue {

            queue.activate()
        }

        gloablQueue()
    }
    
    
    
    func concurrentQueue(){
        //create newQueue with userInitiated Qos
        
        //        let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.background, attributes: .concurrent)
        //        let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.background, attributes: [.initiallyInactive,.concurrent])
        //        inactiveQueue = newQueue
        
//         let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.userInitiated) // serial queue
//         let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.userInitiated, attributes: .concurrent) // concurent queue
        
        //let newQueue = DispatchQueue(label: "com.concurrent.ekram", qos: DispatchQoS.background, attributes: .initiallyInactive) // in active!
        let newQueue = DispatchQueue(label: "com.newConcurent.ekram", qos: .background, attributes: [.initiallyInactive, .concurrent])
        inactiveQueue = newQueue // outFunc property init parameters
        
        
        // active state and viewDidAppear don’t know about queue so its need to active manually
        // start it (inactiveQueue) in func viewWillAppear
        
        newQueue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        
        newQueue.async {
            for i in 0..<10 {
                print("General Lover : ❤️",i)
            }
        }
        
        newQueue.async {
            for i in 0..<10 {
                print("Yallow love :💛",i)
            }
        }
    }
    
    func simpleQueue() {
        //create cuostom Queue
        let queue = DispatchQueue(label: "com.simpleQueue.Ekram")
        
        // Async Custom Queue
        queue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        
        //Main Queue
        for i in 100..<110 {
            print("General Lover : ❤️",i)
        }
        
    }
    
    func queuesWithQosAtrribute() {
        
        //create DispathQueue with Qos Attribute
        
        let queueOne = DispatchQueue(label: "com.queues.ekram", qos: .background) // or ...qos: DispatchQoS.userInitiated)
        let queueTwo = DispatchQueue(label: "com.queues.ekram", qos: DispatchQoS.utility)
        
        /*
         change one (queueOne) to:
         qos: .utility
         qos: .userInitiated
         qos: .background
         qos: .userInteractive
         ...
         and see result
         */
        
        
        queueOne.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
        
        queueTwo.async {
            for i in 100..<110 {
                print("General Lover : ❤️",i)
            }
        }
        
        // Main queue
        for i in 500..<510 {
            print("Yallow love :💛",i)
        }
    }
    
    func gloablQueue() {
        
//        let globalQueue = DispatchQueue.global() // Если мы не укажем qos, это будет default qos
        let globalQueue = DispatchQueue.global(qos: .background)
        
        globalQueue.async {
            for i in 0..<10 {
                print("Custom Green Love: 💚",i)
            }
        }
    }
    
}

/*
 
 Synchronous vs Asynchronous:
 
 Synchronous :
 Synchronous method wait for the return still complete task Than return.
 Synchronous block current thread for the complete task
 
 Asynchronous:
 asynchronous return immediately without waiting for the complete task .
 asynchronous don’t block current thread its return immediately

 
 */
