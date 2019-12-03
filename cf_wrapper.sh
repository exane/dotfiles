
#!/bin/bash

# Get the actual command to be called
command="$1"
shift

for arg in $*
do
  case $arg in
  rails_c)
    app=$2
    cf ssh $app -t -c '/tmp/lifecycle/launcher /home/vcap/app/ "rails c" ""'
    exit 0
    ;;
  *)
  break
  ;;
  esac
done

# Now call the actual command
$command "$@"