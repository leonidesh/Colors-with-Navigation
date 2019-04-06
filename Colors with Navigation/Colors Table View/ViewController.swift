//
//  ViewController.swift
//  Colors Table View
//
//  Created by 刘洋 on 2019/3/8.
//  Copyright © 2019年 Yang Liu. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITabBarDelegate,UITableViewDataSource {
   // var colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    
    var colors = [Color(name:"red",uiColor:UIColor.red),
                  Color(name:"orange",uiColor:UIColor.orange),
                  Color(name:"yellow",uiColor:UIColor.yellow),
                  Color(name:"green",uiColor:UIColor.green),
                  Color(name:"blue",uiColor:UIColor.blue),
                  Color(name:"purple",uiColor:UIColor.purple),
                  Color(name:"brown",uiColor:UIColor.brown)]
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    //var colorsforrow: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].uiColor
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
           let row = colorsTableView.indexPathForSelectedRow?.row{
            destination.color = colors[row]
        }
    }
    
}
