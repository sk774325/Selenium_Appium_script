#! /bin/sh
# Assignment

bool=0
while [ $bool -le 0 ]
do 
    if pgrep -fl hub_start.sh; 
    then
        echo "Process already running"
        sleep 2
    else
        echo "Not running"
        osascript -e 'tell app "Terminal"
            do script "./Desktop/selenium_script/hub_start.sh"
	    end tell'
        osascript -e 'tell app "Terminal"
            do script "./Desktop/selenium_script/appium_script.sh 12"
	    end tell'
        sleep 30
        osascript -e 'tell app "Terminal"
            do script "./Desktop/selenium_script/node_start.sh 4.1.3"
	    end tell'
        bool=1
    fi
done