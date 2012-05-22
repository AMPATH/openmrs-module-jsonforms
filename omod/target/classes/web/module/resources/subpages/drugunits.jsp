<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="dunits">

		<form id="unitsvoid" action="#">
			<fieldset>

				<legend>Units Void reason</legend>

				<label>Reason</label> <input type="text" name="unitsreason"
					id="unitsreason" class="required" /> <input type="hidden"
					name="unitsuuidvoid" id="unitsuuidvoid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="units" action="">
			<fieldset>

				<legend>strength</legend>

				<label for="engine">Strength name</label> <input type="text"
					name="unitsname" id="unitsname" class="required" /> <input
					type="hidden" name="unitsedit" id="unitsedit" value="false" /> <input
					type="hidden" name="unitsuuid" id="unitsuuid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tunits">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Units name</th>
					<th>Void</th>
				</tr>
			</thead>
			<tbody>
				<tr>
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