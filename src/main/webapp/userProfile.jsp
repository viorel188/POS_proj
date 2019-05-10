<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/modalImageStyle.css">
</head>
<body>
<%@ page import="com.tinder.demo.Users" %>
	<%
		if(session.getAttribute("user")!=null){
	%>
			Hello, <% Users u = (Users)session.getAttribute("user"); %> <%= u.getName() %>!
			<img id="myImg" src="<%=u.getImgpath()%>" alt="images/img-profile-missing.png" style="border-radius:80%;" height="100" weight="100">
			<h2>Hopefully, you'll find your love today! :)</h2>
			
			<!-- The Modal -->
			<div id="myModal" class="modal">
			
			  <!-- The Close Button -->
			  <span class="close">&times;</span>
			
			  <!-- Modal Content (The Image) -->
			  <img class="modal-content" id="img01">
			
			  <!-- Modal Caption (Image Text) -->
			  <div id="caption"></div>
			</div>
			
			<form action="/uploadFiles" method="post" enctype="multipart/form-data">
				<input type="file" name="files" value="Choose profile image"/> <!-- multiple /><br> -->
				<input type="submit" /><br>
			</form>
			
			<br><hr><br>
			
			
			<b>e-mail:</b> <%=u.getEmail()%><br>
			<b>phone nr:</b> <%=u.getPhonenr()%><br>
			<b>Description:</b> <%=u.getDescription()%><br>
			<b>Language:</b> <%=u.getLanguage()%><br>
			<b>Sex:</b> <%=u.getSex()%><br>
			<b>Age:</b> <%=u.getAge()%><br>
			<b>Interested in:</b> <%=u.getInterestedin()%><br>
			<b>Ethnicity:</b> <%=u.getEtnicity()%><br>
			<b>Height:</b> <%=u.getHeight()%><br>
			<b>Weight:</b> <%=u.getWeight()%><br>
			<b>Religion:</b> <%=u.getReligion()%><br>
			<b>Region:</b> <%=u.getRegion()%>, <%=u.getCountry()%>, <%=u.getCity_state()%><br><hr>
			
			
			<button onclick="showUsersFromSameCountry()">Browse your love!</button>
			
			<script>
				// Get the modal
				var modal = document.getElementById('myModal');
				
				// Get the image and insert it inside the modal - use its "alt" text as a caption
				var img = document.getElementById('myImg');
				var modalImg = document.getElementById("img01");
				var captionText = document.getElementById("caption");
				img.onclick = function(){
				  modal.style.display = "block";
				  modalImg.src = this.src;
				  captionText.innerHTML = this.alt;
				}
				
				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];
				
				// When the user clicks on <span> (x), close the modal
				span.onclick = function() { 
				  modal.style.display = "none";
				}
			</script>
			
			<script>
				function showUsersFromSameCountry(){
					var userCountry = "<%=u.getCountry()%>";
					var url = "users/"+userCountry;
					$.get(url,function(data){
							//for(i=0; i<data.length; ++i){
								//alert(data[i].email + " " + data[i].name);
							//}
					
							$.each(data, function(i, user){
								alert(user.name + " " +user.email);
							});
						}	
					);
								
				}
			</script>
			<script src="vendor/jquery/jquery.min.js"></script>
			
	<%
		}else{
			response.sendRedirect("loginup.jsp");
		}
	%>
	
</body>
</html>