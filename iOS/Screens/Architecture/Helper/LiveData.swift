//
//  LiveData.swift
//  iOS
//
//  Created by Shubham Jitiya on 14/07/23.
//

import Foundation

class LiveData<T> {
    
    typealias Observer = (T) -> ()
    
    // MARK: - Variables
    var observers = [Observer]()
    var value: T {
        didSet {
            notifyObservers(value)
        }
    }
    
    // MARK: - Initializers
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Functions
    private func notifyObservers(_ value: T) {
        observers.forEach { observer in
            observer(value)
        }
    }
    
    func addObserver(_ observer: @escaping Observer) {
        observers.append(observer)
        observer(value)
    }
}
