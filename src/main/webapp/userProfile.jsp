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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); // HTTP1.0
		response.setHeader("Expires","0"); // Proxies
		if(session.getAttribute("user")!=null){
	%>
			Hello, <% Users u = (Users)session.getAttribute("user"); %> <%= u.getName() %>!
			<img id="myImg" src="<%=(u.getImgpath() != null) ? u.getImgpath() : "images/img-profile-missing.png" %>" style="border-radius:80%;" height="100" weight="100">
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
			
			<br>
			<form action="/logout">
				<input type="submit" value="logout">
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
			
			
			<div id="userProfiles"></div>
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
					var userSex = "<%=u.getSex()%>";
					var userInterestedin = "<%=u.getInterestedin()%>";
					
					var potentialPartersSex = (userInterestedin == "Women") ? "F" : ((userInterestedin == "Men") ? "M" : "errorParterSex");
					var potentialPartersInterests = (userSex == "F") ? "Women" : ((userSex == "M") ? "Men" : "errorParterInterets");
					var url = "find/"+userCountry+"&"+potentialPartersSex+"&"+potentialPartersInterests;
					$.get(url,function(data){
							//for(i=0; i<data.length; ++i){
								//alert(data[i].email + " " + data[i].name);
							//}
							var profileUsers = "<table>";
							var i=0;
							var j=i;
							while( i<data.length ){
								var currentUserId = <%=u.getId()%>;
								if( data[i].id == currentUserId ){
									j=i;
									++i;
									continue;
								}
								if( j%3==0 ){
									profileUsers += "<tr>";
								}
								
								profileUsers += "<td><img src='"+data[i].imgpath+"' height='100' weight='100'><br>"
												+data[i].name+" "+data[i].lastname+"<br>"
												+data[i].country+" "+data[i].city_state
												+"<br><center><button onclick='likeDislike("+i+","+data[i].id+","+currentUserId
												+")' id='likeBtn"+i+"'></button></center></td>";
								if( (j+1)%3==0 ){
									profileUsers += "</tr>";
								}
								++j;
								++i;
							}
							profileUsers += "</table>";							
							$("#userProfiles").html(profileUsers);
							
							/* show which users are already liked */
							var checkLikeUrl = "checklikes/" + <%=u.getId()%>;// + "&" + data[i].id;
							$.get(checkLikeUrl, function(checkLikeData){
								console.log(checkLikeData);
								for(i=0; i<data.length; ++i){
									//console.log(data[i].id);
									console.log("inArr "+i+": "+$.inArray(data[i].id, checkLikeData));
									if( $.inArray(data[i].id, checkLikeData)==-1 ){
										$("#likeBtn"+i).text("Like");
									}else{
										$("#likeBtn"+i).text("Liked");
									}						
								}
							});
						}
					);	
				}
			</script>
			<script>				
				function likeDislike(i_id, plikedUserId, puserId)
				{
					var newLikeData = JSON.stringify(
			    		{
			    			liked_user_id : plikedUserId,
			    			user_id : puserId
			    		}
			    	);
				    var elem = document.getElementById("likeBtn"+i_id);
				    if ( elem.innerHTML == "Like" ) {
				    	elem.innerHTML = "Liked";
				    	// insert likedUserId and userId in 'Liketable' table
				    	//alert("Inainte de post: "+newLikeData);
				    	$.ajax('/addLike', {
							type: 'POST',
							contentType: 'application/json',
							data: newLikeData,
							success: function(data, textStatus, jqXHR ){
								//alert(" sent " +data + ", status: "+textStatus);
							},
							error: function(jqXhr, textStatus, errorMessage){
								//console.log(jqXhr);
								//alert("idk: "+errorMessage + " , textStatus: " + textStatus + " , jqXhr: "+jqXhr);
							}
						});
				    }else {
				    	elem.innerHTML = "Like";
				    	$.ajax('/deleteLike', {
							type: 'DELETE',
							contentType: 'application/json',
							data: newLikeData,
							success: function(data, textStatus, jqXHR ){
								//alert(" sent " +data + ", status: "+textStatus);
							},
							error: function(jqXhr, textStatus, errorMessage){
								console.log(jqXhr);
								//alert("idk: "+errorMessage + " , textStatus: " + textStatus + " , jqXhr: "+jqXhr);
							}
						});
				    }
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