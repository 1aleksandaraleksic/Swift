//
//  MovieViewController.swift
//  Enum
//
//  Created by aleksandar.aleksic on 5/27/21.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movie: Movie = Movie(title: "", year: 0, rated: 0, runTime: "", genre: Genre.action, director: "", writer: "", language: Language.English, country: Country.USA, productionHouse: ProductionHouse.columbiaP, mainActor: "", image: "")

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieName: UILabel!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var movieIMDBMark: UILabel!
    @IBOutlet var movieDuration: UILabel!
    @IBOutlet var movieDirector: UILabel!
    @IBOutlet var movieWriter: UILabel!
    @IBOutlet var movieMainStar: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieToView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        movieImage.image = UIImage(named: movie.image)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
//    func changeImageSize(imageView: UIImageView) -> Float{
//        imageView.frame.width =
//        return 0.0
//    }
    
    func setMovieToView(){
        self.navigationItem.title = movie.title
        
        movieName.text = movie.title
        movieGenre.text = "\(movie.genre)"
        movieYear.text = String(movie.year)
        movieIMDBMark.text = "IMDB \n\(movie.rated)"
        movieDuration.text = movie.runTime
        movieDirector.text = movie.director
        movieWriter.text = movie.writer
        movieMainStar.text = movie.mainActor
    }



}
