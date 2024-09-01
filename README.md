# Description
Anime Zone is a comprehensive anime and manga library offering detailed information, latest news, and engaging discussions.
Pushing my limits to learn more about advanced flutter topics like app architecture to handle complex and scale more easier.
Exploring more about Flutter and how I can make better code in it.

![](https://github.com/IsmailIbrahim5/AnimeZone/blob/main/readme_resources/Concept%20Design.jpg)
![](https://github.com/IsmailIbrahim5/AnimeZone/blob/main/readme_resources/Dark%20Concept%20Art.jpg)


# Features

1. Explore a wide variety of anime and manga, latest episodes, reviews and recommendations.

2. Explore new anime and manga and what they offer.

3. Stay informed with the latest news, discussions and trends.

4. Organize your favorites with personalized collections and keep track of what you want to watch or read next.


# What did I create new in this app?
I tried to focus less on animation and innovative UI this time. Instead I would direct my focus to learn more about clean code, design patterns and architecture and how I cant make my code more scalable and efficient.


## Dark Mode
I've tried to build an animated dark mode system that would work using riverpod generators to provide all of the UI with different themes.
I've came to realize later that using the built in `ThemeData` in `MaterialApp` and switching would be much easier and would probably achieve the same result but it was fun experience to learn how to make it from scratch, also it would be useful if the app has variety of colors and more than two themes.

# What did I learn new in this app

![](https://github.com/IsmailIbrahim5/AnimeZone/blob/main/readme_resources/darkmode.gif)


## [Riverpod Clean Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
I tried to learn about different types of design patterns and code architecture, and so I learned about MVVM, MVC, MVP and clean architecture.
And I decided to follow the [riverpod clean architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) created by [Andrea Bizzotto](https://codewithandrea.com/) which is pretty close to the clean architecture pattern and it uses riverpod and state management controllers.

![App architecture using data, domain, application, and presentation layers. Arrows show the dependencies between layers.](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/images/flutter-app-architecture.webp)

## [Riverpod](https://riverpod.dev/) 
I tried to learn more about different types of state management controllers, and so I learnt [getx](https://pub.dev/packages/get), [blocs](https://pub.dev/packages/flutter_bloc) and [providers](https://pub.dev/packages/provider) which I previously always used to work with them. And I also learnt [riverpod](https://pub.dev/packages/riverpod) which is considered to be the "newer, better and also very similar" version of providers.

## Different Concepts
I learnt about different concepts while trying to explore more about flutter and what can it offer and what can make coding easier and faster, and so I learnt different packages like [Equatable](https://pub.dev/packages/equatable), [Freezed](https://pub.dev/packages/freezed), Dio Interceptors and Cache, [Go Router](https://pub.dev/packages/go_router) and UI Testing.

##Fetching data from API and different Endpoints
I used [Jikan API](https://jikan.moe/) in this app to get different information about anime and manga, the news and discussions about the industry and used them to display them in my app in a nice and neat UI.

## Web scraping
Although I depended almost fully on [Jikan API](https://jikan.moe/) as my resource of data, there were still few resources I needed to get from the internet that I couldn't get from prepared API.
So I learnt about web scrapping and how I can use [cheerio](https://www.npmjs.com/package/cheerio) and [axios](https://www.npmjs.com/package/axios) in NodeJS to get information from the web.
And I used it to get news and articles from [myanimelist.net](myanimelist.net) because the Jikan API didn't cover that part.
I also tried to use it to get anime and manga wallpaper from google images search and it was working fine up until few weeks ago when google changed it's search settings so I can no longer scrap images from google unless I use other methods like [puppeteer](https://www.npmjs.com/package/puppeteer) and manipulate it to get the source image url.
So I ended up using [Google Programmable Search Engine API](https://programmablesearchengine.google.com), but it's limited to 100 calls per day, so you may not be able to get the anime wallpapers in the home screen :)

## Caching using [sqflite](https://pub.dev/packages/sqflite)
I wanted the user to have an experience on the app whether there was an internet connection or not.
So I used sqflite databases to store the resources that gets downloaded and use them if there is no internet connection.

## News Notifications
I wanted to notify the user whenever there are news that got published, so I set a [schedule](https://www.npmjs.com/package/node-schedule) in the NodeJS server to check every 2 hours if the website published any news, and if there is it sends a firebase notification to all the devices that are subscribed to the `RecentNews` topic (which I ask for at the beginning of the application).


## What's Next?
I've been thinking about a couple improvements that definitely can take this app to a commercial level, For example:
1. Adding a functionality to login with [MAL](myanimelist.net) account and get experience based on user's preferences and favorites.
2. Modify the app navigation using better routing system, currently I'm only using `Navigation.push()`, `Navigation.pop()` to navigate because it didn't feel like it needed more than that. But definitely if the app scaled up more it would need better navigation system like [Go Router](https://pub.dev/packages/go_router) or [Flutter app router 2.0 system](https://docs.flutter.dev/ui/navigation).
3. [Deep Linking](https://docs.flutter.dev/ui/navigation/deep-linking) if the app had the functionality to share anime, news and discussions and comments in the app, it would be huge to have deep links functionality that would just get the user to the right place with just a link, but that would also depend on the last point which is creating a routing system.
4. Adding searching functionality in articles and collections pages.
5. Adding liking and commenting  on discussion functionality.
6. Expanding the app with more details pages, like user and voice actors pages.
