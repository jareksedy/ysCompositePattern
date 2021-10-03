//
//  ContentView.swift
//  ysCompositePattern
//
//  Created by Ярослав on 03.10.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myTaskTree = Task(name: "My tasks", parent: nil)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myTaskTree.children) { child in
                    Text(child.name).padding()
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(myTaskTree.name).padding()
            .toolbar {
                Button("Add task") {
                    textAlert() { userInput in
                        guard userInput != "" else { return }
                        myTaskTree.add(child: Task(name: userInput, parent: myTaskTree))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}

