$.fn.extend({
	onEnter: function(fn) {
		if($.isFunction(fn)){
			this.each(function() {
				$(this).keypress(function(e){
					if(e.which == 13){
						e.preventDefault();
						return fn.call(this,e);
					}
				});
				$(this).bind('onEnter',fn)
			});
		}
		else{
			$(this).trigger('onEnter');
		}
		return this;
	}
});

function obtenerValoresInput(tipo, div){
	if((tipo == undefined)||(div  == undefined)){ return undefined; }
	var res = [];
	var text = [];
	switch(tipo){
		case 'select':
			$("#"+div+" option").each(function(index ){
				res[index] = $(this).val();
				text[index] = $(this).text();
			});
			break;

		case 'checkbox':
		case 'radio':
			$.each($("input[name='"+div+"[]']"), function(index ) {
				res[index] = $(this).val();
			});
			break;
	}
	return res;
}

function abrirHref(link, id)
{
	if (id == undefined)
	{
		id='';
	}else{
		id='/'+id;
	}
	if (link != undefined)
	{
		window.location.href = uri + link + id;
	}
	else
	{
		return undefined;
	}

}

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(haystack[i] == needle) return true;
    }
    return false;
}
function differenceArray(array1, array2){
	var foo = [];
	if ((array1 == undefined)||(array2 == undefined)){ return foo;}
	var i = 0;
	jQuery.grep(array2, function(el) {

    	if (jQuery.inArray(el, array1) == -1) foo.push(el);
    	i++;
	});
	return foo;

}

function initMessages(seccion){
	if(seccion == undefined){seccion = 'PORTADA';}
	$.ajax({
	    url : uri + "ajax/obtenerMensajes",
	    data : {'seccion' : seccion},
		dataType : "json",
		cache: false,
		beforeSend: function(){ },
		success: function(data){
		    	var t = 100;
		    	$.each(data, function(key, index ) {
		    		setTimeout(function(){
						launchMessage(index.tituloMensaje, index.textoMensaje,index.tipoMensaje,index.posicionMensaje );
					}, t)
					t+=600;
				});
		    },
		error: function (){
		 		console.log("ERROR CARGAR MENSAJES");
		    }
	});
}

function launchMessage(titleM, messageM, messageTypeM, positionM){
	if(titleM == undefined){ titleM = 'Titulo';}
	if(messageM == undefined){ messageM = '';}
	if(messageTypeM == undefined){ messageTypeM = '';}
	if(positionM == undefined){ positionM = 'top-right';}
	var imageIcon = '';
	switch(messageTypeM){
		case 'INFO':
			imageIcon = 'info.png';
			break;
		case 'AVISO':
			imageIcon = 'warning_bn.png';
			break;
		case 'SICEEY':
			imageIcon = 'control.png';
			break;
		case 'PLANTILLA':
			imageIcon = 'people.png';
			break;
		case 'E911':
			imageIcon = 'statistics.png';
			break;
		case 'SIGEB':
			imageIcon = 'pedag.png';
			break;
	}

	$.extend($.gritter.options, {
	        position: positionM
		});
	var unique_id = $.gritter.add({
				// (string | mandatory) the heading of the notification
				title: titleM,
				// (string | mandatory) the text inside the notification
				text: messageM,
				// (string | optional) the image to display on the left
				image: uri+'resources/images/'+imageIcon,
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: true,
				// (int | optional) the time you want it to be alive for before fading out
				time: '',
				// (string | optional) the class name you want to apply to that specific message
				class_name: 'gritter-light'
			});
	return false;
}


function obtenerIconoMensaje(tipo){
	if(tipo == undefined){tipo = 'INFO';}
	switch(tipo){
		case 'WARNING':
			icon = uri+'resources/images/warning_bn.png';
			break;
		case 'ERROR':
			icon = uri+'resources/images/error.png';
			break;
		case 'OK':
			icon = uri+'resources/images/success.png';
			break;
		case 'INFO':
		default:
			icon = uri+'resources/images/info.png';
			break;
	}
	var image = '<img src="'+icon+'" alt="'+tipo+'" class="icon24"> ';
	return image;
}

function mensaje(titulo, mensaje, tipo){
	if(titulo == undefined){titulo = '';}
	if(mensaje == undefined){mensaje = '';}
	var image = obtenerIconoMensaje(tipo);
	$("#dialog_aviso .aviso1").html( image + titulo );
	$("#dialog_aviso .aviso2").html( mensaje );
	$( "#dialog_aviso" ).dialog("open");
}
function pregunta(titulo, mensaje, tipo, funcion, args){
	if(titulo == undefined){titulo = '';}
	if(mensaje == undefined){mensaje = '';}
	if(funcion == undefined){ return undefined;}
	var image = obtenerIconoMensaje(tipo);
	$("#dialog_pregunta .pregunta1").html( image + titulo );
	$("#dialog_pregunta .pregunta2").html( mensaje );
	$("#dialog_pregunta").dialog({
		buttons: [{
			text: "Aceptar",
			click: function() {
				window[funcion](args);
				$(this).dialog("close");
			}
		},{
			text: "Cancelar",
			click: function() {
				$(this).dialog("close");
			}
		}]
	});
	$( "#dialog_pregunta" ).dialog("open");
}
function pregunta_input(titulo, mensaje, tipo, input , funcion){
	if(titulo == undefined){titulo = '';}
	if(mensaje == undefined){mensaje = '';}
	if(input == undefined){ return undefined;}
	if(funcion == undefined){ return undefined;}
	var image = obtenerIconoMensaje(tipo);

	$("#dialog_pregunta .pregunta1").html( image + titulo );
	$("#dialog_pregunta .pregunta2").html( mensaje );
	$("#dialog_pregunta").dialog({
		buttons: [{
			text: "Aceptar",
			click: function() {
				var valor = $("#"+input).val();
				if(String(valor) == ''){ window["mensaje"]("Por favor complete los datos solicitados.", "", "WARNING"); return undefined;}
				window[funcion](valor);
				$(this).dialog("close");
			}
		},{
			text: "Cancelar",
			click: function() {
				$(this).dialog("close");
			}
		}]
	});
	$( "#dialog_pregunta" ).dialog("open");
}

function verificarUrl(url){
	if(url == undefined){return false;}
	var res = false;
	var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
 	var regex = new RegExp(expression);
  	if (url.match(regex) ){ res = true; }
   	return res;

}
$( document ).ready(function() {
    $("#loadData").hide();
   	$( "#dialog_aviso" ).dialog({
   		height: 'auto',
		width: 'auto',
		maxWidth: '446px',
		resizable: false,
		draggable: false,
        autoOpen: false,
        modal: true,
        draggable: true,
        buttons: [{
            text: "Cerrar",
            click: function() {
                $( this ).dialog( "close" );
            }
            }],
	        close: function() {
	        	$("#dialog_aviso .aviso1").html('');
	        	$("#dialog_aviso .aviso2").html('');
     	  }
	});

	$( "#dialog_pregunta" ).dialog({
   		height: 'auto',
		width: 'auto',
		maxWidth: '446px',
		fluid: true, //new option
		resizable: false,
		draggable: false,
        autoOpen: false,
        modal: true,
        dialogClass:'estilo_dialog_edit',
        draggable: true,
	        close: function() {
	        	$("#dialog_pregunta .pregunta1").html('');
	        	$("#dialog_pregunta .pregunta2").html('');
     	  }
	});
});
