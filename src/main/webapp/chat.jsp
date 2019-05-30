<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
	
</style>

<link rel="stylesheet" href="css/chatStyle.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="vendor/jquery/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ page import="com.tinder.demo.Users" %>
	<div class="row">
	    <div id="chatUsers" class="col-sm-2" >
	    	
	    </div>
	    <div id="chat" class="col-sm-10" style="background-color:lavenderblush;">
	    	
	    	
	    	
	    </div>
	</div>
	
	<% // HUINEAUA ASTA TREBU STEARSA!!!!!!!!!! IT'S ONLY FOR TESTING PURPOSE
		//Users u = new Users();
		//u.setId(52);
		//session.setAttribute("user",u);
	%>
	<script>
		$( document ).ready(function() {			
			$.ajax({
			    url: "/getFriends/"+<%=((Users)session.getAttribute("user")).getId()%>,
			    type: 'GET',
			    success: function(friendsData){
			    	var friendUsers = "<ul style='list-style-type:none;'>";
			    	//console.log(friendsData);
					for(i=0; i<friendsData.length; ++i){
						friendUsers += "<li class='friends' id='li"+i+
							"' style='background-color:lavender;'"+
							"onMouseOver=\"this.style.color='#F8F8F8'\" onMouseOut=\"this.style.color='#000'\"" +
							"onclick=\"showChat(this,"+friendsData[i].id+")\">"+ friendsData[i].name +"</li>";
					}
					//console.log(friendUsers);
					friendUsers+="</ul>";
					$("#chatUsers").html(friendUsers);
				},
			    error: function(jqXhr, textStatus, errorMessage) {
			        alert(errorMessage + " status: " + textStatus); //or whatever
			        console.log(jqXhr);
			    }
			});
		});
		
		var currentIdInMessagesTable;
		function showChat(elem, chatPartnerId){
		currentIdInMessagesTable = 0;
			$(".friends").css("background-color","#0F0");
			elem.style.backgroundColor = "#F00";
			var chatbox = "<div class='container'>"
			  +"<div class='chat-container'>"
			    +"<div class='message' id=" + chatPartnerId + " style='display:none'>"
			      +"<img class='avatar' src='https://placeimg.com/50/50/people?1'>"
			      +"<div class='datetime'>23/03/2016 20:40</div>"
			      +"<p class="+ <%= ((Users)session.getAttribute("user")).getId() %> +">A bitch text</p>"
			    +"</div>"
			  +"</div>"
			 // +"<div class='send-message-form'>"
			    +"<input type='text' placeholder='Your message'>"
			    +"<button onclick=\"showMessages("+chatPartnerId+")\">Send</button>"
			//	+"</div>"
			  +"</div>";
			$("#chat").html(chatbox);
			
			/*
				Se va introduce in chatbox ultimele 50 de mesaje, gasite in baza de date.
			*/
			getChatPartnerMessages(chatPartnerId); // ar trebui si chatPartnerImg
		}
		
		/* Trebuie si o fcti setInterval care verifica daca apar mesaje noi in DB */
		
		function showMessages(chatPartnerId) {
			//console.log(chatPartnerId);
			var messageText = $('input').val();
			var profileImage = '<%=((Users)session.getAttribute("user")).getImgpath()%>';
			var currentTime = getCurrentTime();
			/* 
				LA DATE A MESAJULUI AS PUNE STRING IN BAZA DE DATE ANUME MILLISECONDS, 
				daca acest comment inca exista inseamna ca inca nu am facut asta
			 */
			appendMessage(messageText, profileImage, currentTime, true );
		    $('input').val('');
		    
		    /* Insert the new message into DB */
		    //insertMessageIntoDB();
		    var userId = <%= ((Users)session.getAttribute("user")).getId() %>;
    		var newMessageData = JSON.stringify(
	    		{
	    			created : currentTime,
	    			id_user : userId,
	    			dest_user_id : chatPartnerId,
	    			message_body : messageText
	    		}
	    	);
			$.ajax('/addMessage', {
				type: 'POST',
				contentType: 'application/json',
				data: newMessageData,
				success: function(data, textStatus, jqXHR ){
					//alert(" sent " +data + ", status: "+textStatus);
				},
				error: function(jqXhr, textStatus, errorMessage){
					console.log(jqXhr);
					//alert("idk: "+errorMessage + " , textStatus: " + textStatus + " , jqXhr: "+jqXhr);
				}
			});
			
			
			// creeam setIntervalul
			
			
		}
		
		function appendMessage(messageText, profileImage, messageArrivalTime, isUserSender){
			var message = $('.message').first().clone();
			message.removeAttr('id');
			if( isUserSender ){
				message.find('.'+<%= ((Users)session.getAttribute("user")).getId() %>).css("font-weight", "bold");
			}else{
				message.find('.'+<%= ((Users)session.getAttribute("user")).getId() %>).css("font-weight", "normal");
			}
		    message.find('p').text( messageText );
		    message.find('.avatar').attr("src", profileImage);
		    message.find('.avatar').attr("height","50");
		    message.find('.avatar').attr("width","50");
		    message.find('div').text(messageArrivalTime);
		    message.show();
		    message.prependTo('.chat-container');
		}
		
		function getCurrentTime(){
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth() + 1; //January is 0!
			
			var yyyy = today.getFullYear();
			if (dd < 10) {
			  dd = '0' + dd;
			} 
			if (mm < 10) {
			  mm = '0' + mm;
			} 
			var today = today.getHours() + ':' + today.getMinutes() + " " + dd + '/' + mm + '/' + yyyy;
			return today;
		}
		
		
		function getChatPartnerMessages(chatPartnerId){
			var chatPartnerImg = "";
			var url = "/getChatUserImage/"+chatPartnerId;
			$.get(url, function( imgData ){
				chatPartnerImg = imgData; //"images/img-profile-missing.png"
			});
			setInterval(function(){
				/*
				 caut mesajul din tabelul 'privatemessage' unde dest_user_id = session.getAttribute("user")).getId(), 
				 iar id_user = chatPartnerId si id (la mesaj din tabelul 'privatemessage') e mai mare decat currentIdInMessagesTable.
				 Apoi actualizez currentIdInMessagesTable cu ultimul rand primit din query.
				*/
				/* get messages from chatPartnerId */
				if( $('#'+chatPartnerId).length != 0) {
					var url = "getMessages/" + chatPartnerId + "&" + <%=((Users)session.getAttribute("user")).getId()%> + "&" + currentIdInMessagesTable;
					$.get(url, function( messageData ){
						if( !jQuery.isEmptyObject(messageData) ){
							currentIdInMessagesTable = messageData[messageData.length-1].id;
							console.log("curId: "+currentIdInMessagesTable);
							console.log("data: "+messageData);
							for(i=0; i<messageData.length; ++i){
								appendMessage( messageData[i].message_body, chatPartnerImg, messageData[i].created, false );
							}
						}else{
							//console.log("empty object");
						}
					});
				}else{
					console.log("No such id!");
				}
			}, 1000);
		}
	</script>
</body>
</html>