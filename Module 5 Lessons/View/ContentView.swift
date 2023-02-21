//
//  ContentView.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
     
        
        ScrollView{
            
            LazyVStack{
                
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count){
                        
                        index in
                        NavigationLink(destination: ContentDetailView().onAppear(perform: {model.beginLesson(index)})) {
                            ContentViewRow(index: index)
                        }
                       
                       
                        
                        
                    }
                    
                    
                    
                }
                    
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .accentColor(.black)
        }
        
        
    }
}

