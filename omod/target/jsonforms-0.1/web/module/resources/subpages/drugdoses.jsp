<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="ddoses">
		<a href="#" id="adddoses">Add doses </a>
		<form id="dosesvoid" action="#">
			<fieldset>

				<legend>Doses Void reason</legend>

				<label>Reason</label> <input type="text" name="dosesreason"
					id="dosesreason" class="required" /> <input type="hidden"
					name="dosesuuidvoid" id="dosesuuidvoid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="doses" " action="#">
			<fieldset>

				<legend>doses"</legend>


				<input type="hidden" name="dosesedit" id="dosesedit" value="false" />
				<input type="hidden" name="dosesuuid" id="dosesuuid" /> <label>Drug</label>
				<select id="dosesdrug" name="dosesdrug">


				</select> <label>Frequency</label> <select id="dosesfrequency"
					name="dosesfrequency">


				</select> <label>Quantity</label> <input type="text" name="dosequantity"
					id="dosequantity" class="required" />



				<button class="button positive">Add</button>
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tdoses">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Drug name</th>
					<th>Drug frequency</th>
					<th>Drug Quantity</th>
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


				</tr>
			</tbody>

		</table>

	</DIV>

</body>
</html>