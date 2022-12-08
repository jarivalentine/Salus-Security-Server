package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.data.Repositories;
import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.User;
import io.vertx.core.json.JsonObject;
import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class DefaultMarsControllerTest {

    private static final String URL = "jdbc:h2:./db-11";

    @BeforeAll
    void setupTestSuite() {
        Repositories.shutdown();
        JsonObject dbProperties = new JsonObject(Map.of("url", "jdbc:h2:./db-11",
                "username", "",
                "password", "",
                "webconsole.port", 9000));
        Repositories.configure(dbProperties);
    }

    @BeforeEach
    void setupTest() {
        Repositories.getH2Repo().generateData();
    }

    @Test
    void getUser() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        User user = sut.getUser("1989-01-28_AL");

        //Assert
        assertTrue(user != null && StringUtils.isNoneBlank(user.getId()));
    }

    @Test
    void subscribeUser() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        User user = sut.subscribeUser("1989-01-28_AL");

        //Assert
        assertTrue(user != null && user.isSubscribed());
    }

    @Test
    void unSubscribeUser() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        User user = sut.unSubscribeUser("1989-01-28_AL");

        //Assert
        assertTrue(user != null && !user.isSubscribed());
    }

    @Test
    void getIncidents() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        var incidents = sut.getIncidents();

        //Assert
        assertTrue(incidents != null && incidents.size() > 0);
    }

    @Test
    void createIncident() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        Incident createdIncident = sut.createIncident("1989-01-28_AL", "50", "50");

        //Assert
        assertTrue(createdIncident != null && StringUtils.isNoneBlank(createdIncident.getReporterId()));
    }

    @Test
    void getAllHelpedIncidentsFromUser() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<Incident> helpedIncidents = sut.getHelpedIncidents("1989-01-28_AL");

        //Assert
        assertEquals(Collections.EMPTY_LIST, helpedIncidents);
    }

    @Test
    void getBystandersFromIncident(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<User> bystanders = sut.getBystandersFromIncident(1);
        int size_of_bystanders = 3;
        //Assert
        assertEquals(size_of_bystanders, bystanders.size());
    }

    @Test
    void getAggressorsFromIncident(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<User> aggressors = sut.getAggressorFromIncident(1);
        int first_user = 0;
        String aggressor_id = "1976-11-09_MA";
        //Assert
        assertEquals(aggressor_id, aggressors.get(first_user).getId());
    }

    @Test
    void getUsers(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<User> allUsers = sut.getUsers();

        //Assert
        assertNotEquals(Collections.EMPTY_LIST, allUsers);
    }

}
