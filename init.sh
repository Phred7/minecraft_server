a=0
b=0
while [ $a -lt 10 ]
do
	java -server -Xmx2G -Xms1024M -jar paper1_17_1.jar nogui
	echo Backing-up
	python init.py
	echo ctrl+C to exit...
	sleep 10
	echo server restarting
done

