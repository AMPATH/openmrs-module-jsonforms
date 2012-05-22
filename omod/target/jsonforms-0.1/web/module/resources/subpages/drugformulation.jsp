<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="dformulation">

		<form id="formulationvoid" method="POST" action="">
			<fieldset>

				<legend>Formulation Void reason</legend>

				<label for="engine">Reason</label> <input type="text" name="reason"
					id="reason" class="required" /> <input type="hidden"
					name="uuidvoid" id="uuidvoid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="formulation" action="#">
			<fieldset>

				<legend>Formulation</legend>

				<label for="engine">Formulation name</label> <input type="text"
					name="formulationname" id="formulationname" class="required" /> <input
					type="hidden" name="edit" id="edit" value="false" /> <input
					type="hidden" name="uuid" id="uuid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tformulation">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Formulation name</th>
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