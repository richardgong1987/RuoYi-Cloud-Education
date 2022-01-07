echo 'Stopping all RuoYi running service...'
pids=( $(jps | grep RuoYi | awk '{print $1}') )

for pid in "${pids[@]}"; do
     echo "killing $pid"
     kill -9 $pid
done