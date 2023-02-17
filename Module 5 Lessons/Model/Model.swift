

//
//  Module.swift
//  modelue 5 Learning App
//
//  Created by Juan Meneses on 2/17/23.
//

import Foundation

class Module: Identifiable, Decodable {
    
    
    var id: Int
    var category:String
    var content: Content
    var test: Test
    
    
    
}


class Content: Identifiable, Decodable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons: [Lessons]
    
    
    
}


class Lessons: Identifiable, Decodable {
    
    var int: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
    
}


struct Test: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [Questions]
    
}


class Questions: Identifiable, Decodable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers:[String]
}
