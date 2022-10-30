export LEMONBAR_CONFIG_PATH=$(dirname $0)
source $LEMONBAR_CONFIG_PATH/style.sh

[ $BOTTOM == "y" ] && BOTTOM="-b"

$LEMONBAR_CONFIG_PATH/main.sh | lemonbar -p -f $FONT $BOTTOM
