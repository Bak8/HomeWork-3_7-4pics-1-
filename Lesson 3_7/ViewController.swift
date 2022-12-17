//
//  ViewController.swift
//  Lesson 3_7
//
//  Created by Atai Begaliev on 8/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var wordCollectionView: UICollectionView!
    
    @IBOutlet weak var lettersCollectionView: UICollectionView!
    
    
    
    @IBAction func deleteArray(_ sender: Any) {
    
        randomLetters[currentLevel].randomLetters.append(contentsOf: guessWord)
        self.guessWord.removeAll()
        
        wordCollectionView.reloadData()
        lettersCollectionView.reloadData()
    }
    
    
    let correctWordCar : [CorrectWordCar] = [CorrectWordCar(carBrand: ["B","M","W"]),CorrectWordCar(carBrand: ["T","O","Y","O","T","A"]),CorrectWordCar(carBrand: ["V","O","L","V","O"])]
    
    var randomLetters : [RandomLetters] = [RandomLetters(randomLetters: ["P", "T", "B", "L", "E", "S", "W", "P", "D", "M", "U", "I"]),RandomLetters(randomLetters: ["Y", "T", "B", "O", "E", "S", "T", "O", "D", "M", "A", "I"]),RandomLetters(randomLetters: ["V", "T", "L", "O", "E", "S", "T", "O", "D", "M", "A", "V"])]
    

    
    var images:[Images1] = [Images1(images1: ["1","T1","V1"]),Images1(images1: ["1_2","T2","V2"]),Images1(images1: ["1_3","T3","V3"]),Images1(images1: ["1_4","T4","V4"])]
    
    
    
    
    var guessWord: [String] = []
    
    var currentLevel: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lettersCollectionView.backgroundColor = .none
        wordCollectionView.backgroundColor = .none
//        imageView1 = image1[currentLevel].images1
        imageView1.image = UIImage(named: images[0].images1[currentLevel])
        imageView2.image = UIImage(named: images[1].images1[currentLevel])
        imageView3.image = UIImage(named: images[2].images1[currentLevel])
        imageView4.image = UIImage(named: images[3].images1[currentLevel])
        
    print(currentLevel)
    }
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == wordCollectionView{
            return guessWord.count
        }else{
            return randomLetters[currentLevel].randomLetters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == wordCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "word_cell1", for: indexPath) as! WordCell
            cell.wordLetterLabelCar1.text = guessWord[indexPath.row]
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letter_cell1", for: indexPath) as! LetterCell
            cell.letterLabelCar.text = randomLetters[currentLevel].randomLetters[indexPath.row]
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lettersCollectionView {
            
            
            let letter = randomLetters[currentLevel].randomLetters[indexPath.row]
            randomLetters[currentLevel].randomLetters.remove(at: indexPath.row)
            guessWord.append(letter)
            lettersCollectionView.reloadData()
            
            
//            var wordLetter = guessWord[indexPath.row]
//            guessWord.remove(at: indexPath.row)
//            randomLetters[currentLevel].randomLetters.append(letter)
            wordCollectionView.reloadData()
            
            if guessWord == correctWordCar[currentLevel].carBrand{
                let alert = UIAlertController(title: "Поздравляем!", message: "Перейти к следующему слову?", preferredStyle: .alert)
                
                let yesAction = UIAlertAction(title: "ДА", style: .cancel) { action in
                    ()
                    self.currentLevel += 1
                    self.guessWord.removeAll()
                    self.wordCollectionView.reloadData()
                    self.lettersCollectionView.reloadData()
                    self.viewDidLoad()
                }
                
                let noAction = UIAlertAction(title: "НЕТ", style: .default) { action in
                    ()
                }
                
                alert.addAction(yesAction)
                alert.addAction(noAction)
                
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
}


