//
//  SwiftUIView.swift
//  TimeConverter
//
//  Created by Yvette Zhukovsky on 11/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    @FetchRequest(entity: Event.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var entry: FetchedResults<Event>


    var body: some View {

        VStack {
            if entry.count == 0 {
                NavigationView {
                        NavigationLink(destination: NewEventView()) {
                           VStack {
                                Text("Add Entry")
                                Image(systemName: "plus")
                                    .foregroundColor(Color.blue)
                            }
                    }
                }
            }  else {
                List {
                    ForEach(entry, id:\.self ) { enter in
                        Text("\(enter.course)")
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
