#!/bin/bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--server)
      SERVER="$2"
      shift # past argument
      shift # past value
      ;;
    -p|--proxy)
      PROXY="$2"
      shift # past argument
      shift # past value
      ;;
    -f|--family)
      FAMILY="$2"
      shift # past argument
      shift # past value
      ;;
    -a|--alireza)
      ALIREZA="$2"
      shift # past argument
      shift # past value
      ;;
    --iran)
      IRAN=YES
      shift # past argument
      ;;
    --europe)
      EUROPE=YES
      shift # past argument
      ;;
    -i|--install)
      INSTALL=YES
      shift # past argument
      ;;
    -u|--update)
      UPDATE=YES
      shift # past argument
      ;;
    -r|--restart)
      RESTART=YES
      shift # past argument
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters



# Iran server, responsible for iptables nat ###################################
if [ "$IRAN" == "YES" ]; then

	# Installing iptables -----------------------------------------------------
	if [ "$INSTALL" == "YES" ]; then
		echo "Installing on Iran server..."
		sudo apt install -y netfilter-persistent
		sudo apt install -y iptables-persistent
		sudo ufw disable
		sudo sysctl net.ipv4.ip_forward=1
		sudo sh -c 'echo net.core.default_qdisc=fq >> /etc/sysctl.conf'
		sudo sh -c 'echo net.ipv4.tcp_congestion_control=bbr >> /etc/sysctl.conf'
		sudo sysctl -p
		echo "Installation finished"
	fi
	
	# Updating europe server ip address ---------------------------------------
	if [ "$UPDATE" == "YES" ] || [ "$INSTALL" == "YES" ]; then
		# reset -------------------------------------
		sudo iptables -F
		sudo iptables -X
		sudo iptables -t nat -F
		sudo iptables -t nat -X
		sudo iptables -t mangle -F
		sudo iptables -t mangle -X
		sudo iptables -P INPUT ACCEPT
		sudo iptables -P FORWARD ACCEPT
		sudo iptables -P OUTPUT ACCEPT
		sudo netfilter-persistent save 2> /dev/null
		sudo netfilter-persistent reload 2> /dev/null
		sudo service iptables restart
		# accept ssh --------------------------------
		sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j ACCEPT
		# redirect proxy ports ----------------------
		if [ -v PROXY ]; then
			sudo iptables -t nat -A PREROUTING -p tcp -m multiport --dports 80,443 -j DNAT --to-destination $PROXY
			sudo iptables -t nat -A PREROUTING -p tcp -m multiport --dports 23 -j DNAT --to-destination $PROXY:22
			sudo iptables -t nat -A PREROUTING -p tcp -m multiport --dports 445,777 -j DNAT --to-destination $PROXY:445
			sudo iptables -t nat -A PREROUTING -p tcp --dport 8060 -j DNAT --to-destination $PROXY:8080
		fi
		# redirect family ports ---------------------
		if [ -v FAMILY ]; then
			sudo iptables -t nat -A PREROUTING -p tcp --dport 543 -j DNAT --to-destination $FAMILY:443
			sudo iptables -t nat -A PREROUTING -p tcp --dport 8070 -j DNAT --to-destination $FAMILY:8080
		fi
		# redirect alireza ports --------------------
		if [ -v ALIREZA ]; then
			sudo iptables -t nat -A PREROUTING -p tcp --dport 12612 -j DNAT --to-destination $ALIREZA
		fi
		# redirect other ports ----------------------
		sudo iptables -t nat -A PREROUTING -p all -j DNAT --to-destination $SERVER
		# post-routing ------------------------------
		sudo iptables -t nat -A POSTROUTING ! -o lo -j MASQUERADE
		# save and reload ---------------------------
		sudo netfilter-persistent save 2> /dev/null
		sudo netfilter-persistent reload 2> /dev/null
		sudo service iptables restart
  		echo "[INF] Iran server updated successfully"
	fi

	# Restarting iptables -----------------------------------------------------
	if [ "$RESTART" == "YES" ]; then
		sudo sysctl net.ipv4.ip_forward=1 1> /dev/null
		sudo service iptables restart
  		echo "[INF] Iran server restarted successfully"
	fi
fi

# Europe server, responsible for x-ui #########################################
if [ "$EUROPE" == "YES" ]; then

	# Installing x-ui ---------------------------------------------------------
	if [ "$INSTALL" == "YES" ]; then
		echo "Installing on Europe server..."
		bash <(curl -Ls https://raw.githubusercontent.com/HexaSoftwareTech/x-ui/master/install.sh)
		echo "Installation finished"
	fi
	
	# Restarting x-ui ---------------------------------------------------------
	if [ "$RESTART" == "YES" ]; then
		x-ui restart
	fi
fi
