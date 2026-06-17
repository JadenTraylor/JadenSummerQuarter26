//
//  TaskManager.swift
//  PracticeProjectA
//
//  Created by Ja'Den Traylor on 6/16/26.
//

import SwiftUI

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var isComplete: Bool
}


struct TaskManager: View {
    @State private var tasks = [
        TaskItem(title: "Clean Room", isComplete: false),
        TaskItem(title: "Cook Dinner", isComplete: false)
    ]
    
    var body: some View {
        List{
            ForEach($tasks) {$task in 
                Toggle(task.title, isOn: $task.isComplete)
                
            }
        }
    }
}

#Preview {
    TaskManager()
}
