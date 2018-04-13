flexget-docker
====

## Requirements

+ **Docker**
+ **RSS** feed (example: showrss.info)


## Download from Github

 + Clone the repo and build the images
```
	$ git clone https://github.com/andoniaf/flexget-docker.git
	$ cd flexget-docker
	# Edit files if need
	$ make
```

## Run

 + Variables:
	+ `SUBTITLE_LANGUAGE`: language (ISO 639-1 two chars) for the subtitles (fr, en, ja, ...)
	+ `RSS_URL`: the url of the rss feed
	+ `PATH_TO_SHOWS`: path to the folder where all the files will be stored


 + First time use the `launcher.sh` o run manually:

 ```
 # Set variables
 export SUBTITLE_LANGUAGE="en"                  
 export RSS_URL="http://your_feed_url"
 export PATH_TO_SHOWS="/your/path/show"  

 # Run the transmission container
 docker run --name transmission -d \
	    -p 9091:9091 -p 51413:51413 -p 51413:51413/udp \
	    andoniaf/transmission

 # Run the transmission container
docker run --name flexget -d --volumes-from transmission -v "${PATH_TO_SHOWS}:/shows" \
	    -v "${PWD}/assets_flexget:/root/.flexget" \
	    -e "RSS_URL=${RSS_URL}" \
	    -e "SUBTITLE_LANGUAGE=${SUBTITLE_LANGUAGE}" \
	    --link "transmission:transmission" \
	    -p 5050:5050 \
	    andoniaf/flexget
```

 + Now you can stop it :

  ```docker stop flexget transmission```

 + And run it again

	```docker start transmission flexget```

------------
# TODO
- Add support to periscope (another subs plugin)
- Add user/pass to transmission conf
