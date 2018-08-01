//
//  ViewController.swift
//  rxSwiftTest
//
//  Created by Gyuchan Jeon on 2018. 8. 1..
//  Copyright © 2018년 Gyuchan Jeon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = searchBar.rx
            .text       //RxCocoa observable property
            .orEmpty    //non optional
//            .throttle(0.5, scheduler: MainScheduler.instance)
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { query in
                self.label.text = query
            }, onError: { (error) in
                print("searchBar error: \(error)")
            }, onCompleted: {

            }, onDisposed: {

            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

