package be.howest.ti.mars.web.bridge;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.User;
import io.vertx.core.http.HttpHeaders;
import io.vertx.core.json.Json;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.RoutingContext;

import java.util.List;

/**
 * The Response class is responsible for translating the result of the controller into
 * JSON responses with an appropriate HTTP code.
 */
public class Response {

    private Response() { }

    public static void sendUser(RoutingContext ctx, User user) {
        sendOkJsonResponse(ctx, JsonObject.mapFrom(user));
    }

    public static void sendIncidents(RoutingContext ctx, List<Incident> incidents) {
        sendJsonResponse(ctx, 200, incidents);
    }

    public static void sendUsers(RoutingContext ctx, List<User> users) {
        sendJsonResponse(ctx, 200, users);
    }

    public static void sendIncident(RoutingContext ctx, Incident incident) {
        sendOkJsonResponse(ctx, JsonObject.mapFrom(incident));
    }

    private static void sendOkJsonResponse(RoutingContext ctx, JsonObject response) {
        sendJsonResponse(ctx, 200, response);
    }

    public static void sendJsonResponse(RoutingContext ctx, int statusCode, Object response) {
        ctx.response()
                .putHeader(HttpHeaders.CONTENT_TYPE, "application/json")
                .setStatusCode(statusCode)
                .end(Json.encodePrettily(response));
    }

    public static void sendFailure(RoutingContext ctx, int code, String quote) {
        sendJsonResponse(ctx, code, new JsonObject()
                .put("failure", code)
                .put("cause", quote));
    }
}
