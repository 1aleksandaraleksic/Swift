//
//  ViewController.swift
//  IMDb - clone
//
//  Created by aleksandar.aleksic on 6/14/21.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var sliderCollectionView: UICollectionView!
    @IBOutlet var whatToWatchCollectionView: UICollectionView!
    @IBOutlet var topPicksForYou: UICollectionView!
    @IBOutlet var fanFavoriteCollectionView: UICollectionView!
    @IBOutlet var explorePrimeVideoCollectionView: UICollectionView!
    @IBOutlet var boxOfficeTableView: UITableView!
    @IBOutlet var comingSoonCollectionView: UICollectionView!
    @IBOutlet var watchSoonAtHomeCollectionView: UICollectionView!
    
    @IBOutlet var buttonsCollectionView: UICollectionView!
    
    let fetch = DataPreparation()
    
    var listOfMovieBoxOffice:[MovieBoxOffice]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareData()
        prepareTabBarWithColor(backgroundColor: UIColor.black, fontColor: UIColor.yellow)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showHideNavBar(isVisible: true)
    }

    
    // MARK: CollectionView rendering for all collection view on home VC
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView{
            if let numberOfMovies = DataPreparation.listMoviesInTranding?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == whatToWatchCollectionView{
            if let numberOfMovies = DataPreparation.listWhatToWatchMovie?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == topPicksForYou{
            if let numberOfMovies = DataPreparation.listTopPicksForYou?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == fanFavoriteCollectionView{
            if let numberOfMovies = DataPreparation.listFanFavorite?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == explorePrimeVideoCollectionView{
            if let numberOfMovies = DataPreparation.listExplorePrime?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == comingSoonCollectionView{
            if let numberOfMovies = DataPreparation.listComingSoon?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == watchSoonAtHomeCollectionView{
            if let numberOfMovies = DataPreparation.listWatchSoonAtHome?.Search.count{
                return numberOfMovies
            }
        }else if collectionView == buttonsCollectionView{
            return 7
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sliderCollectionView{
            return prepareCellMoviesInTrandingCollectionViewCell(indexPath: indexPath)
        }else if collectionView == whatToWatchCollectionView{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "cellWhatToWatch", collectionView: whatToWatchCollectionView, searchMovie: DataPreparation.listWhatToWatchMovie!)
        }else if collectionView == topPicksForYou{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "cellTopPicksForYou", collectionView: topPicksForYou, searchMovie: DataPreparation.listTopPicksForYou!)
        }else if collectionView  ==  fanFavoriteCollectionView{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "cellFanFavorite", collectionView: fanFavoriteCollectionView, searchMovie: DataPreparation.listFanFavorite!)
        }else if collectionView == explorePrimeVideoCollectionView{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "explorePrimeCell", collectionView: explorePrimeVideoCollectionView, searchMovie: DataPreparation.listExplorePrime!)
        }else if collectionView == comingSoonCollectionView{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "cellComingSoon", collectionView: comingSoonCollectionView, searchMovie: DataPreparation.listComingSoon!)
        }else if collectionView == watchSoonAtHomeCollectionView{
            return prepareSharedCellForCollectionView(indexPath: indexPath, cellIdentifier: "cellWatchSoonAtHome", collectionView: watchSoonAtHomeCollectionView, searchMovie: DataPreparation.listWatchSoonAtHome!)
        }
        
        if collectionView == buttonsCollectionView{
            let cell = buttonsCollectionView.dequeueReusableCell(withReuseIdentifier: "buttonForFilterCell", for: indexPath) as! ButtonForFilterCollectionViewCell
            if indexPath.row == 6{
                cell.buttonForFilter.setTitle("more...", for: .normal)
                cell.buttonForFilter.addTarget(self, action: #selector(openGenreTableView), for: .touchUpInside)
                return cell
            }
            cell.buttonForFilter.setTitle(StaticDataForApp.genreForFilter[indexPath.row], for: .normal)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    @objc func openGenreTableView(sender: UIButton!){
        performSegue(withIdentifier: "showMoreGenre", sender: self)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case sliderCollectionView:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        case whatToWatchCollectionView, topPicksForYou, fanFavoriteCollectionView, explorePrimeVideoCollectionView, comingSoonCollectionView, watchSoonAtHomeCollectionView:
            return CGSize(width: 125, height: 220)
        case buttonsCollectionView:
            return CGSize(width: 120, height: 35)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    func prepareCellMoviesInTrandingCollectionViewCell(indexPath: IndexPath) -> MoviesInTrandingCollectionViewCell{
        let sliderCell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cellForMovieSlider", for: indexPath) as! MoviesInTrandingCollectionViewCell
        sliderCell.titleName.text = DataPreparation.listMoviesInTranding!.Search[indexPath.row].title
        if let urlString =  DataPreparation.listMoviesInTranding!.Search[indexPath.row].poster as? String, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        sliderCell.imageBackground.image = UIImage(data: data)
                        sliderCell.imagePoster.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return sliderCell
    }
    
    
    func prepareSharedCellForCollectionView(indexPath: IndexPath, cellIdentifier: String, collectionView: UICollectionView, searchMovie: SearchMovies) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SharedCellForCollectionView
        
        cell.imdbRating.text = searchMovie.Search[indexPath.row].imdbID
        cell.movieTitle.text = searchMovie.Search[indexPath.row].title
        cell.movieYearAndDuration.text = searchMovie.Search[indexPath.row].year
        
        if let urlString = searchMovie.Search[indexPath.row].poster as? String, let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url){ (data,response,error) in
                if let data = data{
                    DispatchQueue.main.async {
                        cell.movieImage.image = UIImage(data: data)
                    }
                }
                
            }.resume()
        }
        
        if collectionView == explorePrimeVideoCollectionView{
            cell.buttonWatchListOrNow.setTitle("Watch Now", for: .normal)
        }
        
        if collectionView == comingSoonCollectionView || collectionView == watchSoonAtHomeCollectionView{
            cell.buttonWatchListOrNow.isHidden = true
        }
        
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    // MARK: Table View (Box Office)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfMovieBoxOffice?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boxOfficeCell", for: indexPath) as! BoxOfficeTableViewCell

        cell.positionOfMovie.text = String(indexPath.row + 1)
        cell.nameOfMovie.text = listOfMovieBoxOffice?[indexPath.row].title ?? "N/A"
        cell.boxOfficeOfMovie.text = listOfMovieBoxOffice?[indexPath.row].boxOffice ?? "N/A"

        return cell
    }
    
    //MARK: Fetch/Prepare data for home vc
    
    func prepareData(){
        DataPreparation.fetchMovie(url: DataPreparation.createURLForMovie()) { (result) in
            guard let result = result else { return }
            DataPreparation.listMoviesInTranding = result
            
            for (i, movie) in result.Search.enumerated(){
                if i > 5 { break }
                let urlForFetch = "http://www.omdbapi.com/?apikey=2d1f01c0&i=\(movie.imdbID)"
                DataPreparation.fetchMovieBoxOffice(url: urlForFetch) { [self] (movieBoxOffice) in
                    self.listOfMovieBoxOffice?.append(movieBoxOffice!)
                    DispatchQueue.main.async {
                        self.boxOfficeTableView.reloadData()
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.sliderCollectionView.reloadData()
                self.boxOfficeTableView.reloadData()
            }
            
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&s=blue") { (result) in
            guard let result = result else { return }
            DataPreparation.listWhatToWatchMovie = result
            
            DispatchQueue.main.async {
                self.whatToWatchCollectionView.reloadData()
            }
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&s=gray") { (result) in
            guard let result = result else { return }
            DataPreparation.listTopPicksForYou = result
            
            DispatchQueue.main.async {
                self.topPicksForYou.reloadData()
            }
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&s=show") { (result) in
            guard let result = result else { return }
            DataPreparation.listFanFavorite = result
            
            DispatchQueue.main.async {
                self.fanFavoriteCollectionView.reloadData()
            }
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&s=mirror") { (result) in
            guard let result = result else { return }
            DataPreparation.listExplorePrime = result

            DispatchQueue.main.async {
                self.explorePrimeVideoCollectionView.reloadData()
            }
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&y=2021&s=robot") { (result) in
            guard let result = result else { return }
            DataPreparation.listComingSoon = result

            DispatchQueue.main.async {
                self.comingSoonCollectionView.reloadData()
            }
        }
        
        DataPreparation.fetchMovie(url: "http://www.omdbapi.com/?apikey=2d1f01c0&type=series&s=wall") { (result) in
            guard let result = result else { return }
            DataPreparation.listWatchSoonAtHome = result

            DispatchQueue.main.async {
                self.watchSoonAtHomeCollectionView.reloadData()
            }
        }
        
    }
    

}

