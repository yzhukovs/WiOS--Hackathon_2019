//
//  ContentView.swift
//  TimeConverter
//
//  Created by Yvette Zhukovsky on 11/14/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct NewEventView: View {
    @Environment(\.managedObjectContext) var moc
    var courses = ["SCY", "SCM", "LCM"]
    @State private var selectedCourse = 0
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Pick Course")
            Picker(selection: $selectedCourse, label: Text("")) {
                ForEach(0 ..< courses.count) {
                    Text(self.courses[$0])
                }
                
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            
            
            VStack {
                Button(action: ({
                    //  Initializes new Event and saves using the @Environment's ManagedObjectContext
                    let event = Event(context: self.moc)
                    event.course = self.courses[self.selectedCourse]
                    print(event.course)
                    do {
                        try self.moc.save()
                        
                    } catch {
                        print(error)
                    }
                    
                    //  Reset the temporary in-memory storage variable for the next new entry
                    self.selectedCourse = 0
                    
                })) {
                    HStack {
                        
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        Text("Save")
                    }
                }
                .padding()
                
            }
        }

    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView()
    }
}
