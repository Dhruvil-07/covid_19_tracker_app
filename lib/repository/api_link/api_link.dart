class ApiLink
{
    //base url for api
    static String base_url = "https://disease.sh/v3/covid-19/";

    // end points
   String worldStatesApi = "${base_url + "all"}" ;
   String countriesList =  "${base_url  + "countries"}";
}