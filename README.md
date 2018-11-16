# RPThreadTracker Docker Development Environment

This project consolidates all projects associated with [RPThreadTracker](http://www.rpthreadtracker.com) into a single development environment orchestrated with Docker and `docker-compose`.

The following RPThreadTracker services are 



Setup steps:

* Install Docker and docker-compose if you have not already done so
* Clone the git repository to your local computer and run
```
git checkout development
git pull
git submodule update --recursive --remote
```
This will bring all your submodules up to date with the latest copy of their `development` branch. You will want to do this every time you begin work on a feature.
* Generate a set of Tumblr OAuth credentials.
	* First, register your application [here](https://www.tumblr.com/oauth/apps).
	* Use the consumer key and consumer secret you just generated to generate an OAuth token and OAuth secret associated with your Tumblr account using the form [here](https://api.tumblr.com/console/calls/user/info).
	* Duplicate the file at `./RPThreadTracker.BackEnd.TumblrClient/RPThreadTrackerV3.BackEnd.TumblrClient/appsettings.secure.example.json` and name it `appsettings.secure.json`, and update this new file with the consumer key, consumer secret, OAuth token, and OAuth secret that you just generated.
* On the command line, run 
```
docker-compose build
```
