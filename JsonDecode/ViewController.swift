//
//  ViewController.swift
//  JsonDecode
//
//  Created by GaneshKumar Gunju on 22/02/18.
//  Copyright © 2018 vaayooInc. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var heros = [myDataList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {

            self.tableView.reloadData()
       }
        
        
    }

    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string:"http://jsonplaceholder.typicode.com/users")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do {
                    self.heros = try JSONDecoder().decode([myDataList].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                   } catch {
                    print("error")
                }
            }

        }.resume()
     }
   }

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return heros.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default, reuseIdentifier:nil)
        cell.textLabel?.text = heros[indexPath.row].name.capitalized
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroViewController{
        }
    }
}
    




