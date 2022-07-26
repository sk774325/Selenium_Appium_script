# This file for create all iphone types.
# ./node_script.sh $1 $2
# $1 is for iphone version.
# $2 is server port start from.
server_port=$2
appium_port=4723
iphone=("13 Pro Max" "13 Pro" "13" "12 Pro Max" "12 Pro" "12" "11 Pro Max" "11 Pro" "11" "XR" "8")
for ((i = 0; i < ${#iphone[@]}; i++));
do
if [ ${#iphone[$i]} -gt 6 ]
then 
version=${iphone[$i]:0:2}
cat << EOF > node_iphone${version}_PRO_MAX_ver$1.toml 
[server]
port = $server_port

[node]
detect_drivers = false
# override-max-sessions = true
# max-sessions = 15

[relay]
url = "http://localhost:$appium_port/wd/hub"
status-endpoint = "/status"
configs = [
	"1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone ${iphone[$i]}", "appium:platformVersion": "$1"}'
]
EOF
elif [ ${#iphone[$i]} -gt 3 ]
then 
version=${iphone[$i]:0:2}
cat << EOF > node_iphone${version}_PRO_ver$1.toml 
[server]
port = $server_port

[node]
detect_drivers = false
# override-max-sessions = true
# max-sessions = 15

[relay]
url = "http://localhost:$appium_port/wd/hub"
status-endpoint = "/status"
configs = [
	"1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone ${iphone[$i]}", "appium:platformVersion": "$1"}'
]
EOF
else 
version=${iphone[$i]:0:2}
cat << EOF > node_iphone${version}_ver$1.toml 
[server]
port = $server_port

[node]
detect_drivers = false
# override-max-sessions = true
# max-sessions = 15

[relay]
url = "http://localhost:$appium_port/wd/hub"
status-endpoint = "/status"
configs = [
	"1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone ${iphone[$i]}", "appium:platformVersion": "$1"}'
]
EOF
fi 
server_port=$(($server_port+1))
appium_port=$(($appium_port+1))
done