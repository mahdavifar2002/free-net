# free-net
For God's sake.  

# Table of contents
- [free-net](#free-net)
- [Table of contents](#table-of-contents)
- [On Europe Server](#on-europe-server)
	- [Insall](#insall)
	- [Restart](#restart)
- [On Iran Server](#on-iran-server)
	- [Insall](#insall-1)
	- [Update](#update)
	- [Restart](#restart-1)



# On Europe Server

## Insall
Run the following command to install `x-ui` on Europe server. You will be prompted to enter a username, a password, and a panel port.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --europe --restart
```


## Restart
In case if `x-ui` has stopped working, run the following command to restart it.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --europe --restart
```

# On Iran Server

## Insall
Run the following command command. Replace `1.1.1.1` with the IP of your Europe server.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --install --server 1.1.1.1
```

## Update
In case if you have changed IP of Europe server, run the following command command to update it. Replace `1.1.1.1` with the new IP of your Europe server.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --update --server 1.1.1.1
```

## Restart
After every reboot on Iran server, run the following command to activate packet forwarding.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --restart
```