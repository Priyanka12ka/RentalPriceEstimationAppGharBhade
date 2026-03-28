
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("un");
if (user == null) {
	response.sendRedirect("lg");
}
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
body {
	background: linear-gradient(135deg, #71cbc6, #3aa7a3, #2b7a78);
	background-size: 400% 400%;
	animation: gradientMove 10s ease infinite;
	color: white;
}

@
keyframes gradientMove { 0% {
	background-position: 0% 50%;
}

50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
}
.navbar {
	background: rgba(0, 0, 0, 0.6) !important;
	backdrop-filter: blur(10px);
}

.sidebar {
	background: linear-gradient(135deg, rgba(50, 50, 50, 0.85),
		rgba(20, 20, 20, 0.7));
	backdrop-filter: blur(20px);
	border-radius: 20px 0 0 20px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
	padding: 2rem 1rem;
	min-height: 100vh;
	transition: all 0.4s ease;
	position: relative;
	overflow: hidden;
}

.sidebar::before {
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: radial-gradient(circle, rgba(113, 203, 198, 0.2) 0%,
		transparent 70%);
	animation: glowMove 8s linear infinite;
	pointer-events: none;
}

@
keyframes glowMove { 0% {
	transform: rotate(0deg);
}

100
%
{
transform
:
rotate(
360deg
);
}
}
.sidebar:hover {
	transform: scale(1.02);
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
}

.sidebar .nav .btn {
	background: rgba(255, 255, 255, 0.05);
	color: #71cbc6;
	border: 1px solid #71cbc6;
	border-radius: 12px;
	margin-bottom: 14px;
	font-weight: 500;
	position: relative;
	overflow: hidden;
	transition: all 0.3s ease;
}

.sidebar .nav .btn:hover {
	background: #71cbc6;
	color: #000;
	transform: translateX(8px);
}

.sidebar .nav .btn::after {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: -100%;
	background: rgba(255, 255, 255, 0.1);
	transition: all 0.4s;
}

.sidebar .nav .btn:hover::after {
	left: 0;
}

.sidebar .btn-danger {
	border-radius: 15px;
	font-weight: bold;
	box-shadow: 0 6px 15px rgba(255, 0, 0, 0.4);
	transition: all 0.3s ease;
}

.sidebar .btn-danger:hover {
	background: #ff4d4d;
	transform: scale(1.08);
}

.sidebar p.text-info {
	font-size: 1.2rem;
	letter-spacing: 1px;
	margin-bottom: 2rem;
}

.sidebar::-webkit-scrollbar {
	width: 6px;
}

.sidebar::-webkit-scrollbar-thumb {
	background-color: rgba(113, 203, 198, 0.4);
	border-radius: 3px;
}

.glass-card {
	background: rgba(0, 0, 0, 0.5);
	border: 1px solid rgba(113, 203, 198, 0.6);
	backdrop-filter: blur(12px);
	border-radius: 15px;
}

.form-control, .form-select {
	background: rgba(0, 0, 0, 0.6) !important;
	color: white !important;
	border: 1px solid #71cbc6;
}

.btn-theme {
	background: #71cbc6;
	color: black;
	border: none;
}

.menu-btn {
	border: 1px solid #71cbc6;
	color: white;
}

.menu-btn:hover {
	background: #71cbc6;
	color: black;
}

.table {
	background: rgba(0, 0, 0, 0.5);
}

.home-emoji {
	font-size: 1.8rem;
}

.navbar {
	background-color: #2b7a78;
}

.btn-delete {
	background: rgba(255, 77, 77, 0.15);
	color: #ff4d4d;
	border: 1px solid #ff4d4d;
	border-radius: 10px;
	transition: all 0.3s ease;
}

.btn-delete:hover {
	background: #ff4d4d;
	color: #fff;
	transform: scale(1.05);
}

.btn-update {
	background: rgba(113, 203, 198, 0.15);
	color: #71cbc6;
	border: 1px solid #71cbc6;
	border-radius: 10px;
	transition: all 0.3s ease;
}

.btn-update:hover {
	background: #71cbc6;
	color: #000;
	transform: scale(1.05);
}

.table thead {
	background: rgba(113, 203, 198, 0.25);
	color: #71cbc6;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.table tbody tr:hover {
	background: rgba(113, 203, 198, 0.1);
}

.table td, .table th {
	padding: 12px;
	vertical-align: middle;
}

.glass-card h3 {
	border-bottom: 1px solid rgba(113, 203, 198, 0.4);
	padding-bottom: 10px;
}

#displayInquery table tbody tr:hover {
	background: rgba(113, 203, 198, 0.1);
}
</style>
</head>
<body class="bg-dark text-light">
<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-dark px-3">
		<div class="container-fluid justify-content-center d-flex">
			<!-- Home emoji + RentMitra in center -->
			<div class="d-flex align-items-center">
				<div class="home-emoji me-2">🏠</div>
				<h4 class="fw-bold mb-0">RentMitra</h4>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">

			<!-- SIDEBAR -->
			<div class="col-md-3 col-lg-2 sidebar min-vh-100 p-3">

				<p class="text-center text-info fw-bold">Welcome ${un}</p>

				<div class="nav flex-column">
					<button class="btn menu-btn mb-2" onclick="showSection('addState')">Manage
						State</button>
					<button class="btn menu-btn mb-2" onclick="showSection('addcity')">Manage
						City</button>
					<button class="btn menu-btn mb-2" onclick="showSection('addloc')">Manage
						Location</button>
					<button class="btn menu-btn mb-2" onclick="showSection('addForm')">Manage
						Property</button>

					<button class="btn menu-btn mb-2"
						onclick="showSection('searchForm'); loadProperty();">List
						Property</button>
					<button class="btn menu-btn mb-2"
						onclick="showSection('displayData'); display();">List
						User</button>
					<button class="btn menu-btn mb-2"
						onclick="showSection('displayInquery'); displayInquery();">Inquiry</button>



					<a class="btn btn-danger mt-4" href="logout">Log Out</a>
				</div>

			</div>

			<!-- MAIN -->
			<div class="col-md-9 col-lg-10 p-4">
				<div id="updateForm" class="section d-none glass-card p-4">

					<h3 class="mb-4">Update Property</h3>

					<input type="hidden" id="upid">

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Location Code</label> <input type="number" id="ulocation"
								class="form-control">
						</div>

						<div class="col-md-6 mb-3">
							<label>Area</label> <input type="number" id="uarea"
								class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Bedrooms</label> <input type="number" id="ubed"
								class="form-control">
						</div>

						<div class="col-md-6 mb-3">
							<label>Bathrooms</label> <input type="number" id="ubath"
								class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Parking</label> <select id="upark" class="form-select">
								<option value="true">Yes</option>
								<option value="false">No</option>
							</select>
						</div>

						<div class="col-md-6 mb-3">
							<label>Metro Distance</label> <input type="number" id="umetro"
								class="form-control">
						</div>
					</div>

					<div class="mb-3">
						<label>Price</label> <input type="number" id="uprice"
							class="form-control">
					</div>

					<button onclick="updatePropertyData()" class="btn btn-theme">
						Update</button>

				</div>

				<!-- ================= ADD PROPERTY ================= -->
				<div id="addForm" class="section glass-card p-4">

					<h3 class="text-center mb-4">Add Property</h3>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>State</label> <select id="ssl" onchange="loadC()"
								class="form-select"></select>
						</div>

						<div class="col-md-6 mb-3">
							<label>City</label> <select id="cs" onchange="loadL()"
								class="form-select"></select>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Location</label> <select id="cl" class="form-select"></select>
						</div>

						<div class="col-md-6 mb-3">
							<label>Area</label> <input type="number" id="area_sqft"
								class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Bedrooms</label> <input type="number" id="bedrooms"
								class="form-control">
						</div>

						<div class="col-md-6 mb-3">
							<label>Bathrooms</label> <input type="number" id="bathrooms"
								class="form-control">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>Parking</label> <select id="parking" class="form-select">
								<option value="">Select</option>
								<option value="true">Yes</option>
								<option value="false">No</option>
							</select>
						</div>

						<div class="col-md-6 mb-3">
							<label>Metro Distance</label> <input type="number"
								id="metro_distance" class="form-control">
						</div>
					</div>

					<div class="mb-3">
						<label>Price</label> <input type="number" id="price"
							class="form-control">
					</div>

					<div class="text-center">
						<button onclick="saveProperty()" class="btn btn-theme">Add</button>
						<button onclick="clearForm()" class="btn btn-secondary">Clear</button>
					</div>

				</div>

				<!-- ================= ADD STATE ================= -->
				<div id="addState" class="section d-none glass-card p-4">

					<h3 class="mb-4 text-center">Add State</h3>

					<form id="stateForm">

						

						<!-- State Name -->
						<div class="mb-3">
							<label class="form-label">State Name</label> <input type="text"
								id="statename" class="form-control"
								placeholder="Enter state name (e.g. Maharashtra)">
						</div>

						<button class="btn btn-theme w-100">Add State</button>

					</form>
				</div>

				<!-- ================= ADD CITY ================= -->
				<div id="addcity" class="section d-none glass-card p-4">

					<h3 class="mb-4 text-center">Add City</h3>

					<form id="cityForm">

						<!-- Select State -->
						<div class="mb-3">
							<label class="form-label">Select State</label> <select
								id="stateSelectCity" class="form-control">
								<option value="">-- Select State --</option>
							</select>
						</div>

						<!-- City Name -->
						<div class="mb-3">
							<label class="form-label">City Name</label> <input type="text"
								id="cityname" class="form-control"
								placeholder="Enter city name (e.g. Pune)">
						</div>

						<button class="btn btn-theme w-100">Add City</button>

					</form>
				</div>

				<!-- ================= ADD LOCATION ================= -->
				<div id="addloc" class="section d-none glass-card p-4">

					<h3 class="mb-4 text-center">Add Location</h3>

					<!-- Select State -->
					<div class="mb-3">
						<label class="form-label">Select State</label> <select
							id="stateSelectLocation" onchange="loadCities()"
							class="form-control">
							<option value="">-- Select State --</option>
						</select>
					</div>

					<!-- Select City -->
					<div class="mb-3">
						<label class="form-label">Select City</label> <select
							id="citySelect" class="form-control">
							<option value="">-- Select City --</option>
						</select>
					</div>

					<!-- Location Name -->
					<div class="mb-3">
						<label class="form-label">Location Name</label> <input type="text"
							id="locationname" class="form-control"
							placeholder="Enter location (e.g. Wakad, Baner)">
					</div>

					<button onclick="saveLocation()" class="btn btn-theme w-100">
						Add Location</button>

				</div>
				<!-- ================= PROPERTY ================= -->
				<div id="searchForm" class="section d-none glass-card p-4">
					<h3 class="text-info mb-4 fw-bold">Property List</h3>

					<input type="text" id="searchCity" class="form-control mb-2"
						placeholder="City">
					<button onclick="searchProperty()" class="btn btn-theme mb-3">Search</button>

					<table
						class="table table-dark table-hover align-middle text-center">
						<thead>
							<tr>
								<th>ID</th>
								<th>State</th>
								<th>City</th>
								<th>Location</th>
								<th>Area</th>
								<th>Bed</th>
								<th>Bath</th>
								<th>Parking</th>
								<th>Metro</th>
								<th>Price</th>
								<th id="actionHeader">Action</th>
							</tr>
						</thead>
						<tbody id="propertyTable"></tbody>
					</table>
				</div>

				<!-- ================= USERS ================= -->
				<div id="displayData" class="section d-none glass-card p-4">
					<h3 class="text-info mb-4 fw-bold">User List</h3>
					<div class="table-responsive">
						<table
							class="table table-dark table-hover align-middle text-center">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Contact</th>
									<th>Role</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="tb"></tbody>
						</table>
					</div>
				</div>

				<!-- ================= INQUIRY ================= -->
				<div id="displayInquery" class="section d-none glass-card p-4">
					<h3 class="text-info mb-4 fw-bold">Inquiry List</h3>
					<div class="table-responsive">
						<table
							class="table table-dark table-hover align-middle text-center">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Message</th>
								</tr>
							</thead>
							<tbody id="tbb"></tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
