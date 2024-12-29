////
////  FRAsyncButton.swift
////  FoodRecipes
////
////  Created by Martín Antonio Córdoba Getar on 21/12/24.
////
//
//import SwiftUI
//
//struct FRAsyncButton<Label: View>: View {
//    private let action: () async -> ()
//    @ViewBuilder private let label: () -> Label
//    @Binding var isLoading: Bool
//    
//    init(isLoading: Binding<Bool> = .constant(false), label: @escaping () -> Label, action: @escaping () async -> ()) {
//        self.isLoading = isLoading
//        self.label = label
//        self.action = action
//    }
//    
//    var body: some View {
//        Button(action: {
//            Task {
//                isLoading = true
//                await action()
//                isLoading = false
//            }
//        }) {
//            ZStack {
//                if isLoading {
//                    ProgressView()
//                } else {
//                    label()
//                }
//            }
//        }
//        .disabled(isLoading)
//    }
//}
//
//
//#Preview {
//    FRAsyncButton {
//        Label("Tetsing async button", systemImage: "ellipsis.curlybraces")
//    } action: {
//        await APILoremIpsumViewModel().getText(paragraphs: 1))
//    }
//
//}
