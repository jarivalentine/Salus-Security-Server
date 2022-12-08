package be.howest.ti.mars.logic.data;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.User;
import be.howest.ti.mars.logic.exceptions.RepositoryException;
import io.vertx.core.json.JsonObject;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import static org.junit.Assert.*;

class MarsH2RepositoryTest {
    private static final String URL = "jdbc:h2:./db-11";

    @BeforeEach
    void setupTestSuite() {
        Repositories.shutdown();
        JsonObject dbProperties = new JsonObject(Map.of("url",URL,
                "username", "",
                "password", "",
                "webconsole.port", 9000 ));
        Repositories.configure(dbProperties);
    }

    @Test
    void getIncidents(){
        // Arrange
        int lengthOfIncidentsList = 7;
        // Act
        List<Incident> incidentList = Repositories.getH2Repo().getIncidents();
        //Assert
        Assertions.assertEquals(lengthOfIncidentsList, incidentList.size());
    }

    @Test
    void getLabelsFromIncidents(){
        // Arrange
        int incidentId = 1;
        List<String> listOfLabels = List.of("Armed", "Child Danger", "Critical Condition");
        // Act
        Incident incidentFromDB = Repositories.getH2Repo().getIncidents().stream().filter(incident -> incident.getId() == incidentId).findAny().orElseThrow(() -> new NoSuchElementException("Incident with this id doesn't exist"));
        ;
        //Assert
        Assertions.assertEquals(listOfLabels, incidentFromDB.getLabels());
    }

    @Test
    void getExceptionFromOneIncident(){
        // Arrange
        int incidentId = -1;

        //Act + Assert
        Assertions.assertThrows(NoSuchElementException.class, () -> Repositories.getH2Repo().getIncidents().stream().filter(incident -> incident.getId() == incidentId).findAny().orElseThrow(() -> new NoSuchElementException("Incident with this id doesn't exist")));
    }

    @Test
    void getUser(){
        //Arrange
        String userId = "1989-01-28_AL";
        String firstname = "Adison";
        String lastname = "Lopez";
        boolean subscribed = false;
        //Act
        User user = Repositories.getH2Repo().getUser(userId);
        //Assert
        Assertions.assertEquals(firstname, user.getFirstname());
        Assertions.assertEquals(lastname, user.getLastname());
        Assertions.assertEquals(subscribed, user.isSubscribed());
    }

    @Test
    void subscribeUser(){
        //Arrange
        String userId = "1989-01-28_AL";
        boolean subscribed = true;
        //Act
        User user = Repositories.getH2Repo().subscribeUser(userId);
        //Assert
        Assertions.assertEquals(subscribed, user.isSubscribed());

    }

    @Test
    void unSubscribeUser(){
        //Arrange
        String userId = "1989-01-28_AL";
        boolean subscribed = false;
        //Act
        User user = Repositories.getH2Repo().unSubscribeUser(userId);
        //Assert
        Assertions.assertEquals(subscribed, user.isSubscribed());

    }

/* STILL NEEDED, NO TESTS MADE YET USING OUR VERSION
    @Test
    void getQuote() {
        // Arrange
        int id = 1;

        // Act
        Quote quote = Repositories.getH2Repo().getQuote(id);

        // Assert
        Assertions.assertTrue(quote != null && !StringUtil.isNullOrEmpty(quote.getValue()));
    }

    @Test
    void updateQuote() {
        // Arrange
        int id = 1;
        String quoteValue = "some value";

        // Act
        Quote quote = Repositories.getH2Repo().updateQuote(id, quoteValue);

        // Assert
        Assertions.assertNotNull(quote);
        Assertions.assertEquals(quoteValue, quote.getValue());
    }

    @Test
    void insertQuote() {
        // Arrange
        String quoteValue = "some value";

        // Act
        Quote quote = Repositories.getH2Repo().insertQuote(quoteValue);

        // Assert
        Assertions.assertNotNull(quote);
        Assertions.assertEquals(quoteValue, quote.getValue());
    }

    @Test
    void deleteQuote() {
        // Arrange
        int id = 1;

        // Act
        Repositories.getH2Repo().deleteQuote(id);

        // Assert
        Assertions.assertNull(Repositories.getH2Repo().getQuote(id));
    }
*/
}
