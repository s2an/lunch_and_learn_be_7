User Story
Request
You will be using the Air Quality, Open Weather API to search for current air quality in the capital city of the country that the user provided.

Your endpoint should follow this format:

GET /api/v1/air_quality?country=India
Please do not deviate from the names of the endpoint or query parameters. Be sure it is called "air_quality" and "country", respectively.

Response
Your API will return:

A JSON object with a data key that the top level
The data key should hold an object that has the following keys:
id, always set to null
type, always set to air_quality
attributes, an object that has the following keys:
air quality index (aqi)
datetime
readable air quality (use this scale on the docs to configure your logic for this data)
Your response should be in the format below:

{
    "data": {
        "id": null,
        "type": "air_quality",
        "attributes": {
            "aqi": 5,
            "datetime": 1668523285,
            "readable_aqi": "Very Poor"
        }
    }
}
Notes:
Presume that your user will give a valid country. (you can handle edge cases later)
You will need to use the RESTful Countries API to identify the lat and lon (latitude & longitude) of the capital city for the user-provided country.
For the Open Weather API, use the Current Air Pollution endpoint.
For testing purposes, the following countries can be used for 'Happy Path' testing: France, Kenya, Peru, India