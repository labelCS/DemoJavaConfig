<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../shared/taglib.jsp"%>

<html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SVA APP demo</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">

<%@ include file="../shared/importCss.jsp"%>
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="<c:url value='/css/pages/heatmap.css'/>" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<style type="text/css">
body {

}
.countInfo {
	width: 120px;
	height: 30px;
	background: rgba(255,255,255,0.6); 
	z-index: 10;
	filter: alpha(opacity = 30);
	opacity: 0.5;
	padding: 0 5px;
	padding-top: 5px;
	border-radius: 10px;
	color:#15A4FA;
	border:1px solid #D6D2D2;
	margin-bottom:10px;
    margin-left: auto;
    margin-right: auto;
}
.legend-area {
	background: #DCFAFF; padding: 10px; outline: black solid 2px; right: 0px; bottom: 0px; line-height: 1em; position: absolute;
}
#min {
	float: left;
}
#max {
	float: right;
}
.tip {
	background: rgba(0, 0, 0, 0.8); padding: 5px; left: 0px; top: 0px; color: white; line-height: 18px; font-size: 14px; display: none; position: absolute;
}
.demo-wrapper {
	position: relative;
}
</style>

<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="page-header-fixed"  style="width:100%;height:100%;background-color: #FFFFFF !important;">
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div>
		<!-- BEGIN PAGE -->
		<div>
			
			<div id="" class="row-fluid" style="margin:0 auto" >
             <!--    <div class="control-group">
                     <label class="control-label" style="width: 60px;float:left;" for=placeSel><spring:message code="store_add_name" /></label>
                       <div class="controls">
                          <select style="width: 206px;height: 15%;float:left;" datatype="*"  nullmsg='<spring:message code="map_store_name" />' name="placeId" id="placeSel" >
                             <option value=""></option>
                          </select>
                       </div>
                </div>
                <div class="control-group"  style="margin-bottom: 0px;">
                     <label class="control-label" style="width: 32px;float:left;margin-top: -9px" for="zSel"><spring:message code="message_table_title_floor" /></label>
                       <div class="controls">
                          <select style="width: 215px;height: 15%;margin-top: -10px" datatype="*"  nullmsg='<spring:message code="all_floor_choose" />' name="floorNo" id="zSel" >
                             <option value=""></option>
                          </select>
                       </div>
                </div>		-->   
			<div>
				<div id="divCon" style="width:5000px;height:100px;margin: auto;">
					<div id="mapContainer" class="demo-wrapper">
						<div id="heatmap" class="heatmap"></div>
						<div id="legend" class="legend-area hide">
							<div  style="width: 100%;">
                				<div id="min" style="background-color: rgba(0,0,255,1);width: 90px;float:left;text-align: center;padding: 4px 0"></div>
                				<div id ="minup" style="background-color: rgba(73,255,0,1);width: 90px;float:left;text-align: center;padding: 4px 0"></div>
                				<div id ="max" style="background-color: rgba(251,255,0,1);width: 90px;float:left;text-align: center;padding: 4px 0"></div>
                				<div id="maxup" style="background-color: rgba(255,40,0,1);width: 100px;float:left;text-align: center;padding: 4px 0"></div>
                			</div>
						</div>						
					</div>
				</div>
		</div>
			</div>

		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER 
	<div class="footer">
		<div class="footer-inner">2015 &copy; SVA Demo V100R001C00 by
			isoftstone.</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="icon-angle-up"></i>
			</span>
		</div>
	</div>-->
	<!-- END FOOTER -->

	<%@ include file="../shared/importJs.jsp"%>
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="<c:url value='/plugins/heatmap.min.js'/>"
		type="text/javascript"></script>
	<script src="<c:url value='/js/app.js'/>" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

	<script type="text/javascript">
		var i18n_info = '<spring:message code="map_info" />';
		var i18n_heatmap_min = '<spring:message code="heatmap_picture_min" />';
		var i18n_heatmap_minup = '<spring:message code="heatmap_picture_minup" />';
		var i18n_heatmap_max = '<spring:message code="heatmap_picture_max" />';
		var i18n_heatmap_maxup = '<spring:message code="heatmap_picture_maxup" />';
		var i18n_heatmap_min1 = '<spring:message code="heatmap_heat_pictrue1" />';
		var i18n_heatmap_minup2 = '<spring:message code="heatmap_heat_pictrue2" />';
		var i18n_heatmap_max3 = '<spring:message code="heatmap_heat_pictrue3" />';
		var i18n_heatmap_maxup4 = '<spring:message code="heatmap_heat_pictrue4" />';
		var i18n_heatmap_maxup3 = '<spring:message code="heatmap_heat_pictrue3up" />';
		var  placeIds,floorNos,floorNo, place, origX, origY, bgImg, scale, coordinate, imgHeight, imgWidth, imgScale, heatmap, timer;
		var pointVal = 1;
		var configObj = {
			container : document.getElementById("heatmap"),
			maxOpacity : .6,
			radius : 20,
			blur : .90,
			backgroundColor : 'rgba(0, 0, 58, 0.1)'
		};
		// we want to display the gradient, so we have to draw it
		var legendCanvas = document.createElement('canvas');
		legendCanvas.width = 100;
		legendCanvas.height = 10;
		var min = document.querySelector('#min');
		var max = document.querySelector('#max');
		var gradientImg = document.querySelector('#gradient');

		var legendCtx = legendCanvas.getContext('2d');
		var gradientCfg = {};

		var demoWrapper = document.querySelector('.demo-wrapper');
		var tooltip = document.querySelector('.tip');
		
		var dataFilter = function(data, xo, yo, scale, width, height, coordinate,
				imgScale) {
			var list = [];
			xo = parseFloat(xo);
			yo = parseFloat(yo);
			scale = parseFloat(scale);
			switch (coordinate){
			case "ul":
				for ( var i in data) {
					var point = {
						x : (data[i].x / 10 * scale + xo * scale) / imgScale+Math.random()/10,
						y : (data[i].y / 10 * scale + yo * scale) / imgScale+Math.random()/10,
						value : 1
					};
					list.push(point);
				}
				break;
			case "ll":
				for ( var i in data) {
					var point = {
						x : (data[i].x / 10 * scale + xo * scale) / imgScale+Math.random()/10,
						y : height - (data[i].y / 10 * scale + yo * scale) / imgScale+Math.random()/10,
						value : 1
					};
					list.push(point);
				}
				break;
			case "ur":
				for ( var i in data) {
					var point = {
						x : width - (data[i].x / 10 * scale + xo * scale) / imgScale+Math.random()/10,
						y : (data[i].y / 10 * scale + yo * scale) / imgScale+Math.random()/10,
						value : 1
					};
					list.push(point);
				}
				break;
			case "lr":
				for ( var i in data) {
					var point = {
						x : width - (data[i].x / 10 * scale + xo * scale) / imgScale+Math.random()/10,
						y : height - (data[i].y / 10 * scale + yo * scale) / imgScale+Math.random()/10,
						value : 1
					};
					list.push(point);
				}
				break;
			}

			return list;
		};
		
		var refreshHeatmapData = function() {
			$.post("/sva/heatmap/api/getData", {
				floorNo:floorNos,times:10
			}, function(data) {
				if (!data.error) {
					if (data.data && data.data.length > 0) {
						// var points = {max:1,data:dataFilter(data)};
						var points = dataFilter(data.data, origX, origY, scale,
								imgWidth, imgHeight, coordinate, imgScale);
						var dataObj = {
							max : pointVal,
							min : 1,
							data : points
						};
						heatmap.setData(dataObj);
						$("#legend").show();
					}else{
						$("#legend").hide();
					}
					$("#count").text(data.data.length);
				}
				timer = setTimeout("refreshHeatmapData();", 4000);
			});
		};
		
		jQuery(document).ready(function() {
			App.init();
			//Heatmap.initHeatmap();
						 function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
			var wids =GetQueryString("width"); 
			document.getElementById("divCon").style.width=wids+'px';
			document.getElementById("divCon").style.height=(wids*0.63)+'px';
            var updateList = function(renderId,data,selectTxt,callback){
                var sortData = data.sort(function(a,b){return a.name - b.name;});
                var len = sortData.length;
                var options = '';
                for(var i=0;i<len;i++){
                    var info = sortData[i];
                    if(selectTxt == info.name){
                        options += '<option class="addoption" selected=true value="'+info.id+'">' + HtmlDecode3(info.name) +'</option>';
                    }else{
                        options += '<option class="addoption" value="'+info.id+'">' + HtmlDecode3(info.name) +'</option>';
                    }
                }
                removeOption(renderId);
                $('#' + renderId).append(options);
                if(callback){
                    callback();
                }
                return;
            };
            var removeOption = function(renderId){
                $('#'+renderId+' .addoption').remove().trigger("liszt:updated");
            };              
            var updateFloorList1 = function(renderId,data,selectTxt,callback){
                $("#zSel").find("option").remove(); 
                var sortData = data.sort(function(a,b){return a.floor - b.floor;});
                var len = sortData.length;
                var options = "<option value=''></option>";
                for(var i=0;i<len;i++){
                    var info = sortData[i];
                    if(selectTxt == sortData[i].floor){
                        options += '<option class="addoption" data-width="'+info.imgWidth+'" data-height="'+info.imgHeight+'"  data-x="'+info.xo+'"data-y="'+info.yo+'" data-path="'+info.path+'" data-scale="'+info.scale+'" data-coordinate ="'+info.coordinate+'" selected=true value="'+sortData[i].floorNo+'">' + sortData[i].floor +'</option>';
                    }else{
                        options += '<option class="addoption" data-width="'+info.imgWidth+'" data-height="'+info.imgHeight+'"  data-x="'+info.xo+'"data-y="'+info.yo+'" data-path="'+info.path+'" data-scale="'+info.scale+'" data-coordinate ="'+info.coordinate+'" value="'+sortData[i].floorNo+'">' + sortData[i].floor +'</option>';
                    }
                }
                removeOption(renderId);
                $('#' + renderId).append(options);
                return;
            };  
			var calImgSize = function(width, height) {
				var newWidth, newHeight, imgScale;
				var divWidth = parseFloat($("#divCon").css("width").slice(0, -2));
				var divHeight = parseFloat($("#divCon").css("height").slice(0, -2));
				
				imgScale = width / divWidth;
				newWidth = divWidth;
				newHeight = height / imgScale;

				if (divWidth / divHeight > width / height) {
					newHeight = divHeight;
					imgScale = height / newHeight;
					newWidth = width / imgScale;
				} else {
					newWidth = divWidth;
					imgScale = width / newWidth;
					newHeight = height / imgScale;
				}

				return [ imgScale, newWidth, newHeight ];
			};
/*
		    var initData = function()
		    { 
             $.get("/sva/store/api/getDataBySample?t="+Math.random(),function(data){
                    if(!data.error){
                    	placeIds = data.data[0].id;
                        updateList("placeSel",data.data,data.data[0].name);
                    }
                    $.post("/sva/heatmap/api/getFloorsByMarket",{placeId:placeIds}, function(data){
                        if(!data.error){
                        	floorNos = data.data[0].floorNo;
                            updateFloorList1("zSel",data.data,data.data[0].id);
                            initHeatmap();
                                       
                        }
                    });
                    
                   
                }); 
             

		    }*/
		    
		     floorNos = '${floorNos}';

			floorNos = GetQueryString("floorNo");
            var initHeatmap = function() {
            	  $("#mapContainer").css("background-image", "");
                  $("#heatmap").empty();
                  $.post("/sva/heatmap/api/getMapInfoByPosition",{floorNo:floorNos}, function(data) {
                             if (!data.error) {
                                 if (data.bg) {
                                     // 全局变量赋值
                                     origX = data.xo;
                                     origY = data.yo;
                                     bgImg = data.bg;
                                     bgImgWidth = data.bgWidth;
                                     bgImgHeight = data.bgHeight;
                                     scale = data.scale;
                                     coordinate = data.coordinate;
                                     floorNo = floorNos;
                                     // 设置背景图片
                                     var bgImgStr = "url(../../upload/" + bgImg + ")";
                                     var imgInfo = calImgSize(bgImgWidth, bgImgHeight);
                                     imgScale = imgInfo[0];
                                     imgWidth = imgInfo[1];
                                     imgHeight = imgInfo[2];
                                     console.log(imgInfo);
                                     $("#mapContainer").css({
                                         "width" : imgWidth + "px",
                                         "height" : imgHeight + "px",
                                         "background-image" : bgImgStr,
                                         "background-size" : imgWidth + "px " + imgHeight + "px",
                                         "margin":"0 auto"
                                     });

                                     configObj.onExtremaChange = function(data) {
                                         updateLegend(data);
                                     };
                                     heatmap = h337.create(configObj);
                                     $.post("/sva/heatmap/api/getData", {
                                         floorNo : floorNo,times:10
                                     }, function(data) {
                                         if (!data.error) {
                                             if (data.data && data.data.length > 0) {
                                                 // var points = {max:1,data:dataFilter(data)};
                                                 var points = dataFilter(data.data, origX,
                                                         origY, scale, imgWidth, imgHeight,
                                                         coordinate, imgInfo[0]);
                                                 var dataObj = {
                                                     max : pointVal,
                                                     min : 1,
                                                     data : points
                                                 };
                                                 heatmap.setData(dataObj);
                                                 $("#legend").show();
                                             }
                                             $(".countInfo").show();
                                             $("#count").text(data.data.length);
                                         }
                                     });
                                     clearTimeout(timer);
                                     timer = setTimeout("refreshHeatmapData();", 4000);
                                     // refreshHeatmapData();
                                 }
                             }
                         });                

            };		    
		    
			/* legend code */
			var updateLegend = function(data) {
				if (data.max==1)
				{
					$("#minup").popover("destroy") ;
					$("#max").popover('destroy') ;
					$("#min").popover('destroy') ;
					$("#maxup").popover('destroy') ;
					$("#max").html(i18n_heatmap_max);
					$("#max").css("color","purple");
					$("#maxup").html(i18n_heatmap_maxup);
					$("#maxup").css("color","purple");
					$("#minup").html(i18n_heatmap_minup);
					$("#minup").css("color","purple");
					$("#min").html(i18n_heatmap_min);
					$("#min").css("color","purple");
					var htmlstrmin3 = '<i style="color:rgba(0,0,255,1);" class="icon-male"></i>'+i18n_heatmap_min1+data.max;
					var option3 = {html:true,trigger:"hover",content:htmlstrmin3,placement:"top"};
					var htmlstrmin2 = '<i style="color:rgba(73,255,0,1);" class="icon-male"></i><i style="color:rgba(73,255,0,1);" class="icon-male"></i>'+i18n_heatmap_minup2+Math.round(((data.max-data.min)/3)+1);
					var option2 = {html:true,trigger:"hover",content:htmlstrmin2,placement:"top"};
					var htmlstrmin = '<i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i>'+i18n_heatmap_maxup4+data.max;
					var htmlstrmin1 = '<i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i>'+i18n_heatmap_maxup3+Math.round(((data.max-data.min)/3)+1);
					var option = {html:true,trigger:"hover",content:htmlstrmin,placement:"top"};
					var option1 = {html:true,trigger:"hover",content:htmlstrmin1,placement:"top"};
					$("#max").popover(option1);
					$("#min").popover(option3);
					$("#maxup").popover(option);
					$("#minup").popover(option2);
				}
				if (data.max==2)
				{
					$("#minup").popover("destroy") ;
					$("#max").popover('destroy') ;
					$("#min").popover('destroy') ;
					$("#maxup").popover('destroy') ;
					$("#max").html(i18n_heatmap_max);
					$("#max").css("color","purple");
					$("#maxup").html(i18n_heatmap_maxup);
					$("#maxup").css("color","purple");
					$("#minup").html(i18n_heatmap_minup);
					$("#minup").css("color","purple");
					$("#min").html(i18n_heatmap_min);
					$("#min").css("color","purple");
					var htmlstrmin3 = '<i style="color:rgba(0,0,255,1);" class="icon-male"></i>'+i18n_heatmap_min1+data.min;
					var option3 = {html:true,trigger:"hover",content:htmlstrmin3,placement:"top"};
					var htmlstrmin2 = '<i style="color:rgba(73,255,0,1);" class="icon-male"></i><i style="color:rgba(73,255,0,1);" class="icon-male"></i>'+i18n_heatmap_minup2+Math.round(((data.max-data.min)/3)+1);
					var option2 = {html:true,trigger:"hover",content:htmlstrmin2,placement:"top"};
					var htmlstrmin = '<i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i>'+i18n_heatmap_maxup4+data.max;
					var htmlstrmin1 = '<i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i>'+i18n_heatmap_max3+Math.round(((data.max-data.min)/3)+1);
					var option = {html:true,trigger:"hover",content:htmlstrmin,placement:"top"};
					var option1 = {html:true,trigger:"hover",content:htmlstrmin1,placement:"top"};
					$("#max").popover(option1);
					$("#min").popover(option3);
					$("#maxup").popover(option);
					$("#minup").popover(option2);
				}
				if (data.max==3)
				{
					$("#minup").popover("destroy") ;
					$("#max").popover('destroy') ;
					$("#min").popover('destroy') ;
					$("#maxup").popover('destroy') ;
					$("#max").html(i18n_heatmap_max);
					$("#max").css("color","purple");
					$("#maxup").html(i18n_heatmap_maxup);
					$("#maxup").css("color","purple");
					$("#minup").html(i18n_heatmap_minup);
					$("#minup").css("color","purple");
					$("#min").html(i18n_heatmap_min);
					$("#min").css("color","purple");
					var htmlstrmin3 = '<i style="color:rgba(0,0,255,1);" class="icon-male"></i>'+i18n_heatmap_min1+data.min;
					var option3 = {html:true,trigger:"hover",content:htmlstrmin3,placement:"top"};
					var htmlstrmin2 = '<i style="color:rgba(73,255,0,1);" class="icon-male"></i><i style="color:rgba(73,255,0,1);" class="icon-male"></i>'+i18n_heatmap_minup2+Math.round(((data.max-data.min)/3)+1);
					var option2 = {html:true,trigger:"hover",content:htmlstrmin2,placement:"top"};
					var htmlstrmin = '<i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i>'+i18n_heatmap_maxup4+data.max;
					var htmlstrmin1 = '<i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i>'+i18n_heatmap_max3+Math.round(((data.max-data.min)/3)*2+1);
					var option = {html:true,trigger:"hover",content:htmlstrmin,placement:"top"};
					var option1 = {html:true,trigger:"hover",content:htmlstrmin1,placement:"top"};
					$("#max").popover(option1);
					$("#min").popover(option3);
					$("#maxup").popover(option);
					$("#minup").popover(option2);
				}
				if (data.max>3) {
					$("#minup").popover("destroy") ;
					$("#max").popover('destroy') ;
					$("#min").popover('destroy') ;
					$("#maxup").popover('destroy') ;
					$("#max").html(i18n_heatmap_max);
					$("#max").css("color","purple");
					$("#maxup").html(i18n_heatmap_maxup);
					$("#maxup").css("color","purple");
					$("#minup").html(i18n_heatmap_minup);
					$("#minup").css("color","purple");
					$("#min").html(i18n_heatmap_min);
					$("#min").css("color","purple");
					var htmlstrmin3 = '<i style="color:rgba(0,0,255,1);" class="icon-male"></i>'+i18n_heatmap_min1+data.min;
					var option3 = {html:true,trigger:"hover",content:htmlstrmin3,placement:"top"};
					var htmlstrmin2 = '<i style="color:rgba(73,255,0,1);" class="icon-male"></i><i style="color:rgba(73,255,0,1);" class="icon-male"></i>'+i18n_heatmap_minup2+Math.round(((data.max-data.min)/3)+1);
					var option2 = {html:true,trigger:"hover",content:htmlstrmin2,placement:"top"};
					var htmlstrmin = '<i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i><i style="color:rgba(255,40,0,1);" class="icon-male"></i>'+i18n_heatmap_maxup4+data.max;
					var htmlstrmin1 = '<i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i><i style="color:rgba(251,255,0,1);" class="icon-male"></i>'+i18n_heatmap_max3+Math.round(((data.max-data.min)/3)*2+1);
					var option = {html:true,trigger:"hover",content:htmlstrmin,placement:"top"};
					var option1 = {html:true,trigger:"hover",content:htmlstrmin1,placement:"top"};
					$("#max").popover(option1);
					$("#min").popover(option3);
					$("#maxup").popover(option);
					$("#minup").popover(option2);
				}
			}
		    
			/* legend code end */

			var updateTooltip = function(x, y, value) {
				// + 15 for distance to cursor
				var transform = 'translate(' + (x + 15) + 'px, ' + (y + 15) + 'px)';
				tooltip.style.MozTransform = transform; /* Firefox */
				tooltip.style.msTransform = transform; /*
														 * IE (9+) - note ms is
														 * lowercase
														 */
				tooltip.style.OTransform = transform; /* Opera */
				tooltip.style.WebkitTransform = transform; /* Safari and Chrome */
				tooltip.style.transform = transform; /* One day, my pretty */
				tooltip.innerHTML = value;
			};
	        /* $("#placeSel").on("change", function(){
	                var placeId = $("#placeSel").val();
	                $.post("/sva/heatmap/api/getFloorsByMarket",{placeId:placeId}, function(data){
	                    if(!data.error){
	                        updateFloorList1("zSel",data.data);
	                    }
	                });
	            }); 
             $("#zSel").on("change", function(){
                 floorNos = $("#zSel").val();
             }); 	         
	        initData();*/
                 initHeatmap();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
</html>