# This file for creating specific version.
# ./node_script.sh $1 $2 $3 $4
# $1 for type of iphone.
# $2 for PRO MAX or PRO or normal version. 
# "1" for PRO MAX ; "2" for PRO ; "3" for normal.
# $3 for iphone version.
# $4 for server port
if [ "$2" = "1" ]
then 
  cat << EOF > node_iphone$1_PRO_MAX_ver$3.toml 
  [server]
  port = $4

  [node]
  detect_drivers = false
  override-max-sessions = true
  max-sessions = 15

  [relay]
  url = "http://localhost:4723/wd/hub"
  status-endpoint = "/status"
  configs = [
    "1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone $1 PRO MAX", "appium:platformVersion": "$3"}'
  ]
EOF
elif [ "$2" = "2" ]
then
  cat << EOF > node_iphone$1_PRO_ver$3.toml
  [server]
  port = $4

  [node]
  detect_drivers = false
  override-max-sessions = true
  max-sessions = 15

  [relay]
  url = "http://localhost:4723/wd/hub"
  status-endpoint = "/status"
  configs = [
    "1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone $1 PRO", "appium:platformVersion": "$3"}'
  ]
EOF
elif [ "$2" = "3" ]
then
  cat << EOF > node_iphone$1_ver$3.toml 
  [server]
  port = $4
  
  [node]
  detect_drivers = false
  override-max-sessions = true
  max-sessions = 15

  [relay]
  url = "http://localhost:4723/wd/hub"
  status-endpoint = "/status"
  configs = [
    "1", '{"browserName": "safari", "platformName": "iOS","deviceName": "iPhone $1", "appium:platformVersion": "$3"}'
  ]
EOF
fi 
