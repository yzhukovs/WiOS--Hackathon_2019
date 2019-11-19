//
//  SwiftUIView.swift
//  TimeConverter
//
//  Created by Yvette Zhukovsky on 11/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NewEventView()) {
                VStack {
                    Text("Add Entry")
                    Image(systemName: "plus")
                        .foregroundColor(Color.blue)
                }
                
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
