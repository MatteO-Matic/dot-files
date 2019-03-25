export UE_HOME=/home/matte/Project/UnrealEngine

function unrealbuild
    #if set -r argv
    #echo "r set"
    #end

    set -x CURR_DIR (pwd);
    set -x PROJ_NAME (basename $argv[-1] .uproject); # Last argument is the project name
    eval $UE_HOME/Engine/Build/BatchFiles/Linux/Build.sh $PROJ_NAME Linux Development -editorrecompile "$CURR_DIR/$PROJ_NAME.uproject" -progress -editor -game -NoHotReloadFromIDE -canskiplink
end
#complete -f -x '!*.@(uproject)' unrealbuild

function unrealeditor
    env DIR=( cd ( dirname "$i" ) ; pwd )
    eval $UE_HOME/Engine/Binaries/Linux/UE4Editor $DIR/$1
end
#complete -f -x '!*.@(uproject)' unrealeditor

function unrealgen
    env DIR=( cd ( dirname "$i" ) ; pwd )
    eval pushd $UE_HOME
    ./GenerateProjectFiles.sh -project="$DIR/$1" -game -engine -editor
    popd
end
#complete -f -x '!*.@(uproject)' unrealgen

# For automation tests
function unrealtest
    env DIR=(cd ( dirname "$i" ) ; pwd)
    eval $UE_HOME/Engine/Binaries/Linux/UE4Editor $DIR/$1 -Game -ExecCmds="Automation RunTests $2" -log
end
#complete -f -x '!*.@(uproject)' unrealtest
