//
//  TestResultsView.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/24/23.
//

import SwiftUI

struct TestResultsView: View {
    @EnvironmentObject var model:ContentModel
    
    var numCorrect = 0
    var resultHeading:String{
        guard model.currentModule != nil else {
            
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.5 {
            return "Awesome"
        }
        
        if pct > 0.2 {
            return "Doing GreatE"
        }
        else {
            return "Keep learning! "
        }
        
    }
    var body: some View {
        VStack{
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) of \(model.currentModule?.test.questions.count ?? 0) questions ")
            
            Spacer()
            
            Button {
                model.currentTestSelected = nil
                
                
            } label: {
                ZStack{
                    
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.horizontal)
            }
Spacer()
            
        }
    }
}

struct TestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultsView().environmentObject(ContentModel())
    }
}
