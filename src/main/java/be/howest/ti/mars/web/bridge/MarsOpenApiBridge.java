package be.howest.ti.mars.web.bridge;

import be.howest.ti.mars.logic.controller.DefaultMarsController;
import be.howest.ti.mars.logic.controller.MarsController;
import be.howest.ti.mars.web.exceptions.MalformedRequestException;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.handler.CorsHandler;
import io.vertx.ext.web.openapi.RouterBuilder;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * In the MarsOpenApiBridge class you will create one handler-method per API operation.
 * The job of the "bridge" is to bridge between JSON (request and response) and Java (the controller).
 * <p>
 * For each API operation you should get the required data from the `Request` class.
 * The Request class will turn the HTTP request data into the desired Java types (int, String, Custom class,...)
 * This desired type is then passed to the controller.
 * The return value of the controller is turned to Json or another Web data type in the `Response` class.
 */
public class MarsOpenApiBridge {
    private static final Logger LOGGER = Logger.getLogger(MarsOpenApiBridge.class.getName());
    private final MarsController controller;

    public Router buildRouter(RouterBuilder routerBuilder) {
        LOGGER.log(Level.INFO, "Installing cors handlers");
        routerBuilder.rootHandler(createCorsHandler());

        LOGGER.log(Level.INFO, "Installing failure handlers for all operations");
        routerBuilder.operations().forEach(op -> op.failureHandler(this::onFailedRequest));

        LOGGER.log(Level.INFO, "Installing handler for: getUsers");
        routerBuilder.operation("getUsers").handler(this::getUsers);


        LOGGER.log(Level.INFO, "Installing handler for: getUser");
        routerBuilder.operation("getUser").handler(this::getUser);

        LOGGER.log(Level.INFO, "Installing handler for: getIncidents");
        routerBuilder.operation("getIncidents").handler(this::getIncidents);

        LOGGER.log(Level.INFO, "Installing handler for: getIncident");
        routerBuilder.operation("getIncident").handler(this::getIncident);

        LOGGER.log(Level.INFO, "Installing handler for: createIncident");
        routerBuilder.operation("createIncident").handler(this::createIncident);

        LOGGER.log(Level.INFO, "Installing handler for: getAllIncidentsByUserId");
        routerBuilder.operation("getAllIncidentsByUserId").handler(this::getAllIncidentsByUserId);

        LOGGER.log(Level.INFO, "Installing handler for: subscribeUser");
        routerBuilder.operation("subscribeUser").handler(this::subscribeUser);

        LOGGER.log(Level.INFO, "Installing handler for: unSubscribeUser");
        routerBuilder.operation("unSubscribeUser").handler(this::unSubscribeUser);

        LOGGER.log(Level.INFO, "Installing handler for: helpUserByIdByIncidentId");
        routerBuilder.operation("helpUserByIdByIncidentId").handler(this::helpUserByIdByIncidentId);

        LOGGER.log(Level.INFO, "Installing handler for: getAllHelpedIncidentsByUserId");
        routerBuilder.operation("getAllHelpedIncidentsByUserId").handler(this::getAllHelpedIncidentsByUserId);

        LOGGER.log(Level.INFO, "Installing handler for: getBystandersByIncidentId");
        routerBuilder.operation("getBystandersByIncidentId").handler(this::getBystandersByIncidentId);

        LOGGER.log(Level.INFO, "Installing handler for: getAggressorsByIncidentId");
        routerBuilder.operation("getAggressorsByIncidentId").handler(this::getAggressorsByIncidentId);

        LOGGER.log(Level.INFO, "Installing handler for: deleteIncident");
        routerBuilder.operation("deleteIncident").handler(this::deleteIncident);

        LOGGER.log(Level.INFO, "Installing handler for: validateIncident");
        routerBuilder.operation("validateIncident").handler(this::validateIncident);

        LOGGER.log(Level.INFO, "Installing handler for: validateUser");
        routerBuilder.operation("validateUser").handler(this::validateUser);

        LOGGER.log(Level.INFO, "All handlers are installed, creating router.");
        return routerBuilder.createRouter();
    }

    public MarsOpenApiBridge() {
        this.controller = new DefaultMarsController();
    }

    public MarsOpenApiBridge(MarsController controller) {
        this.controller = controller;
    }

    private void getUsers(RoutingContext ctx) {
        Response.sendUsers(ctx, controller.getUsers());
    }

    private void subscribeUser(RoutingContext ctx) {
        Request request = Request.from(ctx);
        String id = request.getUserId();
        Response.sendUser(ctx, controller.subscribeUser(id));
    }

