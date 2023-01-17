//
//  ContentView.swift
//  WordScramble
//
//  Created by Tyler Radke on 1/13/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var usedWords: [String] = []
    @State private var rootWord = ""
    @State private var newWord = ""
    
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word: ", text: $newWord)
                        .autocapitalization(.none)
                }
                
                
                Section {
                    ForEach(usedWords, id: \.self) {word in
                        HStack {
                            Text(word)
                            Image(systemName: "\(word.count).circle")
                        }
                        
                        
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            
        }
        .onAppear(perform: startGame)
        
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already used", message: "Come on man")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Not possible", message: "You don't have the letters for that")
            return
        }
        
        guard isWord(word: answer) else {
            wordError(title: "Not a word", message: "That's not even a real word")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let words = try? String(contentsOf: wordsURL) {
                let allWords = words.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }

            fatalError("Could not load start.txt from bundle")
        }

      
    }
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var copy = rootWord
        
        for letter in word {
            if let position = copy.firstIndex(of: letter) {
                copy.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    func isWord(word: String) -> Bool {
        let textChecker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = textChecker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
        
    }
    
    func wordError(title: String, message: String) {
        errorMessage = message
        errorTitle = title
        showingError = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
