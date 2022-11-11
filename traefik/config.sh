#!/bin/bash

add_domain() {
	echo 'Add a domain is a good idea!'
	read -p 'What name it should have?'$'\n' domainName
	echo 'That is a great name for a domain!'
	mkcert -cert-file certs/"$domainName".pem -key-file certs/"$domainName"-key.pem "$domainName"
	echo "    - certFile: /traefik-certs/$domainName.pem
      keyFile: /traefik-certs/$domainName-key.pem" >> ./config/tls.yml
	echo "Your domain $domainName was added to the tls.yml config of Traefik. You are ready to go!"
}


PS3='What you wanna do? '
options=('Add domain' 'Quit')
select opt in "${options[@]}"
do
	case $opt in
		'Add domain')
			echo 'Ok, we will add a domain for you :)'
			add_domain
			;;
		'Quit')
			echo 'Ok, so good bye my friend...'
			break
			;;
		*) echo "Invalid option $REPLY";;
	esac
done
