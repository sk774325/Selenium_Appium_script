#! /bin/sh
# Assignment
wda=8100
server=4723
for i in $(seq 1 $1);
do
	osascript -e 'tell app "Terminal"
		do script "appium -p '"$server"' --webdriveragent-port '"$wda"' --default-capabilities '"'"'{\"appium: enforceFreshCreation\": \"true\"}'"'"'"
	end tell'
	server=$(($server+1))
	wda=$(($wda+1))
done
