//
//  ContentView.swift
//  ysCompositePattern
//
//  Created by Ярослав on 03.10.2021.
//

import SwiftUI

struct RootView: View {
    @StateObject var myTaskTree = Task(name: "Root task", parent: nil)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myTaskTree.children) { child in
                    NavigationLink(destination: EmptyView()) {
                        VStack(alignment: .leading) {
                            Text(child.name).font(.title)
                            Text("Subtasks: \(child.children.count)").foregroundColor(.secondary)
                                
                        }.padding()
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(myTaskTree.name).padding()
            .toolbar {
                Button("Add subtask") {
                    textAlert() { userInput in
                        guard userInput != "" else { return }
                        myTaskTree.add(child: Task(name: userInput, parent: myTaskTree))
                    }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().preferredColorScheme(.dark)
    }
}

