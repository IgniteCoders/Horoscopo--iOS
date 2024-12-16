//
//  ViewController.swift
//  Horoscopo
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Preperties
    
    var horoscopeList: [Horoscope] = Horoscope.getAll()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    // MARK: TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.render(from: horoscope)
        return cell
    }
    
    // MARK: SearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            horoscopeList = Horoscope.getAll()
        } else {
            horoscopeList = Horoscope.getAll().filter({ horoscope in
                horoscope.name.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.getAll()
        tableView.reloadData()
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "navigateToDetail") {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscope = horoscopeList[indexPath.row]
            detailViewController.horoscope = horoscope
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

