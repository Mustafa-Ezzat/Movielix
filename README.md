# Movielix

SWVL Mobile Challenge

# Table of Contents:
- [Problem](#problem)
- [Solution](#solution)

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
- Display the list in any order
- The list is searchable
- The search results will be categorized by Year.
- Each search result category will hold at most the top rated 5 movies of this category (year).
- Display the movie details
- Fetch the list of pictures from flickr that matches the movie title as the search
query
- Display the list of pictures in a two column
- Handle error for "Not all search terms are expected to return data from Flickr"