</body>
<script>
	
function showSection(sectionId) {
	const sections=document.querySelectorAll(".section");
	sections.forEach(sec=>{
	sec.classList.add("d-none");
	});
	document.getElementById(sectionId).classList.remove("d-none");
	if(sectionId=="addcity" || sectionId=="addloc")
	{
	loadStates();
	}
	}
	
/* //display user */
function display()
{
	fetch("/RentalPriceEstimationApp/admin/display").	
	then((res)=>{
		
		return res.json();
	}).
	then((data)=>{   //ya data madhe back end vrun yenari list ahe
		let tb=document.getElementById("tb");
		tb.innerHTML="";
		data.forEach((ele, index) => {

		    let tr = document.createElement("tr");

		    let tdid = document.createElement("td");
		    tdid.innerText = index + 1;   // SERIAL NUMBER

		    let tdname = document.createElement("td");
		    tdname.innerText = ele.username;

		    let tdemail = document.createElement("td");
		    tdemail.innerText = ele.email;

		    let tdcontact = document.createElement("td");
		    tdcontact.innerText = ele.contact;

		    let tdrole = document.createElement("td");
		    tdrole.innerText = ele.role;

		    let tdaction = document.createElement("td");

		    let btn = document.createElement("button");
		    btn.innerText = "Delete";
		    btn.className = "btn btn-delete btn-sm";
		    btn.onclick = function(){
		        deleteUser(ele.id);   // still using real id internally
		    };

		    tdaction.appendChild(btn);

		    tr.appendChild(tdid);
		    tr.appendChild(tdname);
		    tr.appendChild(tdemail);
		    tr.appendChild(tdcontact);
		    tr.appendChild(tdrole);
		    tr.appendChild(tdaction);

		    tb.appendChild(tr);
		});
	}).
	catch((err)=>{
		alert(err.message);
	});
}
//delete user
function deleteUser(id)
{
if(confirm("Are you sure you want to delete?"))
{
fetch("/RentalPriceEstimationApp/admin/deleteuser/"+id)
.then(res=>res.text())
.then(msg=>{
alert(msg);
display(); // reload table
})
.catch(err=>{
alert("Error : "+err);
});
}
}
</script>
<!--save state  -->
<script type="text/javascript">
	
