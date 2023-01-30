
import UIKit

@MainActor
class StoreItemContainerViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet var tableContainerView: UIView!
    @IBOutlet var collectionContainerView: UIView!
    
    let searchController = UISearchController()
    let storeItemController = StoreItemController()

    var tableViewDataSource: UITableViewDiffableDataSource<String, StoreItem>!
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, StoreItem>!
    
  //  var items = [StoreItem]()
   var itemsSnapshot = NSDiffableDataSourceSnapshot<String, StoreItem>()

    
    var selectedSearchScope: SearchScope {
        let selected = searchController.searchBar.selectedScopeButtonIndex
        
        return SearchScope.allCases[selected]
        
        
    }
    
    // keep track of async tasks so they can be cancelled if appropriate.
    var searchTask: Task<Void, Never>? = nil
    var tableViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    var collectionViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsSearchResultsController = true
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.scopeButtonTitles = SearchScope.allCases.map({$0.title})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableViewController = segue.destination as? StoreItemListTableViewController {
            configureTableViewDataSource(tableViewController.tableView)
        }
        
        if let collectionViewController = segue.destination as? StoreItemCollectionViewController {
            configureCollectionViewDataSource(collectionViewController.collectionView)
        }
    }
    
    func configureTableViewDataSource(_ tableView: UITableView) {
        tableViewDataSource = UITableViewDiffableDataSource<String, StoreItem>(tableView: tableView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemTableViewCell
            
            self.tableViewImageLoadTasks[indexPath]?.cancel()
            self.tableViewImageLoadTasks[indexPath] = Task {
                await cell.configure(for: item, storeItemController: self.storeItemController)
                self.tableViewImageLoadTasks[indexPath] = nil
            }

            return cell
        })
    }
    
    func configureCollectionViewDataSource(_ collectionView: UICollectionView) {
        collectionViewDataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! ItemCollectionViewCell
            
            self.collectionViewImageLoadTasks[indexPath]?.cancel()
            self.collectionViewImageLoadTasks[indexPath] = Task {
                await cell.configure(for: item, storeItemController: self.storeItemController)
                self.collectionViewImageLoadTasks[indexPath] = nil
            }
            
            return cell
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchMatchingItems), object: nil)
        perform(#selector(fetchMatchingItems), with: nil, afterDelay: 0.3)
    }
                
    @IBAction func switchContainerView(_ sender: UISegmentedControl) {
        tableContainerView.isHidden.toggle()
        collectionContainerView.isHidden.toggle()
    }
    func handleFetchedItems(_ items: [StoreItem]) async {
        await tableViewDataSource.apply(itemsSnapshot, animatingDifferences: true)
        await collectionViewDataSource.apply(itemsSnapshot, animatingDifferences: true)
    }
    
