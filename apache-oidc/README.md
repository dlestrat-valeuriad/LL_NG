# Architecture projet
- "proto-apache2" contient la configuration pour se connecter en OIDC sur LL::NG
- "sites-available" contient la configuration (non opérationnel pour l'instant) pour se connecter en OIDC en HTTPS sur LL::NG

# Utiles
La configuration apache contient 3 types de redirections:
- TEST ENV dmwaa00
	- Redirection vers Espace pro dmwaa00
- CONF PAM sur poste en local
	- Redirection sur machine en local
- CONF TOMCAT pour visualiser les header
	- Redirection sur servlet tomcat (utiliser pour visualiser les headers)
	
# Modifications
- creation d'un virtualHost avec les parametres OIDC (proto-apache2.conf)