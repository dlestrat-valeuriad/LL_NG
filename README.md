# Poste

## Hosts
Adapter l'ip en fonction de la VM et les ajouter au hosts
```
<ip-machine> auth-proto.credi-ouest.cnamts.fr manager-proto.credi-ouest.cnamts.fr amelipro-proto.credi-ouest.cnamts.fr
```

### Creation des dockers

Creation du docker proxy (pour que les autres vm's puissent telecharger les dépendances). Il faut adapter http_proxy et https_proxy
```
docker run -d --net=host --privileged -e http_proxy=http://ntes.proxy.corp.sopra:8080 -e https_proxy=http://ntes.proxy.corp.sopra:8080 reckonn/forgetproxy
```

Creation des dockers proto-connexion
```
docker-compose up --build
```

vos serveur sont lancés et opérationnels

Il peut arriver que certains docker refuses de démarrer, généralement l'erreur suivante apparait:
```
httpd (pid 6) already running
```
Pour résoudre le soucis il faut supprimer les dockers et relancer la commande, il faut supprimer le docker LL::NG et apache-oidc (docker rm [ID_CONTAINER])

# Utiles
## Url's
- manager LL::NG : http://manager-proto.credi-ouest.cnamts.fr
- Espace Pro: http://amelipro-proto.credi-ouest.cnamts.fr/PortailPS/CPS
- PAM: http://amelipro-proto.credi-ouest.cnamts.fr

## Comptes
- login/mdp: dwho/dwho (accès à l'administration LL::NG)

# Modifications environnement
## Changer les noms de domaines
### Domaines LL::NG
Se positionner sur le repertoire ***/vagrant/src/proto-connexion-docker*** et lancer la commande en adaptant les parametres
```
sed -i 's/[DOMAIN_ORIGINE]/[NOUVEAU_DOMAIN]/g' lemonldap-ng/lemonldap-ng-conf/* lemonldap-ng/conf/* lemonldap-ng/init/* docker-compose.yml reverse_proxy/conf/proxy.conf  apache-oidc/proto-apache2.conf
```
Exemple: remplacer le domaine credi-ouest.cnamts.fr par actarus.cnqd.cnamts.fr
```
sed -i 's/credi-ouest\.cnamts\.fr/actarus.cnqd.cnamts.fr/g' lemonldap-ng/lemonldap-ng-conf/* lemonldap-ng/conf/* lemonldap-ng/init/* docker-compose.yml reverse_proxy/conf/proxy.conf  apache-oidc/proto-apache2.conf
```
L'url sera http://manager-proto.actarus.cnqd.cnamts.fr apres suppression des images docker et redemarrage

Pour changer manager-proto, se positionner sur le repertoire ***/vagrant/src/proto-connexion-docker*** et lancer la commande en adaptant les parametres: 
```
sed -i 's/[DOMAIN_ORIGINE]/[NOM_NOUVEAU_DOMAIN]/g' lemonldap-ng/lemonldap-ng-conf/* lemonldap-ng/conf/* lemonldap-ng/init/* docker-compose.yml reverse_proxy/conf/proxy.conf apache-oidc/proto-apache2.conf
```
Exemple: remplacer le domaine manager-proto par manager
```
sed -i 's/-proto\.actarus\.cnqd\.cnamts\.fr/.actarus.cnqd.cnamts.fr/g' lemonldap-ng/lemonldap-ng-conf/* lemonldap-ng/conf/* lemonldap-ng/init/* docker-compose.yml reverse_proxy/conf/proxy.conf apache-oidc/proto-apache2.conf
```
L'url sera http://manager.actarus.cnqd.cnamts.fr apres suppression des images docker et redemarrage