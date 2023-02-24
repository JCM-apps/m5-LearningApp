//
//  ContentModel.swift
//  LearningApp
//
//  Created by Christopher Ching on 2021-03-03.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    @Published var currentModule: Module?
    
    @Published var currentLesson:Lesson?
    
    var currentLessonIndex = 0
    
    var currentModuleIndex = 0
    
    @Published var codeText = NSAttributedString()
    
    var styleData: Data?
    
    @Published var currentContentSelected:Int?
    
    @Published var currentTestSelected:Int?
    
    @Published var currentQuestion:Question?
    
    var currentQuestionIndex = 0
    
    
    
    init() {
        
        getLocalData()
        
    }
    
    //Mark: Data Methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // Log error
            print("Couldn't parse style data")
        }
        
    }
    
    //Mark: Module Bavigation Methods
    
    func beginModule(_ moduleid:Int){
        
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
               currentModuleIndex = index
                
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    //Mark: Begin Lesson
    
    func beginLesson(_ lessonIndex: Int){
        
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addStyling(htmlString: currentLesson!.explanation)
       // lessonDescription = currentLesson.ex
        
    }
    
    func nextLesson() {
        
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            codeText = addStyling(htmlString: currentLesson!.explanation)
        }
        
        else{
            currentLessonIndex = 0
            currentLesson = nil
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
       
    }
    
    
    
    func hasNextLesson() -> Bool {
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func beginTest(_ moduleId:Int){
        
        beginModule(moduleId)
        
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule?.test.questions[currentQuestionIndex]
            
            codeText = addStyling(htmlString: currentQuestion!.content)
            
        }
        
        
        
        
    }
    
    private func addStyling( htmlString: String) -> NSAttributedString {
        
        
        
        var resultString = NSAttributedString()
        var data = Data()
        
        if styleData != nil {
            data.append(self.styleData!)
            
        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
    }
    
}
