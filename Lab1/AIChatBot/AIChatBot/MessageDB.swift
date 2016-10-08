//
//  MessageDB.swift
//  AIChatBot
//
//  Created by Nikita Khomitsevich on 10/1/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import JSQMessagesViewController

public let emptyMessage = ""

public let chatBotID = "chatBotID"
public let chatBotName = "Лиза"
public let chatBotInitial = "Л"

public let messageAboutName = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Привет, я " + chatBotName + "."))
public let messageAboutAge = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Какой твой возраст? Введи лишь число!"))
public let repeatMessageAboutAge = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Прости, не совсем поняла тебя. Введи, пожалуйста, только число."))
public let exitMessage = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Отправь любое сообщение для выхода из приложения."))

// 0-5
public let messageChild1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ух ничего себе, совсем маленький! Чем ты увлекаешься?"))
public let messageChild2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Здорово! А как у тебя с поведением, хорошо себя ведешь?"))
public let messageChild3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Тут главное - не расстраивать родителей :D. Ты, кстати, гуляешь на улице?"))
public let messageChild4 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Молодчинка. Извини, но мне пора. До встречи!"))

// 6-17
public let messageTeenager1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Как интересно! У тебя самый подходящий возраст что бы активно развиваться в чем-то. У тебя есть какие-то интересы?"))
public let messageTeenager2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("А как у тебя успехи в школе? Хорошо ли учишься?"))
public let messageTeenager3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ты занимаешься каким-либо видом спорта?"))
public let messageTeenager4 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Есть ли у тебя хобби? Расскажи про него."))
public let messageTeenager5 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Молодчинка. Извини, но мне пора. До встречи!"))

// 18-23
public let messageYoung1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("У тебя отличный возраст для начинаний! Ты сейчас учишься в ВУЗе?"))
public let messageYoung2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Можешь уточнить его название?"))
public let messageYoung3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Молодец. Ты сейчас на каком курсе?"))
public let messageYoung4 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Сложно ли тебе учиться?"))
public let messageYoung5 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ясно. А чем ты занимаешься в свободное время?"))
public let messageYoung6 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Круто! Спасибо за общение, мне уже пора идти. До скорой встречи!"))

// 24-45
public let messageAdult1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ты уже закончил университет?"))
public let messageAdult2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Окей. А ты где-то работаешь?"))
public let messageAdult3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Расскажи подробней. Это довольно интересно!"))
public let messageAdult4 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("А чем ты занимаешься в свободное время?"))
public let messageAdult5 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Круто! Спасибо за общение, мне уже пора идти. До скорой встречи!"))

// 46-65
public let messageOld1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Чем ты занимаешься? Какая у тебя специальность?"))
public let messageOld2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Довольно интересно! А есть ли у тебя семья?"))
public let messageOld3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Прости, уточню - есть ли дети? Если да, то сколько?"))
public let messageOld4 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Есть ли у тебя хобби?"))
public let messageOld5 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Извини, но мне пора. До встречи!"))

// 66-99
public let messageOldest1 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ого, ничего себе! Ты, наверно, очень многое повидал в жизни! Чем ты занимаешься сейчас?"))
public let messageOldest2 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Я так понимаю, ты сейчас не работаешь?"))
public let messageOldest3 = JSQMessage(senderId: chatBotID, displayName: chatBotName, text: String("Ой прости, что так неловко выходит, но мне нужно идти. Пока!"))
