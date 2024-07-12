//
//  File.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import Foundation
import SwiftUI

class MockData {
    static let title : [LocalizedStringKey] = [
        "힘을 주는 메시지",
        "생각을 자극하는 질문",
        "마음을 울리는 말",
        "영감을 주는 명언",
        "자신을 돌아보는 시간"
    ]
    
    static let bodytext = [
        "오늘의 일기를 작성하고 성취감을 느껴보세요!\n작은 기록이 큰 변화를 만듭니다!",
        "오늘 하루 중 가장 행복했던 순간은 무엇인가요?\n오늘 무슨 일이 있었나요? 지금 적어보세요!",
        "마음을 정리할 시간이 필요하지 않으신가요?\n오늘 하루의 감정을 일기로 풀어보세요.",
        "‘오늘의 작은 한 걸음이 내일의 큰 도약이 된다.’\n‘기록은 기억을 붙잡는 사슬이다.’",
        "오늘 하루를 되돌아보며 느낀 점을 적어보세요.\n자신을 돌아볼 시간을 가지세요."
    ]
    
    static let type = [
        "격려형",
        "질문형",
        "감성형",
        "명언형",
        "반성형"
    ]
    
    static let exbodytext = [
        "오늘의 일기를 작성하고 성취감을 느껴보세요!",
        "오늘 하루 중 가장 행복했던 순간은 무엇인가요?",
        "마음을 정리할 시간이 필요하지 않으신가요?",
        "‘오늘의 작은 한 걸음이 내일의 큰 도약이 된다.'",
        "오늘 하루를 되돌아보며 느낀 점을 적어보세요."
    ]
    
    static let colorset = [
        [Color.grad1, Color.grad1_2],
        [Color.grad2, Color.grad2_2],
        [Color.grad3, Color.grad3_2],
        [Color.grad4, Color.grad4_2],
        [Color.grad5, Color.grad5_2],
    ]
    
    static let type_en = [
        "default",
        "question",
        "emotion",
        "quote",
        "regret"
    ]
}
