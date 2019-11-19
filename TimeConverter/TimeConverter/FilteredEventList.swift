//
//  FilteredEventList.swift
//  TimeConverter
//
//  Created by brad.gayman on 11/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI
import CoreData

enum Stroke: String, CaseIterable {
    case butterfly
    case backstroke
    case freestyle
    case breast
    case medley
}

struct FilteredEventList: View {
    @FetchRequest var entries: FetchedResults<Event>
    @Environment(\.managedObjectContext) var moc
    var stroke: Stroke

    init(stroke: Stroke) {
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Event.date, ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "stroke == %@", stroke.rawValue)
        self._entries = FetchRequest(fetchRequest:fetchRequest, animation: .default)
        self.stroke = stroke
    }

    var body: some View {
        List {
            ForEach(entries, id:\.self ) { ent in
                SingleEvent(event: ent)
            }
        }.navigationBarTitle(Text(stroke.rawValue))
    }
}

struct SingleEvent : View {
    var event: Event
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()

    var body: some View {
        VStack.init(alignment: .leading, spacing: 10) {
            HStack {
                Text("\(event.date ?? Date(), formatter: self.dateFormatter)").font(.title).foregroundColor(Color.black)
                Text(event.course).font(.subheadline).foregroundColor(Color.blue)
            }
            HStack {
                Text("\(event.distance)").font(.body).foregroundColor(Color.gray)
                Text("\(event.stroke ?? "")").font(.body).italic().foregroundColor(Color.gray)
            }
        }
    }
}