document.getElementById("stateForm").addEventListener("submit",function(event){
	event.preventDefault();

	let statename=document.getElementById("statename").value.trim();

	if(statename=="")
	{
		alert("statename required");
		return;
	}

	let state={
		statename:statename
	};

	fetch("/RentalPriceEstimationApp/admin/savestate",{
		method:"POST",
		headers:{
			"Content-Type":"application/json"
		},
		body:JSON.stringify(state)
	})
	.then(res=>res.text())
	.then(msg=>{
		alert(msg);
		document.getElementById("stateForm").reset();
	})
	.catch(err=>{
		alert("Error : "+err);
	});
});
</script>
<!-- load state -->
<script>	
function loadStates(){
	fetch("/RentalPriceEstimationApp/admin/states")
	.then(res=>res.json())
	.then(data=>{
	let stateCity=document.getElementById("stateSelectCity");
	let stateLocation=document.getElementById("stateSelectLocation");
	stateCity.innerHTML="<option value=''>Select State</option>";
	stateLocation.innerHTML="<option value=''>Select State</option>";
	data.forEach(s=>{
	let op1=document.createElement("option");
	op1.value=s.statecode;
	op1.text=s.statename;
	let op2=document.createElement("option");
	op2.value=s.statecode;
	op2.text=s.statename;
	stateCity.appendChild(op1);
	stateLocation.appendChild(op2);
	});
	});
	}
	// load cities
	
