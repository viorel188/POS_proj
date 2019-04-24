<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script src="js/city_state.js"></script>
<%@ page import="com.tinder.demo.Users" %>
	<%
		if(session.getAttribute("user")!=null){
	%>
			Hello, <% Users u = (Users)session.getAttribute("user"); %> <%= u.getName() %>
	<%
		}else{
			response.sendRedirect("loginup.jsp");
		}
	%>
	Fill in your missing data!
	Name: <input type="text" id="name" name="name"/><br>
	Lastname: <input type="text" id="lastname" name="lastname"/><br>
	Phone number: <input type="text" id="phonenr" name="phonenr"/><br>
	Profile image:
	<input type="file" name="imgpath" id="imgpath" accept="image/*" /><br>
	Description:
	<textarea rows="10" cols="30" id="description" name="description"></textarea><br>
	Preferred language:
	<select data-placeholder="Choose a Language..." id="language" name="language">
		  <option value="AF">Afrikanns</option>
		  <option value="SQ">Albanian</option>
		  <option value="AR">Arabic</option>
		  <option value="HY">Armenian</option>
		  <option value="EU">Basque</option>
		  <option value="BN">Bengali</option>
		  <option value="BG">Bulgarian</option>
		  <option value="CA">Catalan</option>
		  <option value="KM">Cambodian</option>
		  <option value="ZH">Chinese (Mandarin)</option>
		  <option value="HR">Croation</option>
		  <option value="CS">Czech</option>
		  <option value="DA">Danish</option>
		  <option value="NL">Dutch</option>
		  <option value="EN">English</option>
		  <option value="ET">Estonian</option>
		  <option value="FJ">Fiji</option>
		  <option value="FI">Finnish</option>
		  <option value="FR">French</option>
		  <option value="KA">Georgian</option>
		  <option value="DE">German</option>
		  <option value="EL">Greek</option>
		  <option value="GU">Gujarati</option>
		  <option value="HE">Hebrew</option>
		  <option value="HI">Hindi</option>
		  <option value="HU">Hungarian</option>
		  <option value="IS">Icelandic</option>
		  <option value="ID">Indonesian</option>
		  <option value="GA">Irish</option>
		  <option value="IT">Italian</option>
		  <option value="JA">Japanese</option>
		  <option value="JW">Javanese</option>
		  <option value="KO">Korean</option>
		  <option value="LA">Latin</option>
		  <option value="LV">Latvian</option>
		  <option value="LT">Lithuanian</option>
		  <option value="MK">Macedonian</option>
		  <option value="MS">Malay</option>
		  <option value="ML">Malayalam</option>
		  <option value="MT">Maltese</option>
		  <option value="MI">Maori</option>
		  <option value="MR">Marathi</option>
		  <option value="MN">Mongolian</option>
		  <option value="NE">Nepali</option>
		  <option value="NO">Norwegian</option>
		  <option value="FA">Persian</option>
		  <option value="PL">Polish</option>
		  <option value="PT">Portuguese</option>
		  <option value="PA">Punjabi</option>
		  <option value="QU">Quechua</option>
		  <option value="RO">Romanian</option>
		  <option value="RU">Russian</option>
		  <option value="SM">Samoan</option>
		  <option value="SR">Serbian</option>
		  <option value="SK">Slovak</option>
		  <option value="SL">Slovenian</option>
		  <option value="ES">Spanish</option>
		  <option value="SW">Swahili</option>
		  <option value="SV">Swedish </option>
		  <option value="TA">Tamil</option>
		  <option value="TT">Tatar</option>
		  <option value="TE">Telugu</option>
		  <option value="TH">Thai</option>
		  <option value="BO">Tibetan</option>
		  <option value="TO">Tonga</option>
		  <option value="TR">Turkish</option>
		  <option value="UK">Ukranian</option>
		  <option value="UR">Urdu</option>
		  <option value="UZ">Uzbek</option>
		  <option value="VI">Vietnamese</option>
		  <option value="CY">Welsh</option>
		  <option value="XH">Xhosa</option>
	</select>
	<br>
	Sex: <select data-placeholder="Choose sex..." id="sex" name="sex"><option value="f">F</option><option value="m">M</option></select><br>
	Age: <input type="number" id="age" name="age" min=0 max=160/><br>
	Interested in: 	<select id="interestedin" data-placeholder="Interested in..." name="interestedin">
						<option value="w">Women</option>
						<option value="m">Men</option>
					</select><br>
	Ethnicity: <input id="etnicity" type="text" name="etnicity" /><br>
	Height: <input id="height" type="number" name="height" min=0 max=300/> cm<br>
	Weight: <input id="weight" type="number" name="weight" min=0 max=1000/> kg<br>
	Religion: <select id="religion" name="">
  <option name="religion">-- select one --</option>
  <option value="African Traditional & Diasporic">African Traditional & Diasporic</option>
  <option value="Agnostic">Agnostic</option>
  <option value="Atheist">Atheist</option>
  <option value="Baha'i">Baha'i</option>
  <option value="Buddhism">Buddhism</option>
  <option value="Cao Dai">Cao Dai</option>
  <option value="Chinese traditional religion">Chinese traditional religion</option>
  <option value="Christianity">Christianity</option>
  <option value="Hinduism">Hinduism</option>
  <option value="Islam">Islam</option>
  <option value="Jainism">Jainism</option>
  <option value="Juche">Juche</option>
  <option value="Judaism">Judaism</option>
  <option value="Neo-Paganism">Neo-Paganism</option>
  <option value="Nonreligious">Nonreligious</option>
  <option value="Rastafarianism">Rastafarianism</option>
  <option value="Secular">Secular</option>
  <option value="Shinto">Shinto</option>
  <option value="Sikhism">Sikhism</option>
  <option value="Spiritism">Spiritism</option>
  <option value="Tenrikyo">Tenrikyo</option>
  <option value="Unitarian-Universalism">Unitarian-Universalism</option>
  <option value="Zoroastrianism">Zoroastrianism</option>
  <option value="primal-indigenous">primal-indigenous</option>
  <option value="Other">Other</option>
