<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
</head>
<body>

	<DIV id="dstrength">
		<form id="strengthvoid" action="#">
			<fieldset>

				<legend>Strength Void reason</legend>

				<label>Reason</label> <input type="text" name="strengthreason"
					id="strengthreason" class="required" /> <input type="hidden"
					name="strengthuuidvoid" id="strengthuuidvoid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<form id="strength" action="#">
			<fieldset>

				<legend>strength</legend>

				<label for="engine">Strength name</label> <input type="text"
					name="strengthname" id="strengthname" class="required" /> <input
					type="hidden" name="strengthedit" id="strengthedit" value="false" />
				<input type="hidden" name="strengthuuid" id="strengthuuid" /> <input
					class="submit" type="submit" value="Submit" />
			</fieldset>
		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tstrength">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Strength name</th>
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