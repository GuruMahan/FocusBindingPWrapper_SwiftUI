//
//  FocusValueView.swift
//  FocusBindingPWrapperPOC
//
//  Created by Guru Mahan on 21/02/23.
//

import SwiftUI

struct FocusValueView: View {
    @FocusedBinding(\.price) var price: Int?
    var body: some View {
        VStack{
         
                if let price = price{
                    Text("FocusedBinding price = \(String(describing: price))")
                }
         
            VStack {
                NoteEditor()
                NoteFormatter()
            }.border(Color.red)
        }
    }
}

struct NoteEditor: View {
    @State private var note = ""

    var body: some View {
        TextEditor(text: $note)
            .frame(width: 300, height: 300)
            .focusedValue(\.noteBinding, $note)
    }
}

struct NoteFormatter: View {
    @FocusedBinding(\.noteBinding) var note
    @FocusedBinding(\.price) var price
    var body: some View {
        VStack {
            Text(note ?? "")
            Button("Clear note") {
                note = ""
            }
        }
    }
}
struct FocusedNoteBinding: FocusedValueKey {
    typealias Value = Binding<String>
}

extension FocusedValues {
    var noteBinding: FocusedNoteBinding.Value? {
        get { self[FocusedNoteBinding.self] }
        set { self[FocusedNoteBinding.self] = newValue }
    }
}
struct FocusValueView_Previews: PreviewProvider {
    static var previews: some View {
        FocusValueView()
    }
}
