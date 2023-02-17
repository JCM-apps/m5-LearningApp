//
//  ContentModel.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/17/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    init() {
        
        getLocalData()
        
        
        
        

        
    }
    
    func getLocalData() {
    
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
           let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules

            
        }
        
        catch{
            
            print(error)
        }
        
        
    }
    
    
    
    
}
