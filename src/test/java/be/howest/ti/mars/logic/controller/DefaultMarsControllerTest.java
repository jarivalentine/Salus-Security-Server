package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.data.Repositories;
import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Subscription;
import be.howest.ti.mars.logic.domain.User;
import io.vertx.core.json.JsonObject;
import nl.martijndwars.webpush.PushService;
import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.*;

import java.security.NoSuchProviderException;
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
        int sizeOfBystanders = 3;
        //Assert
        assertEquals(sizeOfBystanders, bystanders.size());
    }

    @Test
    void getAggressorsFromIncident(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<User> aggressors = sut.getAggressorFromIncident(1);
        int firstUser = 0;
        String aggressorId = "1976-11-09_MA";
        //Assert
        assertEquals(aggressorId, aggressors.get(firstUser).getId());
    }

    @Test
    void validateUser(){
        // Arrange
        MarsController sut = new DefaultMarsController();
        String userId = "1976-11-09_MA";
        String type = "Murder";

        // Act
        boolean validateUser = sut.validateUser(userId, type);
        //Assert
        assertTrue(validateUser);
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

    @Test
    void getUserException() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        //Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.getUser("INVALID_ID"));
    }

    @Test
    void getIncidentsFromUser() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<Incident> incidents = sut.getIncidentsFromUser("1989-01-28_AL");

        //Assert
        assertNotEquals(Collections.EMPTY_LIST, incidents);
    }

    @Test
    void getIncidentsFromUserException() {
        // Arrange
        MarsController sut = new DefaultMarsController();
        //Act
        List<Incident> incidents = sut.getIncidentsFromUser("INVALID_ID");

        //Assert
        assertEquals(Collections.EMPTY_LIST, incidents);
    }

    @Test
    void subscribeUserException(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        //Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.subscribeUser("INVALID_ID"));
    }

    @Test
    void unSubscribeUserException(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        int validIncidentId = 1;
        int inValidIncidentId = -1;
        String validUserId = "";
        String inValidUserId = "";

        // Assert
        assertThrows(NoSuchElementException.class, () -> sut.helpIncident(validUserId, inValidIncidentId));
        assertThrows(NoSuchElementException.class, () -> sut.helpIncident(inValidUserId, validIncidentId));
    }

    @Test
    void helpIncident(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        //Act
        Incident helpedIncident = sut.helpIncident("1989-01-28_AL", 1);
        Incident incident = sut.getIncident(1);

        //Assert
        assertEquals(incident, helpedIncident);
    }

    @Test
    void getHelpedIncidentsException(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        //Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.getHelpedIncidents("INVALID_ID"));
    }

}
