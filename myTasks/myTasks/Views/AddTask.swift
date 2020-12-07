//
//  AddTask.swift
//  myTasks
//
//  Created by Benjamin Benoit on 07/12/2020.
//

import SwiftUI

struct AddTask: View {
    
    
    @State var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tâche")) {
                    TextField("Titre", text: $title)
                }
                Button(action: {
                    guard self.title != "" else {return}
                }) {
                    Text("Valider")
                }
            }
            .navigationTitle("Ajouter une tâche")
        }
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
    }
}