    private void validateIncident(RoutingContext ctx) {
        int incidentId = Request.from(ctx).getIncidentId();
        String userId = Request.from(ctx).getUserId();
        Response.sendIncident(ctx, controller.validateIncident(incidentId, userId));
    }

    private void unSubscribeUser(RoutingContext ctx) {
        Request request = Request.from(ctx);
        String id = request.getUserId();
        Response.sendUser(ctx, controller.unSubscribeUser(id));
    }

    private void getUser(RoutingContext ctx) {
        String id = Request.from(ctx).getUserId();
        Response.sendUser(ctx, controller.getUser(id));
    }

    private void getAllIncidentsByUserId(RoutingContext ctx) {
        String id = Request.from(ctx).getUserId();
        Response.sendIncidents(ctx, controller.getIncidentsFromUser(id));
    }

    private void deleteIncident(RoutingContext ctx) {
        int incidentId = Request.from(ctx).getIncidentId();
        controller.removeIncident(incidentId);
        JsonObject response = new JsonObject().put("Incident removed", incidentId);
        Response.sendJsonResponse(ctx, 200, response);
    }

    private void validateUser(RoutingContext ctx) {
        String userId = Request.from(ctx).getUserId();
        String type = Request.from(ctx).getType();
        JsonObject response = new JsonObject().put(userId, controller.validateUser(userId, type));
        Response.sendJsonResponse(ctx, 200, response);
    }

    private void getBystandersByIncidentId(RoutingContext ctx) {
        int incidentId = Request.from(ctx).getIncidentId();
        Response.sendUsers(ctx, controller.getBystandersFromIncident(incidentId));
    }

    private void getAggressorsByIncidentId(RoutingContext ctx) {
        int incidentId = Request.from(ctx).getIncidentId();
        Response.sendUsers(ctx, controller.getAggressorFromIncident(incidentId));
    }

    private void getAllHelpedIncidentsByUserId(RoutingContext ctx) {
        String id = Request.from(ctx).getUserId();
        Response.sendIncidents(ctx, controller.getHelpedIncidents(id));
    }

    private void helpUserByIdByIncidentId(RoutingContext ctx) {
        String id = Request.from(ctx).getUserId();
        int incidentId = Request.from(ctx).getIncidentId();
        Response.sendIncident(ctx, controller.helpIncident(id, incidentId));
    }

    private void createIncident(RoutingContext ctx) {
        String reportedId = Request.from(ctx).getReportedId();
        String latitude = Request.from(ctx).getLatitude();
        String longitude = Request.from(ctx).getLongitude();

        Response.sendIncident(ctx, controller.createIncident(reportedId, latitude, longitude));
    }

    private void getIncidents(RoutingContext ctx){
        Response.sendIncidents(ctx, controller.getIncidents());
    }

    private void getIncident(RoutingContext ctx) {
        int incidentId = Request.from(ctx).getIncidentId();
        Response.sendIncident(ctx, controller.getIncident(incidentId));
    }

    private void onFailedRequest(RoutingContext ctx) {
        Throwable cause = ctx.failure();
        int code = ctx.statusCode();
        String quote = Objects.isNull(cause) ? "" + code : cause.getMessage();

        // Map custom runtime exceptions to a HTTP status code.
        LOGGER.log(Level.INFO, "Failed request", cause);
        if (cause instanceof IllegalArgumentException) {
            code = 400;
        } else if (cause instanceof MalformedRequestException) {
            code = 400;
        } else if (cause instanceof NoSuchElementException) {
            code = 404;
        } else {
            LOGGER.log(Level.WARNING, "Failed request", cause);
        }

        Response.sendFailure(ctx, code, quote);
    }

    private CorsHandler createCorsHandler() {
        return CorsHandler.create(".*.")
                .allowedHeader("x-requested-with")
                .allowedHeader("Access-Control-Allow-Origin")
                .allowedHeader("Access-Control-Allow-Credentials")
                .allowCredentials(true)
                .allowedHeader("origin")
                .allowedHeader("Content-Type")
                .allowedHeader("Authorization")
                .allowedHeader("accept")
                .allowedMethod(HttpMethod.HEAD)
                .allowedMethod(HttpMethod.GET)
                .allowedMethod(HttpMethod.POST)
                .allowedMethod(HttpMethod.OPTIONS)
                .allowedMethod(HttpMethod.PATCH)
                .allowedMethod(HttpMethod.DELETE)
                .allowedMethod(HttpMethod.PUT);
    }
}
