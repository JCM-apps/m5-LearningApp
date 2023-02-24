
//  ContentView.swift
//  LearningApp
//
//  Created by Christopher Ching on 2021-03-03.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading){
                
                Text("What do you want to do today?")
                    .padding(.leading,20)
                ScrollView{
                    
                    LazyVStack(spacing: 20) {
                        
                        ForEach(model.modules) {
                            module in
                            
                            
                            //Learning Card
                            NavigationLink(destination: ContentView()
                                .onAppear(perform: {model.beginModule(module.id)
                                    print(model.currentContentSelected)
                                    
                                }),
                                           tag: module.id,
                                           selection: $model.currentContentSelected,
                                           label: {
                                
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count:" \(String(module.content.lessons.count)) Lessons", time: module.content.time)
                                
                            })
                            
                            
                            
                            NavigationLink(destination: TestView()
                                .onAppear(perform: {
                                    model.beginTest(module.id)
                                }), tag: module.id,
                                           
                                           selection: $model.currentTestSelected) {
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count:" \(String(module.test.questions.count)) Lessons", time: module.test.time)
                                
                            }
                            
                            NavigationLink(destination: EmptyView(), label: {
                                EmptyView()
                            })
                            
                            
                            
                            
                            
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                    
                }
            }
            .navigationTitle("Get Started")
            
        }
        .navigationViewStyle(.stack)
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
