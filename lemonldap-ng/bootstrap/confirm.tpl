<TMPL_INCLUDE NAME="header.tpl">

<main class="mainHeader">

<div class="col-sm-8 col-sm-offset-2 col-lg-4 col-lg-offset-4">

	<p class="ps">Professionnels de santé</p>

	<form id="form" action="#" method="<TMPL_VAR NAME='FORM_METHOD'>" role="form">

		<TMPL_VAR NAME="HIDDEN_INPUTS">
		<TMPL_IF NAME="AUTH_URL">
		  <input type="hidden" name="url" value="<TMPL_VAR NAME='AUTH_URL'>" />
		</TMPL_IF>
		<TMPL_IF NAME="CHOICE_VALUE">
		  <input type="hidden" id="authKey" name="<TMPL_VAR NAME='CHOICE_PARAM'>" value="<TMPL_VAR NAME='CHOICE_VALUE'>" />
		</TMPL_IF>
		<TMPL_IF NAME="CONFIRMKEY">
		  <input type="hidden" id="confirm" name="confirm" value="<TMPL_VAR NAME='CONFIRMKEY'>" />
		</TMPL_IF>

		<div class="col-sm-12 encartConnexion">
			<h1 class="col-sm-12 col-md-12 cv">Déconnexion</h1>
			<img class="imgCentree" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/ico_connect.svg" alt="Déconnexion" >
			
			<TMPL_VAR NAME="MSG">

			<TMPL_IF NAME="LIST">

			<input type="hidden" id="idp" name="idp"/>

			  <!--<div class="row">-->
			  <TMPL_LOOP NAME="LIST">
				<!--<div class="col-sm-6 <TMPL_VAR NAME="class">">
				  <button type="submit" class="btn btn-info" onclick="$('#idp').val('<TMPL_VAR NAME="VAL">')">-->
				  <TMPL_IF NAME="icon">
					<!--<img src="<TMPL_VAR NAME="icon">" class="glyphicon" />-->
				  <TMPL_ELSE>
					<!--<i class="glyphicon glyphicon-chevron-right"></i>-->
				  </TMPL_IF>
					<TMPL_VAR NAME="NAME">
				  <!--</button>
				</div>-->
			  </TMPL_LOOP>
			  <!--</div>-->

		  <TMPL_IF NAME="REMEMBER">
		  <div class="checkbox">
			<label for="remember">
			  <input type="checkbox" id="remember" name="cookie_type" value="1">
			  <lang en="Remember my choice" fr="Se souvenir de mon choix"/>
			</label>
		  </div>
		  </TMPL_IF>

		  <TMPL_ELSE>

			  <div class="col-sm-10 col-sm-offset-1" style="padding-top: 1.5rem">
				<button type="submit" class="col-sm-5 col-md-5 goPortail">
				  <span class="glyphicon glyphicon-ok" style="top: 0.15rem; right: 0.25rem"></span>
				  <lang en="Accept" fr="Accepter" />
				</button>

				<button type="submit" class="col-sm-5 col-sm-offset-2 col-md-5 col-md-offset-2 disconnect" onclick="parent.history.back(); return false;">
				  <span class="glyphicon glyphicon-remove" style="top: 0.15rem; right: 0.25rem"></span>
				  <lang en="Refuse" fr="Refuser" />
				</button>

			  </div>

		  </TMPL_IF>

		</div>

	</form>
	
</div>


</main>

<TMPL_INCLUDE NAME="footer.tpl">
