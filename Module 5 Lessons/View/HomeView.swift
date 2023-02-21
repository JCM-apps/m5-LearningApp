
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
                                .onAppear(perform: {model.beginModule(module.id)})) {
                                
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count:" \(String(module.content.lessons.count)) Lessons", time: module.content.time)
                                
                            }
                               
                                
                                
                                
                                
                                //Test Card
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count:" \(String(module.test.questions.count)) Questions", time: module.test.time)
                                
                            
                            
                            
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
