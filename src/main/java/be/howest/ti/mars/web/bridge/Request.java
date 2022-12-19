package be.howest.ti.mars.web.bridge;

import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.validation.RequestParameters;
import io.vertx.ext.web.validation.ValidationHandler;

/**
 * The Request class is responsible for translating information that is part of the
 * request into Java.
 *
 * For every piece of information that you need from the request, you should provide a method here.
 * You can find information in:
 * - the request path: params.pathParameter("some-param-name")
 * - the query-string: params.queryParameter("some-param-name")
 * Both return a `RequestParameter`, which can contain a string or an integer in our case.
 * The actual data can be retrieved using `getInteger()` or `getString()`, respectively.
 * You can check if it is an integer (or not) using `isNumber()`.
 *
 * Finally, some requests have a body. If present, the body will always be in the json format.
 * You can acces this body using: `params.body().getJsonObject()`.
 *
 * **TIP:** Make sure that al your methods have a unique name. For instance, there is a request
 * that consists of more than one "player name". You cannot use the method `getPlayerName()` for both,
 * you will need a second one with a different name.
 */
public class Request {
    public static final String SPEC_USER_ID = "id";
    public static final String SPEC_INCIDENT_USER_ID = "reporterId";
    public static final String SPEC_INCIDENT_LONGITUDE = "longitude";
    public static final String SPEC_INCIDENT_LATITUDE = "latitude";
    private static final String SPEC_INCIDENT_ID = "incidentId";
    private static final String SPEC_TYPE = "type";
    private final RequestParameters params;

    public static Request from(RoutingContext ctx) {
        return new Request(ctx);
    }

    private Request(RoutingContext ctx) {
        this.params = ctx.get(ValidationHandler.REQUEST_CONTEXT_KEY);
    }

    public String getUserId() {
        return params.pathParameter(SPEC_USER_ID).getString();
    }

    public String getReportedId() {
        return params.body().getJsonObject().getString(SPEC_INCIDENT_USER_ID);
    }

    public String getLatitude() {
        return params.body().getJsonObject().getString(SPEC_INCIDENT_LATITUDE);
    }

    public String getLongitude() {
        return params.body().getJsonObject().getString(SPEC_INCIDENT_LONGITUDE);
    }

    public int getIncidentId() {return  params.pathParameter(SPEC_INCIDENT_ID).getInteger();}

    public String getType() {return  params.pathParameter(SPEC_TYPE).getString();}
}
