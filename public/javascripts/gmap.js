var YWSID = "-yb90ZjSY4KwDecRo73C3A"; // common required parameter (api key)
var map = null;
var icon = null;
var bounds = null;


var cm_baseIcon = new GIcon();
cm_baseIcon.shadow = "http://www.google.com/mapfiles/shadow50.png";
cm_baseIcon.iconSize = new GSize(20, 34);
cm_baseIcon.shadowSize = new GSize(37, 34);
cm_baseIcon.iconAnchor = new GPoint(9, 34);
cm_baseIcon.infoWindowAnchor = new GPoint(9, 2);
cm_baseIcon.infoShadowAnchor = new GPoint(18, 25);



 function load() {
     map = new GMap2(document.getElementById("map"));
	 map.setCenter(new GLatLng(40.752068, -73.985005),0);
	 bounds = new GLatLngBounds();
	
	 // Yelp thing for later
     //GEvent.addListener(map, "load", function() {updateMap("restaurants");});

	// [EP] hack
	var latlngs = [[40.752068, -73.985005],[40.752621,-73.975480]];
	
	for (var i=0;i<latlngs.length;i++) {
		
		var k = i+1;
		var markerOpts = {};
	    var nIcon = new GIcon(cm_baseIcon);
		nIcon.imageOut = "http://gmaps-samples.googlecode.com/svn/trunk/markers/red/marker" + k + ".png";
	    nIcon.imageOver = "http://gmaps-samples.googlecode.com/svn/trunk/markers/red/marker" + k + ".png";
	    nIcon.image = nIcon.imageOut; 
	    markerOpts.icon = nIcon;
		
	  	point = new GLatLng(latlngs[i][0],latlngs[i][1]);	
		map.addOverlay(new GMarker(point,markerOpts));
		bounds.extend(point);
		
	}
	
	map.setZoom(map.getBoundsZoomLevel(bounds));
	map.zoomOut();
	map.setCenter(bounds.getCenter());
	map.addControl(new GSmallMapControl());

     // map.setMapType(G_HYBRID_MAP);

     // if (window.attachEvent) window.attachEvent("onresize", function() { map.checkResize()} );
     // else if (window.addEventListener) window.addEventListener("resize", function() { map.checkResize()}, false);

     // icon = new GIcon();
     // icon.image = "images/icons/marker_star.png";
     // icon.shadow = "images/icons/marker_shadow.png";
     // icon.iconSize = new GSize(20, 29);
     // icon.shadowSize = new GSize(38, 29);
     // icon.iconAnchor = new GPoint(15, 29);
     // icon.infoWindowAnchor = new GPoint(15, 3);
 }




// Yelp stuff below

 /*
  * Construct the URL to call for the API request
  */
 function constructYelpURL(term) {
     var mapBounds = map.getBounds();
     var URL = "http://api.yelp.com/" +
         "business_review_search?"+
         "callback=" + "handleResults" +
         "&term=" + term +
         "&num_biz_requested=20" +
         "&tl_lat=" + mapBounds.getSouthWest().lat() +
         "&tl_long=" + mapBounds.getSouthWest().lng() +
         "&br_lat=" + mapBounds.getNorthEast().lat() +
         "&br_long=" + mapBounds.getNorthEast().lng() +
         "&ywsid=" + YWSID;
     return encodeURI(URL);
 }

 /*
  * Called on the form submission: updates the map by
  * placing markers on it at the appropriate places
  */
 function updateMap(term) {
     // turn on spinner animation
     //document.getElementById("spinner").style.visibility = 'visible';

     var yelpRequestURL = constructYelpURL(term);

     /* clear existing markers */
     map.clearOverlays();


     /* add the center marker */

     var marker = new GMarker(homelatlng);
      map.addOverlay(marker);

     /* do the api request */
     var script = document.createElement('script');
     script.src = yelpRequestURL;
     script.type = 'text/javascript';
     var head = document.getElementsByTagName('head').item(0);
     head.appendChild(script);
     return false;
 }

 /*
  * If a sucessful API response is received, place
  * markers on the map.  If not, display an error.
  */
 function handleResults(data) {
     // turn off spinner animation
     //document.getElementById("spinner").style.visibility = 'hidden';

     if(data.message.text == "OK") {
         if (data.businesses.length == 0) {
             alert("Error: No businesses were found near that location");
             return;
         }
         for(var i=0; i<data.businesses.length; i++) {
             biz = data.businesses[i];
             createMarker(biz, new GLatLng(biz.latitude, biz.longitude), i);
         }
     }
     else {
         alert("Error: " + data.message.text);
     }
 }

 /*
  * Formats and returns the Info Window HTML
  * (displayed in a balloon when a marker is clicked)
  */
 function generateInfoWindowHtml(biz) {
     var text = '<div id="marker" class="marker">';

     // image and rating
     //text += '<img class="businessimage" src="'+biz.photo_url+'"/>';

     // div start
     text += '<div class="businessinfo">';

     // name/url
     text += '<a href="'+biz.url+'" target="_blank">'+biz.name+'</a> - '+formatCategories(biz.categories);
         // address
     text += biz.address1 + '<br/>';
     // address2
     if(biz.address2.length)
         text += biz.address2; // + '<br/>';

		// stars
     text += '<br/><img class="ratingsimage" src="'+biz.rating_img_url_small+'"/>';

		 // reviews
	    text += ' ' + biz.review_count + '&nbsp;reviews';

     text += '</div></div>'
     return text;
 }

 /*
  * Formats the categories HTML
  */
 function formatCategories(cats) {
     var s = '';
     for(var i=0; i<cats.length; i++) {
         s+= cats[i].name;
         if(i != cats.length-1) s += ', ';
     }
     s += '<br/>';
     return s;
 }

 /*
  * Formats the neighborhoods HTML
  */
 function formatNeighborhoods(neighborhoods) {
     s = 'Neighborhoods: ';
     for(var i=0; i<neighborhoods.length; i++) {
         s += '<a href="' + neighborhoods[i].url + '" target="_blank">' + neighborhoods[i].name + '</a>';
         if (i != neighborhoods.length-1) s += ', ';
     }
     s += '<br/>';
     return s;
 }

 /*
  * Formats the phone number HTML
  */
 function formatPhoneNumber(num) {
     if(num.length != 10) return '';
     return '(' + num.slice(0,3) + ') ' + num.slice(3,6) + '-' + num.slice(6,10) + '<br/>';
 }

 /*
  * Creates a marker for the given business and point
  */
 function createMarker(biz, point, markerNum) {
     var infoWindowHtml = generateInfoWindowHtml(biz)
     var marker = new GMarker(point, icon);
     map.addOverlay(marker);
     GEvent.addListener(marker, "click", function() {
         marker.openInfoWindowHtml(infoWindowHtml, {maxWidth:"100px"});
     });
     // automatically open first marker
     //if (markerNum == 0)    marker.openInfoWindowHtml(infoWindowHtml, {maxWidth:400});
 }

load();
