<h2>Endpoint</h2>
GET https://ben-joseph-peerstreet-api.herokuapp.com/zip_codes

<h2>Query Parameter</h2>
<table>
	<th>Parameter</th>
	<th>Value</th>
	<tr>
		<td>zip</td>
		<td>Required. Integer.</td>
	</tr>
</table>
<h2>Response</h2>
The response will contain a list of zip entries in JSON format. These are contain CBSA information related to that zip code.
<table>
	<th>Key</th>
	<th>Type</th>
    <th>Description</th>
    <tr>
		<td>zip</td>
		<td>integer</td>
        <td>The zip provided in the request.</td>
	</tr>
    <tr>
		<td>cbsa</td>
		<td>integer</td>
        <td>CBSA corresponding to provided zip.</td>
	</tr>
    <tr>
		<td>msa</td>
		<td>string</td>
        <td>MSA corresponding to provided zip.</td>
	</tr>
    <tr>
		<td>population_2015</td>
		<td>integer</td>
        <td>MSA population in 2015.</td>
	</tr>
    <tr>
		<td>population_2014</td>
		<td>integer</td>
        <td>MSA population in 2014.</td>
	</tr>
</table>
<h2> Sample Request and Response </h2>
Request:
https://ben-joseph-peerstreet-api.herokuapp.com/zip_codes?zip=48415
Response:

```
{
    "zip_entries": [
        {
            "zip": 48415,
            "cbsa": 99999,
            "msa": null,
            "population_2015": null,
            "population_2014": null
        },
        {
            "zip": 48415,
            "cbsa": 22420,
            "msa": "Flint, MI",
            "population_2015": 410849,
            "population_2014": 412934
        },
        {
            "zip": 48415,
            "cbsa": 40980,
            "msa": "Saginaw, MI",
            "population_2015": 193307,
            "population_2014": 195142
        }
    ]
}
```