<<<<<<< HEAD
    func createSectionedSnapshot(from items: [StoreItem]) -> NSDiffableDataSourceSnapshot<String, StoreItem> {
        let movies = items.filter({ $0.kind == "feature-movie"})
        let music = items.filter{ $0.kind == "song" || $0.kind == "album"}
=======
    func fetchAndHandleItemsForSearchScopes( searchScopes: [SearchScope], withSearchTerm searchTerm: String) async throws {
        try await withThrowingTaskGroup(of: (SearchScope, [StoreItem]).self) { group in
            
            for searchScope in searchScopes { group.addTask(operation: <#T##() async throws -> (SearchScope, [StoreItem])#>)
                
            }
            
            
            
            
        }
    }
    @objc func fetchMatchingItems() {
        //itemsSnapshot.deleteAllItems()
     //   self.items = []
>>>>>>> a27f7654c116ec5ede4cdf156fd486a58e7febe7
        
        let apps = items.filter({ $0.kind == "software" })
        let books = items.filter({ $0.kind == "ebook"})
        
        let grouped: [(SearchScope, [StoreItem])] = [
            (.movies, movies),
            (.music, music),
            (.apps, apps),
            (.books, books)
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<String, StoreItem>()
        grouped.forEach({ scope, items in
            if items.count > 0 {
                snapshot.appendSections([scope.title])
                snapshot.appendItems(items, toSection: scope.title)
            }
        })
        
        return snapshot
    }
    
    func fetchAndHandleItemsForSearchScopes(_ searchScopes: [SearchScope], withSearchTerm searchTerm: String) async throws {
        try await withThrowingTaskGroup(of: (SearchScope, [StoreItem]).self) { group in
            for searchScope in searchScopes {
                group.addTask {
                    try Task.checkCancellation()
                    // set up query dictionary
                    let query = [
                        "term": searchTerm,
                        "media": searchScope.mediaType,
                        "lang": "en_us",
                        "limit": "50"
                    ]
                    return (searchScope, try await self.storeItemController.fetchItems(matching: query))
                }
            }
            for try await (searchScope, items) in group {
                try Task.checkCancellation()
                if searchTerm == self.searchController.searchBar.text &&
                    (self.selectedSearchScope == .all || searchScope == self.selectedSearchScope) {
                    await handleFetchedItems(items)
                }
            }
        }
    }
    
    func handleFetchedItems(_ items: [StoreItem]) async {
        let currentSnapShotItems = itemsSnapshot.itemIdentifiers
        
        //var updatedSnapshot = NSDiffableDataSourceSnapshot<String, StoreItem>()
        let updatedSnapshot = createSectionedSnapshot(from: currentSnapShotItems + items)
        
        itemsSnapshot = updatedSnapshot
        
//        updatedSnapshot.appendSections(["Results"])
//        updatedSnapshot.appendItems(currentSnapShotItems + items)
        
        
        await tableViewDataSource.apply(itemsSnapshot, animatingDifferences: true)
        await collectionViewDataSource.apply(itemsSnapshot, animatingDifferences: true)
    }
    
    @objc func fetchMatchingItems() {
     
     //   self.items = []
        itemsSnapshot.deleteAllItems()
        let searchTerm = searchController.searchBar.text ?? ""
       
<<<<<<< HEAD
        let searchScopes: [SearchScope]
        if selectedSearchScope == .all {
            searchScopes = [.movies, .music, .apps, .books]
        } else {
            searchScopes = [selectedSearchScope]
        }
=======
        var searchScopes: [SearchScope] = (selectedSearchScope == .all) ? [.movies, .music, .apps, .books] : [selectedSearchScope]
        
      
        
>>>>>>> a27f7654c116ec5ede4cdf156fd486a58e7febe7
        
        
        // cancel any images that are still being fetched and reset the imageTask dictionaries
        collectionViewImageLoadTasks.values.forEach { task in task.cancel() }
        collectionViewImageLoadTasks = [:]
        tableViewImageLoadTasks.values.forEach { task in task.cancel() }
        tableViewImageLoadTasks = [:]
        
        // cancel existing task since we will not use the result
        searchTask?.cancel()
         searchTask = Task {
            if !searchTerm.isEmpty {
                do {
<<<<<<< HEAD
                    try await fetchAndHandleItemsForSearchScopes(searchScopes, withSearchTerm: searchTerm)
                } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                    // ignore cancellation errors from URLSession
                } catch is CancellationError {
                    // ignore cancellation errors from the TaskGroup
                } catch {
                    print(error)
=======
                    try await fetchAndHandleItemsForSearchScopes(searchScopes: searchScopes, withSearchTerm: searchTerm)
                } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
                    
                } catch {
                    print("error")
>>>>>>> a27f7654c116ec5ede4cdf156fd486a58e7febe7
                }
            } else {
                await self.tableViewDataSource.apply(self.itemsSnapshot, animatingDifferences: true)
                await self.collectionViewDataSource.apply(self.itemsSnapshot, animatingDifferences: true)
            }
            searchTask = nil
        }
    }
    
}
