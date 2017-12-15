<TMPL_INCLUDE NAME="header.tpl">

<main class="mainHeader">

	<TMPL_IF NAME="DISPLAY_OPENID_FORM">
	<div class="panel panel-default">
		<form action="#" method="post" class="login" role="form">
			<!-- Hidden fields -->
			<TMPL_VAR NAME="HIDDEN_INPUTS">
			<input type="hidden" name="url" value="<TMPL_VAR NAME='AUTH_URL'>" />
			<input type="hidden" name="timezone" />
			<TMPL_INCLUDE NAME="openidform.tpl">
		</form>
	</div>
	</TMPL_IF>

	<TMPL_IF NAME="DISPLAY_LOGO_FORM">
	<div class="panel panel-default">
		<form action="#" method="post" class="login <TMPL_VAR NAME="module">" role="form">
			<!-- Hidden fields -->
			<TMPL_VAR NAME="HIDDEN_INPUTS">
			<input type="hidden" name="url" value="<TMPL_VAR NAME='AUTH_URL'>" />
			<input type="hidden" name="timezone" />

			<div class="form">
				<TMPL_IF NAME="module">
				<img src="<TMPL_VAR NAME='SKIN_PATH'>/common/<TMPL_VAR NAME='module'>.png" alt="<TMPL_VAR NAME='module'>" class="img-thumbnail" />
				</TMPL_IF>

				<div class="buttons">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-log-in"></span>&nbsp;
						<lang en="Connect" fr="Se connecter" />
					</button>
				</div>
			</div>
		</form>
	</div>
	</TMPL_IF>

	<TMPL_IF NAME="DISPLAY_PASSWORD">
	<div id="password" class="panel panel-default">
		<TMPL_INCLUDE NAME="password.tpl">
	</div>
	</TMPL_IF>

	<TMPL_IF NAME="LOGIN_INFO">
	<div class="alert alert-info">
		<TMPL_VAR NAME="LOGIN_INFO">
	</div>
	</TMPL_IF>

