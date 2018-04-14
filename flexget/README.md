flexget
====

Flexget container with subliminal for the subtitles. Ready to be integrated with transmission.

## Run

 + Variables:
	+ `SUBTITLE_LANGUAGE`: language (ISO 639-1 two chars) for the subtitles (fr, en, ja, ...)
	+ `RSS_URL`: the url of the rss feed
	+ `PATH_TO_SHOWS`: path to the folder where all the files will be stored

  ```
  # Set variables
  export SUBTITLE_LANGUAGE="en"                  
  export RSS_URL="http://your_feed_url"
  export PATH_TO_SHOWS="/your/path/show"  

  # Run your favourite transmission container (https://github.com/andoniaf/flexget-docker)
  docker run --name transmission -d \
 	    -p 9091:9091 -p 51413:51413 -p 51413:51413/udp \
 	    andoniaf/transmission

  # Run the flexget container
 docker run --name flexget -d --volumes-from transmission -v "${PATH_TO_SHOWS}:/shows" \
 	    -v "${PWD}/assets_flexget:/root/.flexget" \
 	    -e "RSS_URL=${RSS_URL}" \
 	    -e "SUBTITLE_LANGUAGE=${SUBTITLE_LANGUAGE}" \
 	    --link "transmission:transmission" \
 	    -p 5050:5050 \
 	    andoniaf/flexget
  ```


+ TODO
  + Add periscope plugin (anothe subtitle plugin)
