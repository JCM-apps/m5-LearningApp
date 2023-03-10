//
//  ContentDetailView.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/20/23.
//

import SwiftUI
import AVKit


struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                
            }
            CodeTextView()
            
            if model.hasNextLesson() {
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson : \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    
                    
                 
                    
                }
                    
                )
                
               
            }
            
            else
            {
                Button(action: {
                    model.currentContentSelected = nil
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    
                    
                 
                    
                }
                    
                )
                
                
                
            }
          
            
            
        }
        .padding(.horizontal)
        .navigationTitle(lesson?.title ?? "")
        
    }
}