function loadCities(){
	let statecode=document.getElementById("stateSelectLocation").value;


	if(statecode=="")
	{
	
		return;
	}

	fetch("/RentalPriceEstimationApp/admin/cities/"+statecode)
	.then(res=>{
		
		return res.json();
	})
	.then(data=>{
	

		let citySelect=document.getElementById("citySelect");
	

		citySelect.innerHTML="<option value=''>Select City</option>";

		data.forEach(function(c){
		

			let op=document.createElement("option");
			op.value=c.id;
			op.textContent=c.name;

		

			citySelect.appendChild(op);
		});

	});
}
	
	//save location
	function saveLocation(){
		let cityid=document.getElementById("citySelect").value;
		let locationname=document.getElementById("locationname").value;
		let loc={
		cid:cityid,
		locationname:locationname
		};
		fetch("/RentalPriceEstimationApp/admin/saveLocation",{
		method:"POST",
		headers:{
		"Content-Type":"application/json"
		},
		body:JSON.stringify(loc)
		})
		.then(res=>res.text())
		.then(msg=>alert(msg));
		}
	// page load  even
	/* window.onload=function(){
	loadStates();
	document.getElementById("stateSelectLocation").addEventListener("change",loadCities);
	} */
<!-- </script>

<!-- 	Save Properties -->
<script>	 -->
	function loadS(){

		fetch("/RentalPriceEstimationApp/admin/states")

		.then(res=>res.json())

		.then(data=>{

		let stateSelect=document.getElementById("ssl");

		stateSelect.innerHTML="<option value=''>Select State</option>";

		data.forEach(function(s){

		let op=document.createElement("option");

		op.value=s.statecode;
		op.text=s.statename;

		stateSelect.appendChild(op);

		});

		});

		}
	// load cities
	function loadC(){
	let statecode=document.getElementById("ssl").value;
	if(statecode=="")
	{
	return;
	}
	fetch("/RentalPriceEstimationApp/admin/cities/"+statecode)
	.then(res=>res.json())
	.then(data=>{
	let cs=document.getElementById("cs");
	cs.innerHTML="<option value=''>Select City</option>";
	data.forEach(function(c){
	let op=document.createElement("option");
	op.value=c.id;
	op.textContent=c.name;
	cs.appendChild(op);
	});
	});
	}
	//load location
	function loadL(){
let cityid=document.getElementById("cs").value;
console.log("CITY ID:", cityid);
if(cityid=="")
{
return;
}

fetch("/RentalPriceEstimationApp/admin/locations/"+cityid)

.then(res=>res.json())

.then(data=>{
	 console.log("LOCATION DATA:", data);
let locationSelect=document.getElementById("cl");

locationSelect.innerHTML="<option value=''>Select Location</option>";

data.forEach(function(l){

let op=document.createElement("option");

op.value=l.locationcode;
op.textContent=l.locationname;

locationSelect.appendChild(op);

});

});

}
	
	//save property
	function saveProperty(){	
		let property={
			    locationcode: Number(document.getElementById("cl").value),
			    area_sqft: Number(document.getElementById("area_sqft").value),
			    bedrooms: Number(document.getElementById("bedrooms").value),
			    bathrooms: Number(document.getElementById("bathrooms").value),
			    parking: document.getElementById("parking").value === "true",
			    metro_distance: Number(document.getElementById("metro_distance").value),
			    price: Number(document.getElementById("price").value)
			};
		fetch("/RentalPriceEstimationApp/admin/saveProperty",{
		method:"POST",
		headers:{
		"Content-Type":"application/json"
		},
		body:JSON.stringify(property)
		})
		.then(res=>res.text())
		.then(msg=>alert(msg));
		};
	// page load  even
	/* window.onload=function(){
	loadS();
	document.getElementById("ssl").addEventListener("change",loadC);
	} */
	
	window.addEventListener("load", function(){
	    loadStates();
	    loadS();

	    document.getElementById("stateSelectLocation").addEventListener("change", loadCities);
	    document.getElementById("ssl").addEventListener("change", loadC);
	    document.getElementById("cs").addEventListener("change", loadL);
	});
