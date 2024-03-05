User Story
You will be using the "Places API" to search for tourist sites based on the latitude-longitude of the capital city of the country that is provided by the user. Presume that your user will give a valid country (you can handle edge cases later).

Your endpoint should follow this format:

GET /api/v1/tourist_sites?country=France
Please do not deviate from the names of the endpoint or query parameters. Be sure it is called "tourist_sites" and "country", respectively. Your API will return:

A collection of the top 10 closest tourist sites within a reasonable radius of the capital city. (Use the REStful Countries API to find the lat-lon of the capital of a given country).
NOTE: "Reasonable radius" means that tourist sites pertinent to that capital city would be listed first, then descending according to distance. The Places API provides multiple ways to do this, including filter by circle/rectangle/geometry, or bias - either use is fine and is up to you to decide.
Each tourist_site should list its:
name
formatted address
place_id (also from the Place API)
Your response should be in the format below:

{
    "data": [
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Tour de l'horloge",
                "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                "place_id": "51d28..."
            }
        },
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Le Château",
                "address": "Le Château, D 18, 23150 Ahun, France",
                "place_id": "51934..."
            }
        },
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Le Chapître",
                "address": "Le Chapître, Rue du Chapitre, 23200 Aubusson, France",
                "place_id": "517182..."
            }
        },
        ...,
        ...,
    ]
}
Notes:

You will need to use the RESTful Countries API to identify the provided country's lat and lon of the capital city.
For testing purposes, the following countries can be used for 'Happy Path' testing: New Zealand, Latvia, France
For testing purposes, the following countries can be used for 'Sad Path' testing: Ecuador, Uruguay