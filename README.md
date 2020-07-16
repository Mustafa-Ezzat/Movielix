# Movielix

Mobile app

# Table of Contents:
- [Problem](#problem)
- [Solution](#solution)
- [Testing](#testing)
- [Installation](#installation)
- [Third parties](#Third-parties)
- [Future](#future)
- [References](#references)

## Problem

You will have a local list of movies that should be displayed in any order. The list is ​searchable and the search results will be categorized by Year.

Each search result category will hold at most the ​top rated 5 movies​ of this category (year​)​.
Once a movie is selected from the search results, you will switch to a detailed view to unveil the following:
- Movie Title
- Movie Year
- Movie Genres (if any)
- Movie Cast (if any)
- A two column list of pictures fetched from flickr that matches the movie title as the search
query

## Solution

Breaking down a problem into smaller subproblems:

- Read the local list of movies
- Caching the loaded movies to minimize the parsing time
- Display the list in any order
- The list is searchable
- The search results will be categorized by Year.
- Each search result category will hold at most the top rated 5 movies of this category (year).
- Display the movie details
- Fetch the list of pictures from flickr that matches the movie title as the search
query
- Display the list of pictures in a two column
- Handle error for "Not all search terms are expected to return data from Flickr"

## Testing

TDD is self-documentation for your product, it is when your tests are written before your implementation. These are the TDD three Laws: 1) (RED) Write a failing test 2) (Green) Make the test pass 3) Refactor your code. 

Testing is the self-documentation for each piece of the problem:

- [Read the local list of movies](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/JsonReaderTests.swift)
- [Caching](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/RealmWorkerTests.swift)
- [Categorize movies per year](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/CategorizerTests.swift)
- [Sort movies by rating](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/MovieSorterTests.swift)
- [Search by keyword](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/MovieSearcherTests.swift)

Search support prefix, infix, and postfix.

## Installation
- You have Xcode installed
- Open your terminal 
- 'git clone https://github.com/Mustafa-Ezzat/Movielix.git'

Hints: I recommend using ssh in other situations

## Third parties
- [Moya](https://github.com/Moya/Moya) is a network abstraction layer written over [Alamofire](https://github.com/Alamofire/Alamofire)
- [lottie-ios](https://github.com/airbnb/lottie-ios) is an iOS library to natively render animations, powered by airbnb
- [Cosmos](https://github.com/evgenyneu/Cosmos) is a star rating control for iOS/tvOS written in Swift
- [Nuke](https://github.com/kean/Nuke) is a powerful image loading and caching system
- [Unrealm](https://github.com/arturdev/Unrealm) is powerful caching swift library written over RealmCocoa, which enables Swift native types to be saved in Realm.
- [SwiftLint](https://github.com/realm/SwiftLint) is a tool to enforce Swift style and conventions.

Hint: [cocoapods](https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control) community recommends against adding the Pods directory to your [.gitignore](https://github.com/Mustafa-Ezzat/Movielix/blob/master/.gitignore).

## Future
- Optimize the time of the [auto-complete search algorithm](https://github.com/Mustafa-Ezzat/Movielix/blob/master/Movielix/MovielixTests/ModulesTests/MovieSearchTests/MovieSearcherTests.swift) based on [trie data structure](https://www.geeksforgeeks.org/auto-complete-feature-using-trie/)
- I recommend using [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble) to write clear self-documentation test cases.

## References

- [Clean swift architecture](https://clean-swift.com/)
- [The SOLID principles](https://www.youtube.com/watch?v=ltyI-o3DFtQ)
