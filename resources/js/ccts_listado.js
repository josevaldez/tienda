$(document).ready(function(){
	
	var myGrid = $("#tablaCCTListado");
	$("#tablaCCTListado").jqGrid({
		url: uri+'cargar_centros_trabajo',
		postData: {
			"cu_nam3_65rf" : function(){ return ($('#token').val() != "") ? $('#token').val() : "0";}
		},
		datatype: 'json',
		mtype: 'POST',
		colNames: ['Clave CT','Nombre CT','Zona','Status','Turno','Domicilio','Telefono','Correo','Página'],
		colModel: [
			{name:'CLAVECCT', index:'CLAVECCT', width:'100px', search:true, resizable:false, align:"center", sortable:true},
			{name:'NOMBRECT', index:'NOMBRECT', width:'300px', search:true, resizable:false, align:"left", sortable:true},			
			{name:'ZONAESCOLA', index:'ZONAESCOLA', width:'60px', search:true, resizable:false, align:"center", sortable:true},			
			{name:'STATUS', index:'STATUS', width:'60px', search:true,resizable:false, align:"center", sortable:true},
			{name:'TURNO', index:'TURNO', width:'80px', search:true,resizable:false, align:"left", sortable:true},
			{name:'DOMICILLO', index:'DOMICILLO', width:'200px', search:true, resizable:false, align:"left", sortable:true},			
			{name:'TELEFONO', index:'TELEFONO', width:'100px', align:"center", search:true, resizable:true, sortable:true},
			{name:'CORREOELE', index:'CORREOELE', width:'200px', align:"center", search:true, resizable:true, sortable:true},
			{name:'PAGINAWEB', index:'PAGINAWEB', width:'200px', align:"center", search:true, resizable:true, sortable:true}
		],
		shrinkToFit: false,
		height:'400px',
		gridview:true,
		pager: '#paginacion',
		rowNum:15,
		rowList:[15,25,50,100,150,200],
		sortname: 'CLAVECCT',
		sortorder: 'asc',
		viewrecords: true,
		singleSelect:true,
		width: '100%',
		caption: 'Listado de centros de trabajo',
		multiselect: false,
		beforeSelectRow: function(rowid, e)
		{		   
		   $("#tablaCCTListado").jqGrid('resetSelection');
		   return(true);
		} 
	}).navGrid('#paginacion', { view: false, del: false, add: false, edit: false, refresh:true,search:false },
		 {}, //opciones edit
		 {}, //opciones del
		 {}
		);
	$("DIV.ui-pg-div SPAN.ui-icon-refresh").removeClass("ui-icon-refresh").addClass("refresh_btn");
	$("DIV.ui-pg-div SPAN.ui-icon-pencil").removeClass("ui-icon-pencil").addClass("icono_vacio");

	$("#iconoG3").click( function(){
		$("#tableIconos3").toggle();
		return false;
   });
jQuery("#tablaCCTListado").jqGrid('filterToolbar');
	
});