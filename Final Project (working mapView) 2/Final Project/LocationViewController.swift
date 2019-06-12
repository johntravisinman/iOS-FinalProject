//
//  LocationViewController.swift
//  Final Project
//
//  Created by Inman, John (UMSL-Student) on 7/23/18.
//  Copyright © 2018 Inman, John (UMSL-Student). All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    var model = LocationModel()
//    var tempLocation: location?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? LocationDetailViewController,
            let index = sender as? Int,
            let location = model.getLocation(at: index)
            else { return }
        
        destination.location = location
    }
}

extension LocationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier = "showDetail"
        performSegue(withIdentifier: segueIdentifier, sender: indexPath.row)
    }
}

extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let location = model.list[indexPath.row]
        
        cell.textLabel?.text = location.name
        cell.detailTextLabel?.text = location.type
        
        return cell
    }
}
