//
//  FoodRecipesApp.swift
//  FoodRecipes
//
//  Created by Martín Antonio Córdoba Getar on 17/12/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct FoodRecipesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private var recipes = Recipe.sampleRecipes
    @State private var numberOfColumns = 0
    @State private var user = ""
    @State private var imAdmin = false
    @State private var imNotAdmin = false
    @Environment(\.dismiss) var dismiss
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Who are you?").font(.title).bold()
                TextField("User", text: $user)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .padding()
                Button("Enter") {
                    imAdmin = user == secretAdminKey
                    imNotAdmin = !imAdmin
                }
                .buttonStyle(.bordered)
                .tint(Color.accentColor)
                .padding()
            }
            .fullScreenCover(isPresented: $imAdmin) {
                NavigationStack {
                    TabView {
                        Tab {
                            AdminView()
                        } label: {
                            Label("Admin", systemImage: "bolt")
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("🐮 SUPERCOW")
                                .foregroundStyle(.accent)
                                .labelStyle(.titleAndIcon)
                                .font(.title3)
                                .fontWeight(.black)
                                .fontDesign(.serif)
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("X") {
                                imAdmin = false
                                imNotAdmin = false
                                dismiss()
                            }
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $imNotAdmin) {
                NavigationStack {
                    TabView {
                        Tab {
                            ListView(recipes: recipes, numberOfColumns: $numberOfColumns)
                        } label: {
                            Label("Home", systemImage: "house")
                        }
//                        Tab {
//                            Text("Favorites page")
//                        } label: {
//                            Label("Favorites", systemImage: "heart")
//                        }
//                        Tab {
//                            Text("Settings page")
//                        } label: {
//                            Label("Settings", systemImage: "gear")
//                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Label("My cookpad", systemImage: "carrot")
                                .foregroundStyle(.accent)
                                .labelStyle(.titleAndIcon)
                                .font(.title3)
                                .fontWeight(.black)
                                .fontDesign(.serif)
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("X") {
                                imAdmin = false
                                imNotAdmin = false
                                dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
}
