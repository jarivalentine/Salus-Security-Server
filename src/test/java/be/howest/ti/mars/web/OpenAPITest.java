package be.howest.ti.mars.web;

import be.howest.ti.mars.logic.controller.MockMarsController;
import be.howest.ti.mars.logic.data.Repositories;
import be.howest.ti.mars.web.bridge.MarsOpenApiBridge;
import be.howest.ti.mars.web.bridge.MarsRtcBridge;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.client.WebClient;
import io.vertx.junit5.VertxExtension;
import io.vertx.junit5.VertxTestContext;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.platform.commons.util.StringUtils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(VertxExtension.class)
@SuppressWarnings({"PMD.JUnitTestsShouldIncludeAssert","PMD.AvoidDuplicateLiterals"})
/*
 * PMD.JUnitTestsShouldIncludeAssert: VertxExtension style asserts are marked as false positives.
 * PMD.AvoidDuplicateLiterals: Should all be part of the spec (e.g., urls and names of req/res body properties, ...)
 */
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class OpenAPITest {

    private static final int PORT = 8080;
    private static final String HOST = "localhost";
    public static final String MSG_200_EXPECTED = "If all goes right, we expect a 200 status";
    public static final String MSG_201_EXPECTED = "If a resource is successfully created.";
    public static final String MSG_204_EXPECTED = "If a resource is successfully deleted";
    private Vertx vertx;
    private WebClient webClient;

    @BeforeAll
    void deploy(final VertxTestContext testContext) {
        Repositories.shutdown();
        vertx = Vertx.vertx();

        WebServer webServer = new WebServer(new MarsOpenApiBridge(new MockMarsController()), new MarsRtcBridge());
        vertx.deployVerticle(
                webServer,
                testContext.succeedingThenComplete()
        );
        webClient = WebClient.create(vertx);
    }

    @AfterAll
    void close(final VertxTestContext testContext) {
        vertx.close(testContext.succeedingThenComplete());
        webClient.close();
        Repositories.shutdown();
    }

    @Test
    void getUser(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/users/1989-01-28_AL").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonObject().getString("firstname")),
                            "Adison"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getUsers(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/users").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonArray().getJsonObject(0).getString("id")),
                            "1989-01-28_AL"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void subscribeUser(final VertxTestContext testContext) {
        webClient.put(PORT, HOST, "/api/users/1989-01-28_AL/subscribe").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    System.out.println(response.bodyAsJsonObject());
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonObject().getBoolean("subscribed"))),
                            String.valueOf(true)
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void unSubscribeUser(final VertxTestContext testContext) {
        webClient.put(PORT, HOST, "/api/users/1989-01-28_AL/unsubscribe").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonObject().getBoolean("subscribed"))),
                            String.valueOf(false)
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getIncidentsFromUserId(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/users/1989-01-28_AL/incidents").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonArray().getJsonObject(0).getString("reporterId")),
                            "1989-01-28_AL"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getIncidents(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/incidents").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonArray().getJsonObject(0).getString("reporterId")),
                            "1989-01-28_AL"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getIncident(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/incidents/1").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonObject().getString("reporterId")),
                            "1989-01-28_AL"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getBystandersFromIncident(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/incidents/1/bystanders").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonArray().getJsonObject(0).getString("id"))),
                            "2000-08-12_DJ"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getAggressorsFromIncident(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/incidents/1/aggressors").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonArray().getJsonObject(0).getString("id"))),
                            "1976-11-09_MA"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void createIncident(final VertxTestContext testContext) {
        JsonObject body = new JsonObject()
                .put("latitude", "53")
                .put("longitude", "3")
                .put("reporterId", "1989-01-28_AL");
        webClient.post(PORT, HOST, "/api/incidents").sendJsonObject(body)
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    System.out.println(response.bodyAsString());
                    assertTrue(
                            StringUtils.isNotBlank(response.bodyAsJsonObject().getString("reporterId")),
                            "1989-01-28_AL"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void helpIncident(final VertxTestContext testContext) {
        webClient.post(PORT, HOST, "/api/users/1989-01-28_AL/incidents/1/help").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonObject().getInteger("id"))),
                            "1"
                    );
                    testContext.completeNow();
                }));
    }

    @Test
    void getHelpedIncidents(final VertxTestContext testContext) {
        webClient.get(PORT, HOST, "/api/users/1978-12-22_JVD/incidents/helped").send()
                .onFailure(testContext::failNow)
                .onSuccess(response -> testContext.verify(() -> {
                    assertEquals(200, response.statusCode(), MSG_200_EXPECTED);
                    assertTrue(
                            StringUtils.isNotBlank(String.valueOf(response.bodyAsJsonArray().getJsonObject(0).getString("id"))),
                            "1"
                    );
                    testContext.completeNow();
                }));
    }
}