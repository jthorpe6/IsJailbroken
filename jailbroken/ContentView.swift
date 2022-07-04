//
//  ContentView.swift
//  jailbroken
//
//  Created by Joe Thorpe on 04/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var Bottomtexte = "?"
    var systemVersion = UIDevice.current.systemVersion
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    IsJailbroken()
                    if Jailbroken == true {
                        self.Bottomtexte = "Jailbroken :("
                    }
                    if Jailbroken == false {
                        self.Bottomtexte = "Not Jailbroken :)"
                    }
                    if simulate == true {
                        self.Bottomtexte = "In Simulator"
                    }
                }, label: {
                    Text("Check jailbreak status")
                        .font(.caption)
                        .padding(20)
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding(40)
                })
                Text("Jailbreak Status :\(Bottomtexte)")
                    .bold()
                Text("iOS version :\(systemVersion)")
                    .font(.caption)
            }
            .navigationBarTitle("IsJailbroken?", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
