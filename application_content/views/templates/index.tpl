{include file="header.tpl"}
 <div class="container jumbotron vertical-center row ">
	<div  class="col-xs-12 col-sm-12 vhFull flex-parent">

		<div  class="col-xs-12  col-sm-8 col-md-4  col-lg-8 flex-child">
			<h1 class="jb">{$dataBack[0]['tituloImagen']}</h1>
            <p class="jp">{$dataBack[0]['textoImagen']}
            <br><br>
            <input class="btn btn-login col-md-3" name="enviar" value="EMPEZAR AHORA" type="submit">
            </p>
		</div>

		<div  class="col-xs-12  col-sm-4 col-md-4  col-lg-4 form-login">
			<div class="frmBox">
				<div class="logo">
					YO CO
				</div>

				<form action="" method="POST" class="frmLogin frm-horizontal" id="formLogin" >
					<div class="col-sm-12" style="margin: 0 auto; float: none;">
						<div id="advice" class="textLarge">{$advice}
							{ci_form_validation field='username' error='true'}
							{ci_form_validation field='password' error='true'}
							{ci_form_validation field='captcha' error='true'}
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center hidden"><br>
						<b style="  color:#666; font-size: 16px; font-weight: 600; letter-spacing: 2px; display: none;">INICIO DE SESIÓN</b>
					</div>

					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center"><br>
						<input style="font-size: 16px;" type="text" name="username" id="username" value="{ci_form_validation field='username'}" class="correo col-lg-offset-2 col-lg-8" placeholder="Correo electrónico"/>

						<br>
						<input style="font-size: 16px;" name="password" class="col-lg-offset-2 col-lg-8" placeholder="Contraseña" id="contrasenia" type="password"><br>
						<div class="hidden">
							<label for="captcha">Texto 'captcha':<br />
							<center><img src="{$raiz}resources/captcha/{$captcha}.jpg" alt="CAPTCHA" class="img-thumbnail">
							</center></label><br/>
							<label for="captcha">Por favor, escriba el texto anterior:<br />
							<input type="text" name="captcha" id="captcha" value="" class="form-control upper"/>
							</label>
							<br>
							<input type="hidden" name="{$token_name}" value="{$token}" >
						</div>
						<center><input name="action" value="INICIAR SESIÓN" class="btn btn-login" type="submit"></center>

					</div>
				</form>

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
						<small><a href="#" class="noUniderLine" style="color: #fff;">¿Ólvidaste tu contraseña?</a></small>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
{literal}
<script type="text/javascript">
	$(document).ready(function(){
		setTimeout(function(){$('#advice').parent('div').hide('slow')},5000)
	});
</script>
{/literal}