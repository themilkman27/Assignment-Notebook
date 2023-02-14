import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentNotebook = AssignmentNotebook()
    @State private var showingAddAssignmentView = false
    var body: some View {
            NavigationView{
                ZStack{

                List{
                    ForEach(assignmentNotebook.Assignments){
                        Assignment in HStack{
                            VStack(alignment: .leading){
                                Text(Assignment.classPicker)
                                    .font(.headline)
                                Text(Assignment.description)
                            }
                            Spacer()
                            Text(Assignment.dueDate, style: .date)
                        }
                    }
                    .onMove{indices, newOffset in assignmentNotebook.Assignments.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onDelete{indexSet in assignmentNotebook.Assignments.remove(atOffsets: indexSet)}
                }
                .sheet(isPresented: $showingAddAssignmentView, content: {
                    AddAssignment(assignment: assignmentNotebook)
                })

                .navigationBarTitle("Assignment Notebook", displayMode: .inline)
                .background(Color.purple)
                .navigationBarItems(leading: EditButton(), trailing: Button(action:{
                    showingAddAssignmentView = true }){
                        Image(systemName: "plus")
                    })
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Assignment: Identifiable, Codable{
    var id = UUID()
    var classPicker = String()
    var description = String()
    var dueDate = Date()
}

