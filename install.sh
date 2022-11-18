#!/bin/bash

# CHECK PERMISSION AND DIRECTORY
if [ ! $UID -eq 0 ]; then
	echo "Permission denied."
	exit 1
elif [ ! -d /usr/share/plymouth/themes ]; then
	echo "Please setup plymouth."
	exit 1
fi

if [ ! $1 ]; then
	echo "Please choose theme at least one."
	echo "Example: ~# install.sh xinux-logo xinux-pp"
	exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

for ((i=1; i <= $#; i++)); do
	case ${!i} in

		# INSTALL xinux-logo
		"xinux-logo" ) \
		rm -rf /usr/share/plymouth/themes/xinux-logo ; \
		mkdir /usr/share/plymouth/themes/xinux-logo && \
		cp $SCRIPT_DIR/xinux-logo/intro/* /usr/share/plymouth/themes/xinux-logo/ && \
		cp $SCRIPT_DIR/xinux-logo/loop/* /usr/share/plymouth/themes/xinux-logo/ && \
		cp $SCRIPT_DIR/xinux-logo/misc/* /usr/share/plymouth/themes/xinux-logo/ && \
		echo "installing xinux-logo ......" && plymouth-set-default-theme -R xinux-logo >/dev/null 2>&1 && \
		echo "INSTALL xinux-logo DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;

		# INSTALL xinux-pp
		# "xinux-pp" ) \
		# rm -rf /usr/share/plymouth/themes/xinux-pp ; \
		# mkdir /usr/share/plymouth/themes/xinux-pp && \
		# cp $SCRIPT_DIR/xinux-pp/intro/* /usr/share/plymouth/themes/xinux-pp/ && \
		# cp $SCRIPT_DIR/xinux-pp/loop/* /usr/share/plymouth/themes/xinux-pp/ && \
		# cp $SCRIPT_DIR/xinux-pp/misc/* /usr/share/plymouth/themes/xinux-pp/ && \
		# echo "installing xinux-pp ......" && plymouth-set-default-theme -R xinux-pp >/dev/null 2>&1 && \
		# echo "INSTALL xinux-pp DONE !!!!" || echo "ERROR HAS OCCURRED !!" ;;
		
	esac
done

exit
