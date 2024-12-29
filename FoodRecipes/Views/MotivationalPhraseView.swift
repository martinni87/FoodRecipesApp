//
//  MotivationalPhraseView.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 23/12/24.
//

import SwiftUI

struct MotivationalPhraseView: View {
    
    @State var addNew = false
    @StateObject var network = NetworkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if network.phrasesSets.isEmpty {
                    Text("No phrases to show")
                } else {
                    let phrase = network.phrasesSets.randomElement()!.value
                    Text("Phrases:")
                    VStack(alignment: .leading) {
                        Text("ID: \(phrase.id)")
                        Text("Author: \(phrase.author)")
                        Text("Phrase: \(phrase.phrase)")
                    }
                }
                if network.usersSets.isEmpty {
                    Text("No users to show")
                } else {
                    Text("Users:")
                    ForEach(network.usersSets.keys.sorted(), id:\.self) { key in
                        Text("\(network.usersSets[key]?.name ?? "No name set")")
                    }
                }
                HStack {
                    Button("Fetch phrases") {
                        Task {
                            await network.fetchPhrasesData()
                        }
                    }
                    Button("Fetch users") {
                        Task {
                            await network.fetchUsersData()
                        }
                    }
                    Button("Reset") {
                        network.resetAllData()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("+") {
                    addNew.toggle()
                }
                .font(.largeTitle)
                .bold()
            }
        }
        .alert("Some went wrong", isPresented: $network.hasError) {
            HStack {
                Button("OK") {
                    //Do nothing
                }
                Button("Reset") {
                    network.resetAllData()
                }
            }
        } message: {
            Text(network.error)
        }
        .sheet(isPresented: $addNew) {
            AddNewView(network: network)
        }
    }
}

#Preview("DataTest") {
    MotivationalPhraseView()
}

import SwiftUI

struct AddNewView: View {
    
    @State var text = ""
    @State var author = ""
    @State var name = ""
    @State var tryToSaveValues = false
    @ObservedObject var network: NetworkViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Phrases to add").font(.largeTitle).bold()
                Text("Phrase").font(.caption).bold()
                TextField("Lorem Ipsum dolen", text: $text)
                Text("Author").font(.caption).bold()
                TextField("Frederic Ledgard", text: $author)
                Button("Save phrase") {
                    Task {
                        let phraseSet = PhraseSet(id: UUID().uuidString, author: self.author, phrase: self.text)
                        await network.patchPhrasesData(with: [phraseSet.id: phraseSet])
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("Users to add").font(.largeTitle).bold()
                Text("Name").font(.caption).bold()
                TextField("Name", text: $name)
                Button("Save user") {
                    Task {
                        let userData = UserData(id: UUID().uuidString, name: name)
                        await network.patchUsersData(with: [userData.id: userData])
                    }
                }
            }
            .navigationTitle("Add new phrase")
            .alert("Done", isPresented: $network.dataSent) {
                Button("OK") {
                    network.resetAllData()
                    self.dismiss()
                }
            } message: {
                Text("Task donde")
            }
            .alert("Something bad happened", isPresented: $network.hasError) {
                Button("OK") {
                    network.resetAllData()
                }
            } message: {
                Text(network.error)
            }
        }
    }
}

#Preview("Addnew") {
    @Previewable @StateObject var network = NetworkViewModel()
    AddNewView(network: network)
}
