//
//  ListItem.swift
//  ysCompositePattern
//
//  Created by Ярослав on 04.10.2021.
//

import SwiftUI

struct ListItemView: View {
    @ObservedObject var task: Task
    
    var body: some View {
        NavigationLink(destination: SubView(task: task)) {
            VStack(alignment: .leading) {
                Text(task.name).font(.title)
                Text("Subtasks: \(task.children.count)").foregroundColor(.secondary)
            }.padding()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(task: previewTask).preferredColorScheme(.dark)
    }
}
