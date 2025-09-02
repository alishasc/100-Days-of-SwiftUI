//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Alisha Carrington on 26/08/2025.
//

import CodeScanner  // imported package
import SwiftData
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var prospects: [Prospect]
    @State private var isShowingScanner = false  // qr code scanner
    @State private var selectedProspects = Set<Prospect>()
    
    // sort prospects order based on Menu selection
    @State private var sortByName = true
    var sortedProspects: [Prospect] {
        switch(sortByName) {
        case true:
            prospects.sorted { $0.name < $1.name }
        case false:
            // show newest first
            prospects.sorted { $0.dateAdded > $1.dateAdded }
        }
    }
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    // title changes depending on the selected tab and associated its FilterType
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted People"
        case .uncontacted:
            "Uncontacted People"
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            // set showContactedOnly to true if our filter is set to .contacted
            let showContactedOnly = filter == .contacted
            
            // apply custom query filter to the prospects array
            _prospects = Query(filter: #Predicate {
                // for each prospect, check if isContacted matches showContactedOnly - will filter between contacted/uncontacted people
                $0.isContacted == showContactedOnly
            })
        }
    }
    
    var body: some View {
        NavigationStack {
            List(sortedProspects, selection: $selectedProspects) { prospect in
                NavigationLink {
                    EditContactView(prospect: prospect)
                } label: {
                    HStack(spacing: 15) {
                        // only show icon on "Everyone" screen
                        if filter == .none && prospect.isContacted {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 25))
                                .foregroundStyle(.green)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .swipeActions {
                    // put first so gets the "swipe fully to activate" functionality
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    // swap prospects between the Contacted and Uncontacted lists
                    if prospect.isContacted {
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            // the updated Bool will be saved to permanent storage too
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                        
                        // trigger notification request
                        Button("Remind Me", systemImage: "bell") {
                            addNotification(for: prospect)
                        }
                        .tint(.orange)
                    }
                }
                .tag(prospect)  // tell List that each row corresponds to a single prospect
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort") {
                        Button {
                            sortByName = true
                        } label: {
                            HStack {
                                Text("Name")
                                Spacer()
                                if sortByName {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        
                        Button {
                            sortByName = false
                        } label: {
                            HStack {
                                Text("Recently Added")
                                Spacer()
                                if !sortByName {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                // simulatedData - to test if things work from the simulator
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            // separate the result back into two separate strings - name and email
            let details = result.string.components(separatedBy: "\n")
            // there should only be two elements in the array - name and email
            guard details.count == 2 else { return }
            
            // create new instance of Prospect using that info
            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            // notification will be triggered at 9am
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        // getNotificationSettings - read whether notifications are currently allowed
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                // requestAuthorization - ask for permission to show notifications
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
