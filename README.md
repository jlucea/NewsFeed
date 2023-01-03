![NewsFeed Banners](https://user-images.githubusercontent.com/26114098/210335586-bec39ce9-8e03-4f1f-bdd9-a075ea29547d.png)

# NewsFeed

News feed is a lightweight iOS app developed in SwiftUI that integrates with newsapi.org to show the latest technology news.

# Features

* List view - A searchable navigation view that uses custom views to display large images and news headlines
* Detail view - A vertical scroll view showing the image, the meta-data and the full content of the news article 
* Search bar - The list view contains a search bar that immediately filters the displayed results as the user types 

# Technical Details

* NewsFeed is developed in SwiftUI and uses minimal amount of code, taking advantage of many built-in features of SwiftUI
* It integrates with the online service newsapi.org as a source of content
* Data returned from newsapi.org is decoded using JSONDecoder
* Code is structured following best practices and applying the MVVM architectural pattern

