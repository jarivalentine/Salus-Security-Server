package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.data.Repositories;
import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Quote;
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

        //Assert
        assertEquals(Collections.EMPTY_LIST, bystanders);
    }

    @Test
    void getAggressorsFromIncident(){
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        List<User> aggressors = sut.getAggressorFromIncident(1);

        //Assert
        assertEquals(Collections.EMPTY_LIST, aggressors);
    }

    @Test
    void getQuote() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        Quote quote = sut.getQuote(0);

        //Assert
        assertTrue(quote != null && StringUtils.isNoneBlank(quote.getValue()));
    }

    @Test
    void deleteQuote() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        sut.deleteQuote(0);

        //Assert
        assertThrows(NoSuchElementException.class, () -> sut.getQuote(0));
    }

    @Test
    void updateQuote() {
        // Arrange
        MarsController sut = new DefaultMarsController();
        Quote quote = sut.createQuote("some value");

        // Act
        Quote updatedQuoted = sut.updateQuote(quote.getId(), "new value");

        //Assert
        assertEquals("new value", updatedQuoted.getValue());
    }

    @Test
    void createQuote() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act
        Quote quote = sut.createQuote("new value");

        //Assert
        assertEquals("new value", quote.getValue());
    }

    @Test
    void getQuoteWithUnknownIdThrowsNotFound() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.getQuote(-1));
    }

    @Test
    void createQuoteWithEmptyQuoteThrowsIllegalArgument() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(IllegalArgumentException.class, () -> sut.createQuote(""));
    }

    @Test
    void updateQuoteWithWrongIdThrowsIllegalArgument() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(IllegalArgumentException.class, () -> sut.updateQuote(-1, "some quote"));
    }

    @Test
    void updateQuoteWithUnknownIdThrowsNoSuchElementException() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.updateQuote(1000, "some quote"));
    }

    @Test
    void updateQuoteWithEmptyQuoteThrowsIllegalArgument() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(IllegalArgumentException.class, () -> sut.updateQuote(1, ""));
    }

    @Test
    void deleteQuoteWithUnknownIdThrowsNotFound() {
        // Arrange
        MarsController sut = new DefaultMarsController();

        // Act + Assert
        assertThrows(NoSuchElementException.class, () -> sut.deleteQuote(-1));
    }

}
