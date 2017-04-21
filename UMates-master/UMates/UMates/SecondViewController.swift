//
//  SecondViewController.swift
//  UMates
//
//  Created by Taylor Ray Herald on 4/6/17.
//  Copyright © 2017 TheNerdHerd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var person:Person = Person()
//    var person = Person(name: "Austin Prince", major: "B.S. Computer Science", budget: "$700-$1000", moveInDate: "Aug 1", profileImg: UIImage(named: "img/austin.jpg")!, visitor: "No visitors", cook: 3, party: "Occasional Partier", clean: "Neat Freak", pet: "No", drinking: "Occasional Drinker", smoking: "No", gender: "male", genderPref: "same", gradYear: 2018, aboutMe: "I'm a dual degree transfer student new to WashU. I like to do things in my free time and my favorite TV show is Arrested Development!", interests:["Hanging", "Chilling", "Doing my thing", "Do it to it"])

    var sizingCell: TagCell?
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var nameTag: UILabel!
    @IBOutlet weak var moveInDayPic: UIImageView!
    @IBOutlet weak var aboutText: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var flowLayout: FlowLayout!
    @IBOutlet weak var aboutHeader: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var visitorPic: UIImageView!
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var cookPic: UIImageView!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var partyPic: UIImageView!
    @IBOutlet weak var cleanLabel: UILabel!
    @IBOutlet weak var cleanPic: UIImageView!
    @IBOutlet weak var petLabel: UILabel!
    @IBOutlet weak var petPic: UIImageView!
    @IBOutlet weak var drinkerLabel: UILabel!
    @IBOutlet weak var drinkerPic: UIImageView!
    @IBOutlet weak var smokerLabel: UILabel!
    @IBOutlet weak var smokerPic: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderPic: UIImageView!
    @IBOutlet weak var moveInDayLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pricePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.contentMode = .scaleAspectFill
        profilePic.clipsToBounds = true
        loadStaticImages()
        nameTag.text = person.getName()
        profilePic.image = person.getProfileImage()
        visitorLabel.text = person.getVisitor()
        cookLabel.text = String(person.getCook()) + " days/week"
        partyLabel.text = person.getParty()
        cleanLabel.text = person.getClean()
        petLabel.text = person.getPet()
        drinkerLabel.text = person.getDrink()
        smokerLabel.text = person.getSmoking()
        moveInDayLabel.text = person.getMoveInDate()
        priceLabel.text = person.getBudget()
        genderLabel.text = person.getGender()
        aboutHeader.text = "About " + person.getName()
        majorLabel.text = person.getMajor() + "\n" + "Class of " + String(person.getGradYear())
        aboutText.text = person.getAbout()
        
        let cellNib = UINib(nibName: "TagCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "TagCell")
        self.collectionView.backgroundColor = UIColor.clear
        self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! TagCell?
        
        self.flowLayout.sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)
        
    }
    
    func loadStaticImages() {
        moveInDayPic.image = UIImage(named: "img/moveInDateImage.png")
        visitorPic.image = UIImage(named: "img/visitor.png")
        cookPic.image = UIImage(named: "img/cook.png")
        partyPic.image = UIImage(named: "img/party.png")
        cleanPic.image = UIImage(named: "img/clean.png")
        petPic.image = UIImage(named: "img/pet.png")
        drinkerPic.image = UIImage(named: "img/drink.png")
        smokerPic.image = UIImage(named: "img/Smoking-50.png")
        genderPic.image = UIImage(named: "img/gender.png")
        pricePic.image = UIImage(named: "img/budgetImage.png")
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return person.getInterests().count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        self.configureCell(cell: cell, forIndexPath: indexPath as NSIndexPath)
        return cell
        

    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        self.configureCell(self.sizingCell!, forIndexPath: indexPath)
//        return self.sizingCell!.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.configureCell(cell: self.sizingCell!, forIndexPath: indexPath as NSIndexPath)
        return self.sizingCell!.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }
    
    
    func configureCell(cell: TagCell, forIndexPath indexPath: NSIndexPath) {
        var TAGS = person.getInterests()
        let tag = TAGS[indexPath.row]
        cell.tagName.text = tag
    }
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

