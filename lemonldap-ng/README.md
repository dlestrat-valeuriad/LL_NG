# Architecture projet
- "conf" contient la configuration LL::NG du module Cnamts + service OIDC
- "bootstrap" contient les elements de la charte graphique PAM qui sont envoy�s dans LL::NG
- "init" contient les fichiers sources de LL::NG qui ont �t� adapt�s pour d�lcarer le module cnamts
- "moduleCnamts" contient le module perl de cnamts qui permet de s'autentifier et d'alimenter les variables LL::NG
	- le module appel un service REST qui est bouchonn�, voir r�pertoire tomcat

# Utiles
- login/mdp: dwho
- http://auth.example.com
- http://manager.example.com

- Le module cnamts appel un service REST d'authentification. 
	
	Il existe deux modes:
	- service json statics
		- tous les couples identifiants/mdp sont accept�s (� l'exception de l'utilisateur dwho, sinon l'acces � l'administration est impossible). Un fichier json avec des donn�es pr�d�finits est renvoy�.
	- service postgre
		- seul les couples identifiants/mdp renseign�s dans les tables sont accept�s. Un fichier json est g�n�r� depuis les informations r�cuper�s de la base de donn�es.
	Pour passer d'un mode � un autre, il faut modifier les url d�finit dans les fichiers AuthCnamts et UserDBCnamts (pour connaitre les url cf. README docker/tomcat)
	
# Modifications
- bootstrap
	- modification du fichier login.tpl pour accepter un identifiant avec plus de 9 caracteres
- init
	- declaraction du module cnamts pour l'autentification, userBD et passwordDB
	- ajout des variables d'exportations (cnamtsExportedVars)
- moduleCnamts
	- AuthCnamts
		- modification de la methode authInit pour supprimer les users statics
		- modification de la methode authenticate pour qu'il gere plus de code retour en cas d'erreurs
	- UserDBCnamts
		- modification de la methode getUser pour recuperer les informations retourn�s par le service REST
		- modification de la methode userDBInit pour ne plus initialiser la variable _cnamtsAccounts
