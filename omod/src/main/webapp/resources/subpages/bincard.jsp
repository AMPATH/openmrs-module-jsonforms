<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>

	<DIV id="dtab_1">




		<a href="#" id="bincardform">Add drugs </a>




		<form id="bincard" name="bincard" action="#">
			<hr color=#1aad9b width="100%">

			<fieldset>

				<legend>Bincard name</legend>
				<input type="hidden" name="binedit" id="binedit" value="false" /> <input
					type="hidden" name="binuuid" id="binuuid" /> <label>Drug</label>
				<select id="bindrug" name="bindrug">


				</select> <br /> <label>Quantity In</label> <input type="text"
					name="binquantityin" id="binquantityin" class="required" /> <label>Max
					value</label> <input type="text" name="binmax" id="binmax" /> <label
					for="engine">Min value</label> <input type="text" name="binmin"
					id="binmin" /><br /> <label for="engine">Comment</label> <input
					type="text" name="bincom" id="bincom" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>

		</form>

		<form id="binvoid" action="#">
			<hr color=#1aad9b width="100%">

			<fieldset>

				<legend> Void reason</legend>

				<label>Reason</label> <input type="text" name="binreason"
					id="binreason" class="required" /> <input type="hidden"
					name="binuuidvoid" id="binuuidvoid" /> <input class="submit"
					type="submit" value="Submit" />
			</fieldset>
			<hr color=#1aad9b width="100%">

		</form>
		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="tbincard">
			<thead>
				<tr>
					<th width="4%">Edit</th>
					<th>UUID</th>
					<th>Drug</th>
					<th>QuantityIn</th>
					<th>Total</th>
					<th>Maxlevel</th>
					<th>Minlevel</th>
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