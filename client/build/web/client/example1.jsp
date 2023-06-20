<!--
<head>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
      
</head>
<script>function fetchdata(){
 var request;  
 myfunctionwishlist();
function myfunctionwishlist()  
{  
var url="example2.jsp";  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function () {
                        if (request.readyState == 4) {
                         document.getElementById("def").value = "done";
            toastr.info('Product Added to wishlist');
           
          
                        }
                    };
                    request.open("GET", url, true);
                    request.send();

}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('amit').innerHTML=val;  
}  
}  
}

$(document).ready(function(){
 setTimeout(fetchdata,3000);
 });</script>

<div id="def" >
hi
</div>-->
<head>
<script>
  
var intervalId = window.setInterval(function(){
   myfunction();
            var request;
            var v;
            function myfunction()
            {

               //alert('gun');
                var url = "example2.jsp";

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            
                        
                         var val1 = request.responseText;
                         document.getElementById("mgh").innerHTML = val1;
       
                        }
                    };
                    request.open("GET", url, true);
                    request.send();

                } catch (e) {
                    alert("Unable to connect to server");
                }
            }


        
},1000)
</script>
</head>
<span id="mgh">here</span>
