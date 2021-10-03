//
//  CompositePattern.swift
//  ysCompositePattern
//
//  Created by Ярослав on 03.10.2021.
//

import Foundation
import SwiftUI

protocol TaskComposite {
    var id: UUID { get }
    var parent: TaskComposite? { get }
    var children: [Task] { get set }
    var name: String { get }
    
    func add(child: Task)
}

class Task: TaskComposite, Identifiable, ObservableObject {
    let id = UUID()
    var parent: TaskComposite?
    @Published var children: [Task] = []
    var name: String
    
    init(name: String, parent: TaskComposite?) {
        self.name = name
        self.parent = parent
    }
    
    func add(child: Task) {
        children.append(child)
    }
}
