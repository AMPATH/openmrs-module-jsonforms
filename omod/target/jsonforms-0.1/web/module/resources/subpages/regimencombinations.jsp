<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="rcombidiv">

		<a href="#" id="regimenid">Add regimen </a>

		<form id="regimenvoid" action="#">
			<fieldset>

				<legend>frequency Void reason</legend>

				<label>Reason</label> <input type="text" name="regimenreason"
					id="regimenreason" class="required" /> <input type="hidden"
					name="regimenuuidvoid" id="regimenuuidvoid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>


		<form id="regimenform" name="regimenform" action="#">
			<fieldset>

				<legend>Regimen creation</legend>

				<input type="hidden" name="regimenedit" id="regimenedit"
					value="false" /> <input type="hidden" name="regimenuuid"
					id="regimenuuid" /> <label>Regimen name</label> <select
					id="regimennamecomplete" name="regimennamecomplete">


				</select> <label>Complete drug </label> <select id="complete"
					name="complete">


				</select> </br> </br> <label>Regimen options</label> <select id="optionss"
					name="optionss" onchange="show_value(this.value);">


				</select> </br> </br> </br> <label>Drugs</label> <select id="regimendrug1"
					name="regimendrug1">


				</select> <select id="regimendrug2" name="regimendrug2">


				</select> <select id="regimendrug3" name="regimendrug3">


				</select> <select id="regimendrug4" name="regimendrug4">


				</select> <input class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tregimen">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>C name</th>
					<th>Drug</th>
					<th>O name</th>
					<th>Drug A</th>
					<th>Drug b</th>
					<th>Drug c</th>
					<th>Void</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>


				</tr>
			</tbody>

		</table>
	</DIV>

</body>
</html>