</select>
	<br>
	<b>Location</b><br>
	
		Region&raquo; <select onchange="set_country(this,country,city_state)" id="region" size="1" name="region">
		<option value="" selected="selected">SELECT REGION</option>
		<option value=""></option>
		<script type="text/javascript">
		setRegions(this);
		</script>
		</select>
		Country&raquo; <select id="country" name="country" size="1" disabled="disabled" onchange="set_city_state(this,city_state)"></select>
		City/State&raquo; <select id="city_state" name="city_state" size="1" disabled="disabled" onchange="print_city_state(country,this)"></select>
		<input type="submit" onclick="updateUser()" name="continueReg" value="update" /> 

		<div id="txtregion"></div>
		<div id="txtplacename"></div>
		
	<script src="vendor/jquery/jquery.min.js"></script>
	<script>
		function updateUser(){
			var n = $('#name').val();
			var l = $('#lastname').val();
			var p = $('#phonenr').val();
			//alert("yo "+n+l+p);
			var updateData = JSON.stringify(
					{
					name : $('#name').val(),
					lastname : $('#lastname').val(),
					phonenr : $('#phonenr').val(),
					imgpath : $('#imgpath').val(),
					description : $('#description').val(),
					language :  $( "#language option:selected" ).text(),
					sex : $( "#sex option:selected" ).text(),
					age : $('#age').val(),
					interestedin : $( "#interestedin option:selected" ).text(),
					etnicity : $('#etnicity').val(),
					height : $('#height').val(),
					weight : $('#weight').val(),
					religion : $( "#religion option:selected" ).text(),
					region : $( "#region option:selected" ).text(),
					country : $( "#country option:selected" ).text(),
					city_state : $( "#city_state option:selected" ).text() 
					}
				);
			$.ajax('/updateUser', {
				type: 'POST',
				contentType: 'application/json',
				data: updateData,
				success: function(data, textStatus, jqXHR ){
					location.replace("http://localhost:8080/userProfile.jsp");
					//alert(" sent " +data + ", status: "+textStatus);
				},
				error: function(jqXhr, textStatus, errorMessage){
					console.log(jqXhr);
//					alert(jqXhr);
//					alert("idk: "+errorMessage + " , textStatus: " + textStatus + " , jqXhr: "+jqXhr);
				}
			});
		}
	</script>
</body>
</html>