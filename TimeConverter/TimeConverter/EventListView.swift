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
        NavigationView {
            VStack {

                List {
                    ForEach(entry, id:\.self ) { enter in
                        Text("\(enter.course)")
                    }
                }
                .navigationBarTitle("Your Saved Events")

                NavigationLink(destination: NewEventView()) {
                    VStack {
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
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
