

echo "Enter the path of your folder : "
read path
if [ -d "$path" ]; then
	cd "$path" || exit
	echo "We are in the territory : $(pwd)"
	return
else
	echo "Invalid territory , try again :( "
fi 



			