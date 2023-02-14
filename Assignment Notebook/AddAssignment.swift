////
////  AddHomeworkView.swift
////  Assignment Notebook
////
////  Created by Owen Johnson on 2/7/23.
////
//
import SwiftUI

struct AddAssignment: View {
    @ObservedObject var assignment: AssignmentNotebook
    @State private var classPicker = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let classes = ["History", "Mobile Apps", "English", "Math", "Science", "Spanish"]
    var body: some View {
        NavigationView{
                Form{
                    Picker("importance", selection: $classPicker){
                        ForEach(Self.classes, id: \.self){
                            Class in Text(Class)
                        }
                    }
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                .navigationBarTitle("Add New Assignment", displayMode: .inline)
                .navigationBarItems(trailing: Button("Save"){
                    if classPicker.count > 0 && description.count > 0{
                        let Assignment = Assignment(id: UUID(), classPicker: classPicker, description: description, dueDate: dueDate)
                        assignment.Assignments.append(Assignment)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignment(assignment: AssignmentNotebook())
    }
}
