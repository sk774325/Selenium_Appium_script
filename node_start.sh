# This file for running all node script files.
# ./node_start.sh $1 
# $1 is selenium-server version
node_dir=`ls ./*.toml`
for eachfile in $node_dir
do
	osascript -e 'tell app "Terminal"
		do script "cd Desktop/node_script && java -jar selenium-server-'"$1"'.jar node --config '"$eachfile"'"
	end tell'
done