</script>
<script type="text/javascript">

function loadProperty(){

	fetch("/RentalPriceEstimationApp/admin/properties")

	.then(res=>res.json())

	.then(data=>{

	console.log(data);

	let tb=document.getElementById("propertyTable");

	tb.innerHTML="";

	data.forEach(function(p){

	let tr=document.createElement("tr");

	tr.innerHTML=
	"<td>"+p.property_id+"</td>"+
	"<td>"+p.statename+"</td>"+
	"<td>"+p.city+"</td>"+
	"<td>"+p.locationname+"</td>"+
	"<td>"+p.area_sqft+"</td>"+
	"<td>"+p.bedrooms+"</td>"+
	"<td>"+p.bathrooms+"</td>"+
	"<td>"+(p.parking ? "Yes":"No")+"</td>"+
	"<td>"+p.metro_distance+"</td>"+
	"<td>"+p.price+"</td>"+
	"<td>" +
	"<button class='btn btn-delete btn-sm me-2' onclick='deleteProperty("+p.property_id+")'>Delete</button>" +
	"<button class='btn btn-update btn-sm' onclick='editProperty("+p.property_id+")'>Update</button>"
	"</td>";
	tb.appendChild(tr);

	});

	});

	}
	//clear fild
function clearForm(){
    document.getElementById("ssl").value = "";
    document.getElementById("cs").innerHTML = "<option value=''>Select City</option>";
    document.getElementById("cl").innerHTML = "<option value=''>Select Location</option>";
    document.getElementById("area_sqft").value = "";
    document.getElementById("bedrooms").value = "";
    document.getElementById("bathrooms").value = "";
    document.getElementById("parking").value = "";
    document.getElementById("metro_distance").value = "";
    document.getElementById("price").value = "";
}
function saveProperty(){

    let location = document.getElementById("cl").value;
    let area = document.getElementById("area_sqft").value;
    let bedrooms = document.getElementById("bedrooms").value;
    let bathrooms = document.getElementById("bathrooms").value;
    let parking = document.getElementById("parking").value;
    let metro = document.getElementById("metro_distance").value;
    let price = document.getElementById("price").value;

    // ================= VALIDATION =================

    if(location === ""){
        alert("All fields are required");
        return;
    }

    if(area === "" || Number(area) <= 0){
        alert("Enter valid Area");
        return;
    }

    if(bedrooms === "" || Number(bedrooms) <= 0){
        alert("Enter valid Bedrooms");
        return;
    }

    if(bathrooms === "" || Number(bathrooms) <= 0){
        alert("Enter valid Bathrooms");
        return;
    }

    if(parking === ""){
        alert("Select Parking");
        return;
    }

    if(metro === "" || Number(metro) < 0){
        alert("Enter valid Metro Distance");
        return;
    }

    if(price === "" || Number(price) <= 0){
        alert("Enter valid Price");
        return;
    }

    // ================= API CALL =================

    let property={
        locationcode: Number(location),
        area_sqft: Number(area),
        bedrooms: Number(bedrooms),
        bathrooms: Number(bathrooms),
        parking: parking === "true",
        metro_distance: Number(metro),
        price: Number(price)
    };

    fetch("/RentalPriceEstimationApp/admin/saveProperty",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(property)
    })
    .then(res=>res.text())
    .then(msg=>{
        alert(msg);
        clearForm();
    });
}

