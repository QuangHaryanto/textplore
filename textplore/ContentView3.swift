//
//  ContentView3.swift
//  textplore
//
//  Created by Haryanto Salim on 13/08/21.
//

import SwiftUI

struct Posting {
    var imageString: String
    var text: String
}

struct ContentView3: View {
    init() {
        //UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        
        TabView{
            //first Tab
            VStack{
                NavigationView{
                        FormView(firstName: "Haryanto",title: "Pencil")
                }
            }.tabItem {
                VStack{
                    Image(systemName: "pencil.tip")
                    Text("pencil")
                }
            }
            
            //second Tab
            VStack{
                NavigationView{
                    FormView(firstName: "Salim", title: "World")
                }
            }.tabItem {
                VStack{
                    Image(systemName: "square.and.pencil")
                    Text("World")
                }
            }
        }
        
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView3()
        }
            
    }
}

struct FormView: View {
    
    @State var firstName: String
    @State var title: String
    
    @State private var isToggled: Bool = true
    @State private var selectedValue: String = "2"
    @State private var isModalPresented: Bool = false
    
    var body: some View {
        
        VStack{
            ScrollView{
                TextField("First Name", text: $firstName)
                    .padding(.all, 10)
                    .background(Color(.yellow))
                
                Text("Hello \(firstName)")
                
                Button("Submit to change text") {
                    firstName = "Berubah"
                }
                .frame(width: 200, height: 50, alignment: .center)
                .background(Color(.orange))
                .cornerRadius(8)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                if title == "World" {
                    Toggle("locallize string", isOn:$isToggled)
                        .padding()
                    Text("\(isToggled ? "is true" : "is false")")
                } else {
                    Picker("localize string",
                           selection: $selectedValue) {
                        Text("value 1")
                            .tag("1")
                        Text("value 2")
                            .tag("2")
                        Text("value 3")
                            .tag("3")
                    }
                    
                    Text("\(selectedValue) is selected")
                }
                
                NavigationLink("Go to \(title) level 2 page ",
                               destination:
                                ScrollView{
                                    VStack {
                                        Text("New Page Hierarchy of the \(title) tab")
                                    }
                                }.navigationBarTitle("\(title) Level 2",displayMode: .large)
                )
                
                Button(action: {
                    isModalPresented.toggle()
                }){
                    Text("Go to \(title) Modal")
                }.sheet(isPresented: $isModalPresented,
                        onDismiss: willDismiss,
                        content: {
                            NavigationView{
                                VStack{
                                    Text("Hi this is \(title)'s Modal Page")
                                    Button("Dismiss Button") {
                                        isModalPresented.toggle()
                                    }
                                }.navigationTitle("\(title)'s Modal")
                            }
                        })
            }
        }.navigationBarTitle(title, displayMode: .automatic)
    }
    
    func willDismiss(){
        
    }
}
