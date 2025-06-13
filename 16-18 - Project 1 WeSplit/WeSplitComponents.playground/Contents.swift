import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    // doesn't need to be marked with @State as it's a constant - it's not changing
    let students = ["Harry", "Hermione", "Ron"]
    // this value can change in Picker so it's marked with @State
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    ForEach(0 ..< 5) { number in
                        Text("Row \(number)")
                    }
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            // makes title smaller
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
