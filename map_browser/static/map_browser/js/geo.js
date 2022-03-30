document.getElementById("test").style.color = '#bb9999'



const acc_token = 'pk.eyJ1Ijoia3ViYWJlZSIsImEiOiJjbDBjcWgxcGMwMXNqM2VwcjUzc2dlemliIn0.CQwI2h7m3UmkQQRDOuyRpg';

ma


function render_map(lon = 19.923113411151434, lat = 50.06458150647729, z=14){
   mapboxgl.accessToken = acc_token;
   return new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/satellite-streets-v10',
      center: [lon, lat],
      zoom: z,
      bearing: 0
   })
}

window.onload = render_map()

function render_map2(){
   let lat = document.getElementById('lat').value
   let lon = document.getElementById('lon').value
   let zoom = document.getElementById('zoom').value
   console.log(lat,lon)
   render_map(lon,lat,zoom)
}



function check_coord(){
   let center = document.getElementById('map')
   console.log(center)
}