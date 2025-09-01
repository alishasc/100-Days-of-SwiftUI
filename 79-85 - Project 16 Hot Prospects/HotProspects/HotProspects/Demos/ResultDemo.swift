//
//  ResultDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI

struct ResultDemo: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        // given the Task object the name of 'fetchTask' - gives us flexibility to pass it around or cancel it if needed
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            // returns value! - stored in our Task instance so we can read it in the future when ready
            return "Found \(readings.count) readings"
        }
        
        // to read the result from a Task
        let result = await fetchTask.result
        
        // to read successful value directly from the Result - make sure to handle errors
//        do {
//            // update @State var to show the result in the view
//            output = try result.get()
//        } catch {
//            output = "Error: \(error.localizedDescription)"
//        }
        
        // or use a switch to check both the success and failure cases
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ResultDemo()
}
