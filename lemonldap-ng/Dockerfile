FROM coudot/lemonldap-ng

# install Apache OIDC
RUN apt-get update
RUN apt-get -y install vim wget

# install module cnamts LL::NG
COPY moduleCnamts/AuthCnamts.pm /usr/share/perl5/Lemonldap/NG/Portal/AuthCnamts.pm
COPY moduleCnamts/PasswordDBCnamts.pm /usr/share/perl5/Lemonldap/NG/Portal/PasswordDBCnamts.pm
COPY moduleCnamts/UserDBCnamts.pm /usr/share/perl5/Lemonldap/NG/Portal/UserDBCnamts.pm

# declaration module
COPY init/struct.json /var/lib/lemonldap-ng/manager/static/struct.json

# copie le skin PAM dans LL::NG
COPY bootstrap /var/lib/lemonldap-ng/portal/skins/cnamts