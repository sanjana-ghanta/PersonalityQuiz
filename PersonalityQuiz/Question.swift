//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Student AM on 5/06/22.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: SweetType
}

enum SweetType: Character {
    case cookie = "🍪", iceCream = "🍦", chocolate = "🍫", honey = "🍯"
    
    var definition: String {
        switch self {
        case .cookie:
            return "You are a nice easygoing person who has no problem chilling given the situation, however don't let that fool others! You have chips, or rather qualities and quirks that can be surprising and allows you to be spontaneous."
        case .honey:
            return "You are known to be a naturally happy optimisitc person, who can always be positive regardless of the situation. You are known for spreading an infectious like joy everywhere and to everyone."
        case .chocolate:
            return "You are definitely hardworking and have a hard exterior, showing that you are driven and persistent in the area of self-improvement. However it doesn't mean you melt and open up to others. Though you may be more introverted, you behave freely with those who you trust."
        case .iceCream:
            return "You often are rather empathetic and can feel the feelings of others. Often you want to take that emotion for yourself, especially any cold negative feelings. You may catch yourself daydreaming often throughout the day!"
        }
    }
}
