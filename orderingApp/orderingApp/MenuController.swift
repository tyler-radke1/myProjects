//
//  MenuController.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/7/22.
//

import Foundation
class MenuController {
    let baseURL = URL(string: "http://localhost:8080/")!
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: MenuController.orderUpdatedNotification, object: nil)
        }
    }
    
    static let shared = MenuController()
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    
    func fetchCategories() async throws -> [String] {
        let categoriesURL = baseURL.appendingPathComponent("categories")
        
        
        let response = try await URLSession.shared.data(from: categoriesURL)
        
        guard let httpResponse = response.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.categoriesNotFound
        }
        
        let decoder = JSONDecoder()
        
        let categories = try decoder.decode(CategoryResponse.self, from: response.0)
        
        return categories.categories
        
        
        
    }
    
    func fetchMenuItems(forCategory categoryName: String) async throws -> [MenuItem] {
        let baseMenuURL = baseURL.appendingPathComponent("menu")
        
        var components = URLComponents(url: baseMenuURL, resolvingAgainstBaseURL: true)!
        
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        
        let menuURL = components.url!
        
        let menuResponse = try await URLSession.shared.data(from: menuURL)
        
        guard let httpResponse = menuResponse.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.menuItemsNotFound
        }
        
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(MenuResponse.self, from: menuResponse.0)
        
        return response.items
        
    }
    
    typealias MinutesToPrepare = Int
    
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
        let orderURL = baseURL.appendingPathComponent("order")
        
        var request = URLRequest(url: orderURL)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let menuIdsDict = ["menuIds" : menuIDs]
        
        let jsonEncoder = JSONEncoder()
        
        let jsonData = try jsonEncoder.encode(menuIdsDict)
        print(String(data: jsonData, encoding: .utf8))
        request.httpBody = jsonData
        
        let orderResponse = try await URLSession.shared.data(for: request)
      
        guard let httpResponse = orderResponse.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MenuControllerError.orderNotFound
        }
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(OrderResponse.self, from: orderResponse.0)
        
        return response.prepTime
        
    }
    
    func fetchImage(menuItem: MenuItem) async throws -> Data {
        do {
            let data = try await URLSession.shared.data(from: menuItem.imageURL)
            return data.0
        } catch {
            throw error
        }
    }
    
    enum MenuControllerError: Error, LocalizedError {
        case categoriesNotFound
        case menuItemsNotFound
        case orderNotFound
    }
    
    
}
