<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="dnames">


		<form id="namevoid" method="POST" action="">
			<fieldset>

				<legend>Name Void reason</legend>

				<label for="engine">Reason</label> <input type="text"
					name="namereason" id="namereason" class="required" /> <input
					type="hidden" name="nameuuidvoid" id="nameuuidvoid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="nameform" action="#">
			<fieldset>

				<legend>Name</legend>

				<label for="engine">Drug name</label> <input type="text"
					name="namename" id="namename" class="required" /> <input
					type="hidden" name="nameedit" id="nameedit" value="false" /> <input
					type="hidden" name="nameuuid" id="nameuuid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tname">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Drug name</th>
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