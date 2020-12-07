//
//  ContentView.swift
//  myTasks
//
//  Created by Benjamin Benoit on 27/11/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var editMode = EditMode.inactive
    
//    @State private var tasks: [Task] = (0..<5).map { Task(title: "Item #\($0)") }
    
    @State private var tasks: [Task] = []
    private static var count = 0
    @State var showTaskSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    Text(task.title)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .navigationBarTitle("Tâches")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .environment(\.editMode, $editMode)
            .sheet(isPresented: $showTaskSheet, content: {
                AddTask()
            })
        }
        
    }
        
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onAdd() {
//        tasks.append(Task(title: "Item #\(Self.count)"))
//        Self.count += 1
        showTaskSheet = true
    }
    
    private func onDelete(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    private func onMove(source: IndexSet, destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
