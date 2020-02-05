<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  
    <body onload="initialize()">
    <script>
    var geocoder;
    var map;
    function initialize() {
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(37.5325896, 126.9900429);
      var mapOptions = {
        zoom: 11,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map'), mapOptions);
    } // 맵 리로딩 하는 펑션

    
    $('.m2 option').click(function codeAddress() {
      var address = document.getElementById('address').value;
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == 'OK') {
          map.setCenter(results.geometry.location);
          alert(results.geometry.location);
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    });
    </script>
  
   <div id="map" style="width: 800px; height: 500px;"></div>
    <div>
      <input id="address" type="textbox" value="서울특별시">
      
      <input type="button" value="Encode" onclick="codeAddress()">
    </div>
  </body>
  
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438"
    async defer></script>
    
  </body>
</html>