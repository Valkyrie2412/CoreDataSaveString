//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by Hiếu Nguyễn on 9/22/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            inputTextField.text = entity?.last?.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveData(_ sender: UIBarButtonItem) {
        guard inputTextField.text != "" else {
            return
        }
        let context = Entity(context: AppDelegate.context)
        context.name = inputTextField.text
        AppDelegate.saveContext()
    }
}

