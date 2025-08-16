//
//  DocDirectWriteDemo.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import SwiftUI

struct DocDirectWriteDemo: View {
    @State private var readData: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // tutorial example
            //        Button("Read and Write") {
            //            // data to write to the file - converted to Data type
            //            let data = Data("Test Message".utf8)
            //            // name of file to write the data to
            //            let url = URL.documentsDirectory.appending(path: "message.txt")
            //
            //            do {
            //                // try writing the data to the file
            //                try data.write(to: url, options: [.atomic, .completeFileProtection])
            //                // read back the data from the file and print it
            //                let input = try String(contentsOf: url, encoding: .utf8)
            //                print(input)
            //            } catch {
            //                print(error.localizedDescription)
            //            }
            //        }
            
            // using FileManager extension
            Button("Write using FileManager extension") {
                FileManager.default.writeString("Hello! :)", to: "message.txt")
            }
            
            Button("Read using FileManager extension") {
                readData = FileManager.default.readString(from: "message.txt")
            }
            
            Text(readData)
        }
    }
}

#Preview {
    DocDirectWriteDemo()
}

extension FileManager {
    func writeString(_ string: String, to directoryName: String) {
        let data = Data(string.utf8)
        let url = URL.documentsDirectory.appending(path: directoryName)
        
        do {
            return try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readString(from directoryName: String) -> String {
        let url = URL.documentsDirectory.appending(path: directoryName)
        
        do {
            let input = try String(contentsOf: url, encoding: .utf8)
            print(input)
            return input
        } catch {
            print(error.localizedDescription)
            return error.localizedDescription
        }
    }
}
