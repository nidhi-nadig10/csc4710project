<%@ page language="java" contentType="text/css; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
body {
	background-color: #ffeee5
}

p {
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif
}

#navigation
{
	height: 30px;
	margin: auto;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	background-color: #e4b48f;
}

#navigation ul
{
	list-style:none;
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#navigation ul a
{
	display:block;
	color:black;
	text-decoration:none;
	font-weight:700;
	font-size:18px;
	line-height:32px;
	padding:0 15px;
}

#navigation ul li
{
	position:relative;
	float:left;
	margin-right: 10px;
	padding:0
}

.current-menu-item
{
	background: #ffeee5;
}

#navigation ul li:hover
{
	background:#ffeee5;
}

.center {
	text-align: center;
	margin: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.container {
	height: relative;
	position: relative;
	padding: 20px;
	border: 3px solid black;
	border-radius: 12px;
}

.buttonOne {
	background-color: #e4b48f;
	border: none;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	border-radius: 12px;
	transition-duration: 0.4s;
}

.buttonOne:hover {
  background-color: #e4b48f;
  color: #ffeee5;
}

.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: #e4b48f;
  color: #ffeee5;
  text-align: center;
}

.table {
  font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
  background-color: #FFEEE5;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  table-layout: fixed;
  word-wrap: break-word;
}

.table, th, td {
  border: 1px solid #E4B48F;
  padding: 3px 2px;
}
.table, td {
  font-size: 13px;
  color: #000000;
}
.table th {
  background: #FFEEE5;
  border-bottom: 2px solid #E4B48F;
  
.table th {
  font-size: 14px;
  font-weight: bold;
  color: #000000;
}

