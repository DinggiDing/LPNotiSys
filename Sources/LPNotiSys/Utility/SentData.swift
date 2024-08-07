//
//  File.swift
//  
//
//  Created by 성재 on 7/3/24.
//

import Foundation

class LanguageConfiguration {
    enum Language {
        case korean
        case english
        case japanese
    }
    
    static func getConfiguration(for language: Language) -> LanguageConfigurable {
        switch language {
        case .korean:
            return SentData()
        case .english:
            return SentData_en()
        case .japanese:
            return SentData_ja()
        }
    }
    
    static func getCurrentLanguageConfiguration() -> LanguageConfigurable {
        let locale = Locale.current.languageCode
        
        switch locale {
        case "ko":
            return getConfiguration(for: .korean)
        case "en":
            return getConfiguration(for: .english)
        case "ja":
            return getConfiguration(for: .japanese)
        default:
            return getConfiguration(for: .korean) // 기본값
        }
    }
}
    


protocol LanguageConfigurable {
    var def: [String] { get }
    var que: [String] { get }
    var emo: [String] { get }
    var quo: [String] { get }
    var reg: [String] { get }
}

class SentData : LanguageConfigurable {
    let def = [
        "오늘의 일기를 작성하고 성취감을 느껴보세요!",
        "작은 기록이 큰 변화를 만듭니다. 일기를 써보세요!",
        "일기를 쓰며 자신을 더욱 알아가세요!",
        "매일의 기록이 당신을 성장하게 합니다!",
        "일기를 쓰며 하루를 정리해보세요. 더 나은 내일이 기다리고 있습니다!",
        "하루를 마무리하며 일기와 함께 마음의 평화를 찾으세요!",
        "일기를 쓰는 습관이 당신의 인생을 변화시킬 수 있습니다!",
        "자신의 이야기를 기록하며 더욱 강해지세요!",
        "매일 일기를 쓰며 스스로를 격려해보세요!",
        "당신의 하루를 기록하며 새로운 동기부여를 찾아보세요!",
    ]
    
    let que = [
        "오늘 하루 중 가장 기억에 남는 순간은 무엇인가요?",
        "오늘 새로운 것을 배운 것이 있다면 무엇인가요?",
        "오늘 당신을 가장 웃게 만든 일은 무엇이었나요?",
        "오늘 하루 중 감사했던 순간을 적어보세요.",
        "오늘의 목표를 이루기 위해 어떤 노력을 했나요?",
        "오늘 당신을 가장 도전하게 만든 일은 무엇이었나요?",
        "오늘 하루를 통해 배운 교훈은 무엇인가요?",
        "오늘 누구에게 도움을 주었나요? 또는 도움을 받았나요?",
        "오늘 당신을 가장 자랑스럽게 만든 순간은 언제였나요?",
        "오늘 하루를 통해 무엇을 더 잘할 수 있었을까요?",  
        
    ]
    
    let emo = [
        "오늘 하루의 감정을 일기로 풀어보세요.",
        "당신의 마음 속 이야기를 적어보세요. 누구보다 당신이 소중합니다.",
        "마음이 힘들 때, 글로 표현하는 것만으로도 위로가 됩니다.",
        "당신의 일기는 당신만의 특별한 공간입니다. 마음껏 써보세요.",
        "오늘 느낀 사랑과 고마움을 일기로 남겨보세요.",
        "가슴 깊이 느낀 오늘의 순간을 기록해보세요.",
        "슬픔도 기쁨도 모두 소중한 추억이 됩니다. 오늘의 감정을 적어보세요.",
        "마음의 소리에 귀 기울여 보세요. 그리고 일기에 적어보세요.",
        "일기를 쓰며 마음의 짐을 덜어내세요. 당신은 혼자가 아닙니다.",
        "당신의 감정을 솔직하게 표현할 수 있는 일기 시간을 가져보세요.",

    ]
    
    let quo = [
        "‘기록하지 않으면 사라진다.’",
        "‘하루의 끝은 새로운 시작이다.’",
        "‘오늘의 작은 한 걸음이 내일의 큰 도약이 된다.’",
        "‘기록은 기억을 붙잡는 사슬이다.’",
        "‘당신의 이야기는 소중합니다.’",
        "‘매일의 기록은 미래의 보물입니다.’",
        "‘삶은 기록할 가치가 있는 모험입니다.’",
        "‘일기는 마음의 거울이다.’",
        "‘기록은 시간 속에 묻힌 보물이다.’",
        "‘일기는 영혼의 속삭임이다.’"
    ]
    
    let reg = [
        "오늘 하루를 되돌아보며 느낀 점을 적어보세요.",
        "자신을 돌아볼 시간을 가지세요. 일기를 써보세요.",
        "오늘 하루 중 가장 의미 있었던 순간은 무엇인가요?",
        "오늘 나를 가장 기쁘게 한 일은 무엇이었나요?",
        "오늘 하루 동안 나의 감정은 어땠나요?",
        "오늘의 성취와 배움을 기록해보세요.",
        "오늘 경험한 도전과 극복을 적어보세요.",
        "오늘 나를 행복하게 만든 작은 일들을 적어보세요.",
        "오늘 하루 동안 감사했던 순간들을 기록해보세요.",
        "오늘 나의 생각과 감정을 솔직하게 적어보세요."
    ]
}