</script>

<!--search city  -->
<script type="text/javascript">
	function searchProperty(){

	    let city = document.getElementById("searchCity").value.trim();

	    if(city === ""){
	        alert("Enter city name");
	        return;
	    }

	    fetch("/RentalPriceEstimationApp/admin/search/" + city)
	    .then(res => res.json())
	    .then(data => {

	        let tb = document.getElementById("propertyTable");
	        tb.innerHTML = "";

	        // ✅ NO DATA MESSAGE
	        if(!data || data.length === 0){
	            let tr = document.createElement("tr");
	            tr.innerHTML = "<td colspan='11' class='text-center fw-bold' style='color:#4da6ff;'>No Property Found</td>";
	            tb.appendChild(tr);
	            return;
	        }

	        // DATA SHOW
	        data.forEach(function(p){

	            let tr = document.createElement("tr");

	            tr.innerHTML =
	            "<td>"+p.property_id+"</td>"+
	            "<td>"+p.statename+"</td>"+
	            "<td>"+p.city+"</td>"+
	            "<td>"+p.locationname+"</td>"+
	            "<td>"+p.area_sqft+"</td>"+
	            "<td>"+p.bedrooms+"</td>"+
	            "<td>"+p.bathrooms+"</td>"+
	            "<td>"+(p.parking ? "Yes":"No")+"</td>"+
	            "<td>"+p.metro_distance+"</td>"+
	            "<td>"+p.price+"</td>";

	            tb.appendChild(tr);
	        });

	    })
	    .catch(err=>{
	        alert("Error: " + err);
	    });
	}
