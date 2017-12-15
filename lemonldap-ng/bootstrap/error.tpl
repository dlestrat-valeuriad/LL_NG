<TMPL_INCLUDE NAME="header.tpl">

<main class="mainHeader">

<div>
	<div class="col-sm-8 col-sm-offset-2 col-lg-4 col-lg-offset-4">

		<p class="ps">Professionnels de santé</p>
	  
		
		<TMPL_VAR NAME="HIDDEN_INPUTS">
		<input type="hidden" name="url" value="<TMPL_VAR NAME='AUTH_URL'>" />
		<input type="hidden" name="timezone" />

		<div class="col-sm-12 encartConnexion">
			<h1 class="col-sm-12 col-md-12 cv">Un problème est survenu</h1>
			<img class="imgCentree" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/ico_connect.svg" alt="Connectez-vous !" >
		
			<TMPL_IF URL>
			<h3>
				<lang en="You were redirect from " fr="Vous avez été redirigé depuis " />
				<a href="<TMPL_VAR NAME='URL'>"><TMPL_VAR NAME="URL"></a>
			</h3>
			</TMPL_IF>

			<article class="col-sm-12 col-md-12 infosSaisie">
				<TMPL_IF ERROR403>
				<h3>Vous n'avez pas les droits d'acc&egrave;s &agrave; cette application</h3>
				</TMPL_IF>

				<TMPL_IF ERROR500>
				<h3>Une erreur s'est produite sur le serveur</h3>
				</TMPL_IF>

				<TMPL_IF ERROR503>
				<h3>Cette application est en maintenance, merci de réessayer plus tard</h3>
				</TMPL_IF>
			</article>
			
			<div style="padding-top: 1.5rem">
				<form method="POST" class="col-sm-5 col-md-5" action="<TMPL_VAR NAME='PORTAL_URL'>">
					<button type="submit" class="goPortail">
					  <span class="glyphicon glyphicon-ok"></span>Aller au portail
					</button>
				</form>

				<TMPL_IF NAME="LOGOUT_URL">
				<form method="POST" class="col-sm-5 col-sm-offset-2 col-md-5 col-md-offset-2" action="<TMPL_VAR NAME='LOGOUT_URL'>">
				<button type="submit" class="disconnect" onclick="$('#confirm').attr('value','-<TMPL_VAR NAME="CONFIRMKEY">');">
				  <span class="glyphicon glyphicon-remove" style="top: 0.15rem; right: 0.25rem"></span>Se d&eacute;connecter
				</button>
				</form>
				</TMPL_IF>

			  </div>
		</div>
		
	</div>
</div>

</main>

<TMPL_INCLUDE NAME="footer.tpl">
