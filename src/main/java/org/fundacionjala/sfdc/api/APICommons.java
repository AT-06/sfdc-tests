package org.fundacionjala.sfdc.api;

import io.restassured.response.Response;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * APICommons.java
 * Class with common method to execute an API request.
 */
public final class APICommons {
    private static Map<String, Response> requestResponse = new HashMap<>();

    /**
     * private constructor.
     */
    private APICommons() {

    }

    /**
     * Method to get an element from the response.
     *
     * @param element the response from request.
     * @return a String with the element response
     */
    public static String getElementResponse(final String element) {
        String[] elementSplit = element.split("\\.");
        if (elementSplit.length > 1) {
            Response res = getRequestResponse().get(elementSplit[0]);
            return getElement(res, elementSplit[1]);
        }
        return "";
    }

    /**
     * Method to get map with response.
     *
     * @return the map.
     */
    public static Map<String, Response> getRequestResponse() {
        return requestResponse;
    }

    /**
     * Method to get an element from a response.
     *
     * @param res     the response from request.
     * @param element the element needed from response
     * @return the element value as string.
     */
    public static String getElement(final Response res, final String element) {
        return res.jsonPath().get(element).toString();
    }

    /**
     * Method to build endpoint.
     *
     * @param endPoint response to a request.
     * @return the new endpoint.
     */
    public static String buildEndPoint(final String endPoint) {
        String[] endPointSplit = endPoint.split("/");
        for (int i = 0; i < endPointSplit.length; i++) {
            Pattern pattern = Pattern.compile("(?<=\\[)(.*?)(?=])");
            Matcher matcher = pattern.matcher(endPointSplit[i]);
            if (matcher.find()) {
                endPointSplit[i] = getElementResponse(matcher.group(1));
            }

        }
        return String.join("/", endPointSplit);
    }

    /**
     * Method to save response from request into a hashmap.
     *
     * @param variableName the key name of the response.
     * @param response     the response from request.
     */
    public static void saveResponse(final String variableName, final Response response) {
        requestResponse.put(variableName, response);
    }
}