</script>

<!-- delete property -->
<script type="text/javascript">
function deleteProperty(id){

    if(!confirm("Are you sure you want to delete?")){
        return;
    }
 console.log(id);
    fetch("/RentalPriceEstimationApp/admin/delete/" + id, {
        method: "DELETE"
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);

        loadProperty();  
    })
    .catch(err => {
        alert("Error: " + err);
    });
}


//update
function editProperty(id){

	    fetch("/RentalPriceEstimationApp/admin/property/" + id)
	    .then(res => res.json())
	    .then(data => {

	        showSection('updateForm');

	        document.getElementById("upid").value = data.property_id;
	        document.getElementById("ulocation").value = data.locationcode;
	        document.getElementById("uarea").value = data.area_sqft;
	        document.getElementById("ubed").value = data.bedrooms;
	        document.getElementById("ubath").value = data.bathrooms;
	        document.getElementById("upark").value = data.parking;
	        document.getElementById("umetro").value = data.metro_distance;
	        document.getElementById("uprice").value = data.price;

	    })
	    .catch(err => {
	        alert("Error: " + err);
	    });
}

function updatePropertyData(){

    let property = {
        property_id: document.getElementById("upid").value,
        locationcode: document.getElementById("ulocation").value,
        area_sqft: document.getElementById("uarea").value,
        bedrooms: document.getElementById("ubed").value,
        bathrooms: document.getElementById("ubath").value,
        parking: document.getElementById("upark").value === "true",
        metro_distance: document.getElementById("umetro").value,
        price: document.getElementById("uprice").value
    };

    fetch("/RentalPriceEstimationApp/admin/updateProperty", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(property)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        showSection('searchForm');
        loadProperty();
    })
    .catch(err => {
        alert("Error: " + err);
    });
}

function displayInquery() {

    fetch("/RentalPriceEstimationApp/admin/getAllInquiries")
    .then((res) => {
        return res.json();
    })
    .then((data) => {

        console.log(data);

        let tb = document.getElementById("tbb"); 
        tb.innerHTML = "";

        data.forEach((ele, index) => {

            let tr = document.createElement("tr");

            let tdid = document.createElement("td");
            tdid.innerText = index + 1; 

            let tdname = document.createElement("td");
            tdname.innerText = ele.name;

            let tdemail = document.createElement("td");
            tdemail.innerText = ele.email;

            let tdmessage = document.createElement("td");
            tdmessage.innerText = ele.message;

            tr.appendChild(tdid);
            tr.appendChild(tdname);
            tr.appendChild(tdemail);
            tr.appendChild(tdmessage);

            tb.appendChild(tr);
        });

    })
    .catch((err) => {
        console.log("Error:", err);
    });
}

document.getElementById("cityForm").addEventListener("submit", function(e){
    e.preventDefault();

    let statecode = document.getElementById("stateSelectCity").value;
    let name = document.getElementById("cityname").value;

    let city = {
        statecode: statecode,
        name: name
    };

    fetch("/RentalPriceEstimationApp/admin/addCity", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(city)
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        document.getElementById("cityForm").reset();
    });
});
</script>
</body>

</html>
