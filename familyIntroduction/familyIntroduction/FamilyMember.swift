//
//  populace.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import Foundation


struct FamilyMember {

    var name: String
    var description: String
    
    
    static let familyMembers: [FamilyMember] = [wife, dog, me, conner, bridger, sumner, lander, porter, mattie, halie, annie, parents]
    
    static let wife = FamilyMember(name: "Ana", description: "Ana is my wife. We met working at McDonald's a few years ago. She loves cows, napping, shopping, cleaning and Olive Garden. We like watching TV together and going on walks with our dog.")

    static let dog = FamilyMember(name: "Chubbers", description: "Chubbers is our dog. He's very energentic and likes to wake us up early in the morning to go pee. 😑")

    static let me = FamilyMember(name: "Tyler", description: "My name is Tyler. I love working with computers, reading, and playing video games. I love sports and doing things with my wife. I am the 3rd of 9 siblings, with 2 older sisters then me.")
    static let conner = FamilyMember(name: "Conner" , description: "Conner is 18 and goes to SUU. He is studying history, and also is very interested in music.")

    static let bridger = FamilyMember(name: "Bridger", description: "Bridger is 15, he works at McDonalds, and is in marching band. He plays low brass, so he does a variety of instruments but mostly trombone.")

    static let sumner = FamilyMember(name: "Sumner", description: "Sumner is 14, he works for Lehi city as a referee. He likes cats, especially his kitten Socks.")

    static let lander = FamilyMember(name: "Lander", description: "Lander is 12, He's into ballroom, which he's actually quite good at, and playing video games.")

    static let porter = FamilyMember(name: "Porter", description: "Porter is 11, so he mostly just does what you'd expect from an 11 year old. He plays video games and does weird things with his friends.")

    static let mattie = FamilyMember(name: "Mattie", description: "Mattie is 25, and she and her husband live in Provo. She has a degree in childhood development, and loves working with kids.")

    static let halie = FamilyMember(name: "Halie", description: "Halie is 23. She and her husband live in Orem. She does some stuff with spreadsheets. She absolutely loves reading, she reads more than anyone else in our family.")

    static let annie = FamilyMember(name: "Annie", description: "Annie is 20, she and her husband live in St. George. She also loves working with kids, and current works as a T.A. for a kindergarten.")

    static let parents = FamilyMember(name: "My Parents", description: "My parents are old. My dad works for Adobe, doing some stuff I really don't understand with spreadsheets. He likes football, old westerns, and stand up comedy. He is a very stereotypical white dad. My mom works for McDonalds, and enjoys crocheting, reading, and watching tv adaptations of her books she likes.")
    
    
}



