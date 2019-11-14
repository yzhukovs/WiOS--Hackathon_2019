//
//  ContentView.swift
//  TimeConverter
//
//  Created by Yvette Zhukovsky on 11/14/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Event.entity(), sortDescriptors: []) var entry: FetchedResults<Event>
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
