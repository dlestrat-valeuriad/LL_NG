## @file
# Cnamts userDB mechanism

## @class
# Cnamts userDB mechanism class
package Lemonldap::NG::Portal::UserDBCnamts;

use strict;
use warnings;
use Data::Dumper;
use Lemonldap::NG::Portal::Simple;
use JSON qw / encode_json decode_json / ;

our $VERSION = '1.4.0';

## @apmethod int userDBInit()
# Check AuthCnamts use
# @return Lemonldap::NG::Portal constant
sub userDBInit {
	my $self = shift;

	if ( $self->get_module('auth') =~ /^Cnamts/ ) {
		return PE_OK;
	} else {
		$self->lmLog("Use UserDBCnamts only with AuthCnamts", 'error');
		return PE_ERROR;
	}

	PE_OK;
}

##  @apmethod int getUser()
# Check known accounts
# @return Lemonldap::NG::Portal constant
sub getUser {
	my $self = shift;
	
	# recuperation des données et set dans _cnamtsAccounts
	#my $url = 'http://172.22.183.87:5080/RESTfulExample/rest/postgre/userInfo';
	#my $url = 'http://tomcat:8080/RESTfulExample/rest/json/userInfo';
	my $url = 'http://tomcat:8080/RESTfulExample/rest/postgre/userInfo';
	my $req = HTTP::Request->new(POST => $url);
	$req->header('Content-Type' => 'application/json');
	$req->header('correlationID' => 123);
	
	my $data = {
		identifiant => $self->{user},
		motDePasse => $self->{password}
	};
	my $json = encode_json($data);
	$req->content($json);
	my $ua = LWP::UserAgent->new;
	my $response = $ua->request($req);
	
	if($response->is_success) {
		my $decoded = decode_json($response->content);
		$self->{_cnamtsAccounts} = {"$self->{user}" => $decoded};
	}

	return PE_OK;

}

## @apmethod int setSessionInfo()
# Get sample data
# @return Lemonldap::NG::Portal constant
sub setSessionInfo {
    my $self = shift;
	
	$self->lmLog("exportedVars ------ ".Dumper(\%{ $self->{exportedVars}}), 'info' );
	$self->lmLog("cnamtsExportedVars ------ ".Dumper(\%{ $self->{cnamtsExportedVars}}), 'info' );
	
	my %vars = ( %{ $self->{exportedVars} }, %{ $self->{cnamtsExportedVars} } );
	while ( my ( $k, $v ) = each %vars ) {
		$self->{sessionInfo}->{$k} = $self->{_cnamtsAccounts}->{ $self->{user} }->{$v} || "";
	}

	PE_OK;
}

## @apmethod int setGroups()
# Do nothing
# @return Lemonldap::NG::Portal constant
sub setGroups {
	PE_OK;
}

1;
