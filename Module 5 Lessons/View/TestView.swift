
import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    @State var selectedAnswerIndex:Int?
    
    @State var numCorrect = 0
    
    @State var submitted = false
    @State var showResults = false
    var body: some View {
        
        if model.currentQuestion != nil && showResults == false {
            
            VStack (alignment: .leading) {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView{
                    VStack{
                        
                    
                        
                            ForEach(0..<model.currentQuestion!.answers.count, id: \.self){
                                index in
                                
                                Button {
                                    selectedAnswerIndex = index
                                } label: {
                                    
                                    ZStack{
                                       
                                        if submitted ==  false {
                                            RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                                .frame(height: 48)
                                        }
                                        else {
                                            if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                                RectangleCard(color: .green)
                                                    .frame(height: 48)
                                            }
                                            
                                            else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                                
                                                RectangleCard(color: .red)
                                                    .frame(height: 48)
                                            }
                                            
                                            
                                            else if index == model.currentQuestion!.correctIndex {
                                                
                                                RectangleCard(color: .green)
                                                    .frame(height: 48)
                                            }
                                            
                                            
                                        }
                                            
                                            Text(model.currentQuestion!.answers[index])
                                      
                                    }
                                    
                                }
                                .disabled(submitted)
                                
                              
                          
                        }
                    }.accentColor(.black)
                        .padding()
                }
                
                
                Button {
                     
                    if submitted == true {
                        
                        if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                            
                            showResults = true
                        }
                        
                        
                        else{
                            model.nextQuestion()
                            submitted = false
                            selectedAnswerIndex = nil
                        }
                        
                    }
                    
                    else {
                        //Submit the answer
                        submitted = true
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                    
                   
                } label: {
                    ZStack{
                        RectangleCard(color: .green)
                            .frame(height: 48)
                           
                            
                        
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                    } .padding()
                }
                .disabled(selectedAnswerIndex == nil)
                
                

                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        
        else if showResults == true{
            TestResultsView(numCorrect: numCorrect)
            
        }
        
        else {
            
            ProgressView()
        }
        
    }
    var buttonText:String {
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                return  "Finish"
            }
            
            return "Next" // or finish
        }
            else {
                
                return "Submit"
            }
        
    }
}

