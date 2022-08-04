//
//  ContentView.swift
//  test_or
//
//  Created by Andrew Mokryj on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
  @State var isPresenting: Bool = false
  @State var uiImage: UIImage?
      
  var body: some View {
    VStack{
      HStack{
        Image(systemName: "photo")
          .onTapGesture {
            isPresenting = true
          }
        Image(systemName: "camera")
      }
          .font(.largeTitle)
          .foregroundColor(.blue)
      Rectangle()
        .strokeBorder()
        .foregroundColor(.yellow)
      .overlay(
        Group {
          if uiImage != nil {
            Image(uiImage: uiImage!)
              .resizable()
              .scaledToFit()
          }
        }
      )
    }
    .sheet(isPresented: $isPresenting){
      ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