<!-- 	Nous ne voulons pas afficher le lien "aller au portail" sur la page de connexion -->
<!-- 	<TMPL_IF NAME="PORTAL_URL"> -->
<!-- 	<div id="logout"> -->
<!-- 		<div class="buttons"> -->
<!-- 			<TMPL_IF NAME="MSG"><TMPL_VAR NAME="MSG"></TMPL_IF> -->
<!-- 			<a href="<TMPL_VAR NAME="PORTAL_URL">" class="btn btn-primary" role="button"> -->
<!-- 				<span class="glyphicon glyphicon-home"></span>&nbsp; -->
<!-- 				<lang en="Go to portal" fr="Aller au portail" /> -->
<!-- 			</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	</TMPL_IF> -->

	<TMPL_IF NAME="LOGOUT_URL">
	<div id="logout">
		<div class="buttons">
			<a href="<TMPL_VAR NAME='LOGOUT_URL'>" class="btn btn-danger" role="button">
				<span class="glyphicon glyphicon-log-out"></span>&nbps;
				<lang en="Logout" fr="Se d&eacute;connecter"/>
			</a>
		</div>
	</div>
	</TMPL_IF>
  
	<div id="displayForm" class="col-sm-8 col-sm-offset-2 col-lg-4 col-lg-offset-4">

		<p class="ps">Professionnels de santé</p>

		<TMPL_IF NAME="LOGOUT_URL_PARAM">
			<!-- Affichage déconnexion -->
			<div class="col-sm-12 encartConnexion">
				<h1 class="col-sm-12 col-md-12 cv">Déconnexion</h1>
				<img class="imgCentree" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/ico_connect.svg" alt="Déconnexion">
					<div class="col-xs-10 col-xs-offset-1" style="padding-top: 1.5rem;">
					<p class="col-sm-12 col-md-12">Votre déconnexion est prise en compte</p>
				</div>
			</div>
		<TMPL_ELSE>
			<TMPL_IF NAME="PE_SESSIONEXPIRED">
				<!-- Affichage session expirée -->
				<div class="col-sm-12 encartConnexion">
					<h1 class="col-sm-12 col-md-12 cv">Session expirée</h1>
					<img class="imgCentree" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/ico_connect.svg" alt="Déconnexion">
					<div class="col-xs-10 col-xs-offset-1" style="padding-top: 1.5rem;">
						<p class="col-sm-12 col-md-12"><TMPL_VAR NAME="AUTH_ERROR"></p>
					</div>
				</div>
			<TMPL_ELSE>
				<TMPL_IF NAME="DISPLAY_FORM">
					<form name="connexionForm" class="form-horizontal" method="POST" action="">
					  
						<TMPL_VAR NAME="HIDDEN_INPUTS">
						<input type="hidden" name="url" value="<TMPL_VAR NAME='AUTH_URL'>" />
						<input type="hidden" name="timezone" />
				
						<div class="col-sm-12 encartConnexion">
							<h1 class="col-sm-12 col-md-12 cv">Connectez-vous !</h1>
							<img class="imgCentree" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/ico_connect.svg" alt="Connectez-vous !" >
							<article class="col-sm-12 col-md-12 infosSaisie">Renseignez les champs suivants :</article>
				
							<!-- champ login -->
							<div class="form-group row">
								<div class="col-xs-9 col-xs-offset-1">
									<input class="form-control input-sm up" name="user" oninput="setCustomValidity('')" oninvalid="setCustomValidity('Le numéro d\'Assurance Maladie est obligatoire')" type="text" maxlength="50" value="<TMPL_VAR NAME='LOGIN'>" placeholder="N° d'Assurance Maladie" required />
								</div>
								<div class="col-xs-1 col-sm-1">
									<div class="boutonAide" data-toggle="modal" data-target="#modal" data-title="Aide" data-aide="Numéro d'Assurance Maladie du lieu d’exercice ou de la structure (FINESS géographique).">?</div>
								</div>
							</div>
				
							<!-- champ password -->
							<div class="form-group row">
								<div class="col-xs-9 col-xs-offset-1">
									<input class="form-control input-sm" name="password" oninput="setCustomValidity('')"  oninvalid="setCustomValidity('Le code d\'accès est obligatoire')" type="password" maxlength="13" placeholder="Code d&apos;accès" required />
								</div>
								<div class="col-xs-1">
									<div class="boutonAide" data-toggle="modal" data-target="#modal" data-title="Aide" data-aide="Soyez attentif à la casse des caractères (majuscules / minuscules). Une succession de saisies erronées peut bloquer le compte.">?</div>
								</div>
							</div>
							<div class="mdpOublie row">
								<div class="col-xs-6 col-xs-offset-3">
									<a href="{{ lemonldap.espace_pro_url }}/PortailPS/appmanager/portailps/professionnelsante?_nfpb=true&_pageLabel=vp_code_perdu_bloque_page">Inscription / code d'accès oublié</a>
								</div>
								<div class="col-xs-1">
									<div class="boutonAide2" data-toggle="modal" data-target="#modal" data-title="Aide" data-aide="La création du compte et la gestion du code d’accès s'effectuent dans Espace Pro">?</div>
								</div>
							</div>
							<div class="col-xs-10 col-xs-offset-1">
								<TMPL_IF NAME="AUTH_ERROR">
									<p class="col-sm-12 col-md-12 infosConnexion <TMPL_VAR NAME='AUTH_ERROR_TYPE'>"><TMPL_VAR NAME="AUTH_ERROR"></p>
								</TMPL_IF>
							</div>
						</div>
				
						<div class="col-sm-12">
							<input type="submit" value="" class="imgConnexion">
						</div>
					</form>
				</TMPL_IF>
			</TMPL_IF>
		</TMPL_IF>
	</div>

</main>

<TMPL_INCLUDE NAME="footer.tpl">
