<!DOCTYPE html>
<html>
<head>
	<title><lang en="Authentication portal" fr="Portail d'authentification"/></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		
	<link href="<TMPL_VAR NAME='SKIN_PATH'>/cnamts/images/favicon.ico" rel="icon" type="image/x-icon" sizes="16x16 32x32 48x48 64x64 128x128" />
	<!--[if IE]><link href="<TMPL_VAR NAME='SKIN_PATH'>/cnamts/images/favicon.ico" rel="shortcut icon" type="image/x-icon" sizes="16x16 32x32 48x48 64x64 128x128" /><![endif]-->
	
    <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/css/bootstrap.min.css?v=${-version}">
    <link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/css/bootstrap-theme.min.css?v=${-version}">
	<link rel="stylesheet" type="text/css" href="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/css/connexion.min.css?v=${-version}" />
	
	<TMPL_IF NAME="PROVIDERURI">
	<link rel="openid.server" href="<TMPL_VAR NAME='PROVIDERURI'>" />
	<link rel="openid2.provider" href="<TMPL_VAR NAME='PROVIDERURI'>" />
	</TMPL_IF>

	<TMPL_INCLUDE NAME="../common/script.tpl">
	<script type="text/javascript" src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/js/bootstrap.min.js?v=${-version}"></script>
	<script type="text/javascript">
		// FF 34 et inférieur
		// IE 8 et inférieur
		// Chrome 40 et inférieur
		// Safari 6 et inférieur ne sont pas supportés
		var UNSUPPORTED_USER_AGENTS_REGEX = /(Firefox\/3[0-4])|(Firefox\/[1-2][0-9])|(MSIE [2-8])|(Chrome\/40)|(Chrome\/[1-3][0-9])|(AppleWebKit\/5[0-9][0-9].*Version\/5\.)/ig;
		function checkUserAgentSupport() {
			if (UNSUPPORTED_USER_AGENTS_REGEX.test(navigator.userAgent)) {
				$("#displayForm").hide();
				$("#unsupportedBrower").modal({
				  backdrop: 'static',
				  keyboard: true
				});
			}
		}
	</script>
</head>
<body onload="checkUserAgentSupport()">

	<div class="wrapper">

	<header class="header">
		<hr class="initialhr">
		<div class="logoCNAM"></div>
	</header>
	
	<div id="unsupportedBrower" class="modal" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Attention</h2>
				</div>
				<div class="modal-body">
					<article>
						<h1>Navigateur non supporté détecté</h1>
						<p>Votre navigateur Internet n'est pas supporté. Utilisez les liens ci-dessous pour mettre à jour votre navigateur.</p>
						<div class="fl">
							<a href="https://www.mozilla.org/fr/firefox/new/"><img src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/logo_firefox.png" alt="Firefox"></a>
							<p class="center2"><a href="https://www.mozilla.org/fr/firefox/new/">Mozilla Firefox</a></p>
						</div>
						<div class="fl">
							<a href="https://www.google.fr/chrome/browser/desktop/"><img src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/logo_chrome.png" alt="Chrome"></a>
							<p class="center2"><a href="https://www.google.fr/chrome/browser/desktop/">Google Chrome</a></p>
						</div>
						<div class="fl">
							<a href="https://www.microsoft.com/fr-fr/download/internet-explorer-11-for-windows-7-details.aspx"><img src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/logo_ie11.png" alt="IE11"></a>
							<p class="center2"><a href="https://www.microsoft.com/fr-fr/download/internet-explorer-11-for-windows-7-details.aspx">Internet Explorer 11</a></p>
						</div>
						<div class="fl">
							<a href="http://www.apple.com/fr/safari/"><img src="<TMPL_VAR NAME='SKIN_PATH'>/<TMPL_VAR NAME='SKIN'>/images/logo_safari.png" alt="Safari"></a>
							<p class="center2"><a href="http://www.apple.com/fr/safari/">Apple Safari</a></p>
						</div>
						<div class="cb"></div>
						<h1>Grille de compatibilité</h1>
						<p>Pour accéder à votre nouvel espace « Paiements », la grille de compatibilité des navigateurs est la suivante :</p>
						<table>
							<tbody>
								<tr>
									<th>Navigateur</th><th>À partir de la version</th>
								</tr>
								<tr>
									<td>Mozilla Firefox</td><td class="center">35</td>
								</tr>
								<tr>
									<td>Google Chrome</td><td class="center">41</td>
								</tr>
								<tr>
									<td>Microsoft Internet Explorer</td><td class="center">9</td>
								</tr>
								<tr>
									<td>Apple Safari</td><td class="center">6</td>
								</tr>
							</tbody>
						</table>
						<h1>Espace Pro</h1>
						<p>À défaut, vous pouvez toujours continuer d'utiliser le site <a href="{{ lemonldap.espace_pro_url }}/PortailPS/appmanager/portailps/professionnelsante">« Espace Pro »</a></p>
						<h1>Support technique</h1>
						<TMPL_INCLUDE NAME="hotline.tpl">
					</article>
				</div>
			</div>
		</div>
	</div>
    
    

	
	<div id="modal" class="modal fade" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-close-button-wrapper">
						<div class="modal-close-button" title="Fermer" data-dismiss="modal"></div>
					</div>
					<h2 class="modal-title" id="title">(Titre)</h2>
				</div>
				<div class="modal-body">
					<article id="art">(Contenu)</article>
				</div>
				<div class="modal-footer">
					<button class="modal-close-button" type="button" data-dismiss="modal">Fermer</button>
				</div>
			</div>
		</div>
	</div>
    
    <script type="text/javascript">
	$('#modal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		$('#title').html(button.data('title'));
		$('#art').html(button.data('aide'));
	});
    </script>
