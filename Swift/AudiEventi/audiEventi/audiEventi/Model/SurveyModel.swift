//
//  SurveyModel.swift
//  audiEventi
//
//  Created by aleksandar.aleksic on 1.7.21..
//

import Foundation

struct SurveyResponse: Codable, ResultProtocol {
    var questions: [Question]
    var status: String
    var result: String
    var resultCode: String
    var resultMessage: String
}

struct Question: Codable {
    var surveyId: String
    var title: String
    var questionId: String
    var required: String
    var requiredError: String
    var webformMultiple: String
    var type: String // Enum can be 6 different types
    
}

struct SurveyPost: Codable{
    var options: [String : String]
    var questions: String
    var other: String
    var answers: String
}
