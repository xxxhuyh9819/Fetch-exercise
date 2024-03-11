# Fetch-exercise

An exercise to fetch and display data from a remote data source.

### Project Structure ###

DataManager: fetch, decode, filter, and sort the remote data and transform the data to a dictionary that groups them by **"listId"**. Singleton is used to ensure that there's only one DataManager instance.

Item: the model to which each item of the fetched data will be decoded.

ItemViewModel: get converted data from DataManager, and serve the GUI

ContentView: the view that renders data from ItemViewModel
