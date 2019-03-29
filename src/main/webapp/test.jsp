<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Test<br><br>
	
	<input type="text" id="name" />
	<input type="button" onclick="getSmth()" value="ok" />
	
	<script>
		function getSmth(){
			
			var sendData = $('#name').val();
			//alert("before: "+sendData);
			$.ajax('/updateSmth', {
				type: 'PUT',
				dataType: 'text',
				data: sendData,
				success: function(data){
					alert(sendData+" sent " +data);
				},
				error: function(jqXhr, textStatus, errorMessage){
					alert("wtf: "+errorMessage)
				}
			});
		}
	</script>
	
	<script src="vendor/jquery/jquery.min.js"></script>
</body>
</html>