<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="details">


		<a href="#" id="adddrug">Add drugs </a>
		<form id="drugsvoid" action="#">
			<fieldset>

				<legend>Drugs Void reason</legend>

				<label>Reason</label> <input type="text" name="drugsreason"
					id="drugsreason" class="required" /> <input type="hidden"
					name="drugsuuidvoid" id="drugsuuidvoid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="drugs" action="#">
			<fieldset>

				<legend>Drugs</legend>

				<label>Drug name</label> <select id="drugsname" name="drugsname">


				</select> <input type="hidden" name="drugsedit" id="drugsedit" value="false" />
				<input type="hidden" name="drugsuuid" id="drugsuuid" /> <label>Formulation</label>
				<select id="drugsformulation" name="drugsformulation">


				</select> <label>Strength</label> <select id="drugsstrength"
					name="drugsstrength">

				</select> <label>Units</label> <select id="drugsunits" name="drugsunits">


				</select> <input class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tdrugs">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Drug name</th>
					<td>Formulation</td>
					<td>Strength</td>
					<td>unit</td>

					<th>Void</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>



				</tr>
			</tbody>

		</table>

	</DIV>

</body>
</html>