//
//  NotesAuthView.swift
//  NotesAuth
//
//  Created by user231253 on 4/1/23.
//

import SwiftUI

struct NotesAuthView: View {
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.title)
                    }
                }
                Section {
                    NavigationLink  {
                        NoteDetail(note: $note)
                    } label: {
                        Text("New Note")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear {
                noteApp.fetchData()
            }
            .refreshable {
                noteApp.fetchData()
            }
        }
        
    }
}
    
struct NotesAuthView_Previews: PreviewProvider {
    static var previews: some View {
        NotesAuthView()
    }
}
