//
//  ListViewController.swift
//  JsonDecode
//
//  Created by GaneshKumar Gunju on 22/02/18.
//  Copyright © 2018 vaayooInc. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {
    let hero: myDataList? = nil

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  id.text = id ("")
        name.text = hero?.name.capitalized
        userName.text = hero?.username.capitalized
        //email.text = hero?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
