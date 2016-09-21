<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Register here!</title>
<style type="text/css">
body {
    color: #FFFFFF ;
    height: 600px;
    width: 600px;
    background-color: #1077C1;
    position: relative;
    text-align: left;
}
#contents table tr td select {
    float: none;
    position: relative;
}
#contents form #button {
    text-align: right;
    position: relative;
}
#contents form #button input {
    font-size: 16px;
    font-weight: bolder;
}
</style>
<script language="javascript">
function validate(objForm){
if(objForm.user_name.value.length==0){
alert("Please enter username!");
objForm.user_name.focus();
return false;
}

if(objForm.first_name.value.length==0){
alert("Please enter your First Name!");
objForm.first_name.focus();
return false;
}

if(!(isNaN(document.objForm.first_name.value)))
{
alert("Name has character only!");
return false;
}

if(objForm.last_name.value.length==0){
alert("Please enter your Last Name!");
objForm.last_name.focus();
return false;
}

if(!(isNaN(document.objForm.last_name.value)))
{
alert("Name has character only!");
return false;
}

if(objForm.password.value.length==0){
alert("Please enter Password!");
objForm.password.focus();
return false;
}

if(objForm.conf_password.value.length==0){
alert("Please confirm your password!");
objForm.conf_password.focus();
return false;
}

if(document.getElementById("password").value!=document.getElementById("conf_password").value)
{
alert("Passwords do not match!");
document.getElementById("password").focus();
return false;
}

if(objForm.email.value.length==0){
alert("Please enter Email!");
objForm.email.focus();
return false;
}

if (document.objForm.email.value != "")
{
var Temp = document.objForm.email
var AtSym = Temp.value.indExampleOf('@')
var Period = Temp.value.lastIndExampleOf('.')
var Space = Temp.value.indExampleOf(' ')
var Length = Temp.value.length - 1
if ((AtSym < 1) ||
(Period <= AtSym+1) ||
(Period == Length ) ||
(Space != -1))
{
alert("Please enter a valid Email ID!");
document.objForm.email.focus();
return false;
}
}

if(objForm.phone.value.length==0){
alert("Please enter Phone!");
objForm.phone.focus();
return false;
}


if(objForm.city.value.length==0){
alert("Please enter City!");
objForm.city.focus();
return false;
}

if(!(isNaN(document.objForm.city.value)))
{
alert("City has character only!");
objForm.city.focus();
return false;
}

return true;
}
</script>
</head>
<body>
<div id="header">
  <h2>User Registration</h2>
</div>
<div id="contents">
  <form name ="objForm"  method="post" name="registration" action="InputTestForm" onSubmit="return validate(this)">
    <table width="474" border="0" cellpadding="5" cellspacing="5">
      <tr>
        <td width="131">Username</td>
        <td width="308">*&nbsp;
        <input name="user_name" id="user_name" type="text" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>First Name:</td>
        <td>*&nbsp;
        <input name="first_name" id="first_name" type="text" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>Last name:</td>
        <td>*&nbsp;
        <input name="last_name" id="last_name" type="text" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>Password:</td>
        <td>*&nbsp;
        <input name="password" id="password" type="password" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>Confirm Password:</td>
        <td>*&nbsp;
        <input name="conf_password" id="conf_password" type="password" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td>*&nbsp;
        <input name="email" id="email" type="email" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>Phone:</td>
        <td>*&nbsp
        <input name="phone" id="phone" type="text" size="30" maxlength="30" /></td>
      </tr>
      <tr>
        <td>City:</td>
        <td>*&nbsp
        <input name="city" id="city" type="text" size="30" maxlength="30" /></td>
      </tr>
    </table>
    <p id="button">
<input name="submit" type="submit" value="Register" />&nbsp;&nbsp;
<input name="reset" type="reset" value="Reset Form" /></p>
  </form>
</div>
<div id="footer"></div>
</body>
</html>