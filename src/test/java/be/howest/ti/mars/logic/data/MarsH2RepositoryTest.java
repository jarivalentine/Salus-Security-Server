package be.howest.ti.mars.logic.data;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.State;
import be.howest.ti.mars.logic.domain.User;
import io.vertx.core.json.JsonObject;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.*;


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
        int lengthOfIncidentsList = 115;
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

    @Test
    void insertIncident(){
        //Arrange
        String reporterId = "1992-02-04_SH";
        String latitude = "2.4243";
        String longitude = "52.9875";
        int newIncidentId = 116;
        //Act
        Incident incident = Repositories.getH2Repo().insertIncident(reporterId, latitude, longitude);
        //Assert
        Assertions.assertEquals(reporterId, incident.getReporterId());
        Assertions.assertEquals(latitude, incident.getLatitude());
        Assertions.assertEquals(longitude, incident.getLongitude());
        Assertions.assertEquals(newIncidentId, incident.getId());
        Assertions.assertEquals(State.ACTIVE, incident.getState());
        Assertions.assertNotEquals(Collections.EMPTY_LIST, incident.getLabels());
    }

    @Test
    void helpIncidentAndGetBystandersFromIncident(){
        //Arrange
        String userId = "1989-01-28_AL";
        int incidentId = 5;
        int lengthOfIncidentBystandersList = 1;
        //Act
        Repositories.getH2Repo().helpIncident(userId, incidentId);
        List<User> bystanders = Repositories.getH2Repo().getBystandersFromIncident(incidentId);
        User user = Repositories.getH2Repo().getUser(userId);
        //Assert
        Assertions.assertEquals(lengthOfIncidentBystandersList, bystanders.size());
        Assertions.assertTrue(bystanders.contains(user));
    }

    @Test
    void getHelpedIncidents(){
        //Arrange
        String userId = "1989-01-28_AL";
        int incidentId = 5;
        int amountOfHelpedIncidents = 12;
        //Act + Assert
        List<Incident> helpedIncidentsBefore = Repositories.getH2Repo().getHelpedIncidents(userId);
        Assertions.assertEquals(amountOfHelpedIncidents, helpedIncidentsBefore.size());

        Repositories.getH2Repo().helpIncident(userId, incidentId);

        List<Incident> helpedIncidentsAfter = Repositories.getH2Repo().getHelpedIncidents(userId);
        Assertions.assertEquals(amountOfHelpedIncidents + 1, helpedIncidentsAfter.size());
    }

    @Test
    void getAggressorsFromIncident(){
        //Arrange
        int incidentId = 1;
        String aggressorId = "1976-11-09_MA";
        //Act
        List<User> aggressorsFromIncident = Repositories.getH2Repo().getAggressorFromIncident(incidentId);
        List<User> aggressors = List.of(Repositories.getH2Repo().getUser(aggressorId));
        //Assert
        Assertions.assertEquals(aggressors, aggressorsFromIncident);
    }

    @Test
    void getUsers(){
        //Arrange
        int lengthOfUsersList = 10;
        //Act
        List<User> users = Repositories.getH2Repo().getUsers();
        //Assert
        Assertions.assertEquals(lengthOfUsersList, users.size());
    }

    @Test
    void validateIncident(){
        //Arrange
        int incidentId = 2;
        String userId = "1989-01-28_AL";
        //Act
        Incident incident = Repositories.getH2Repo().validateIncident(incidentId, userId);
        //Assert
        Assertions.assertNotEquals(State.ACTIVE, incident.getState());
    }

    @Test
    void validateIncidentInvalidUser(){
        //Arrange
        int incidentId = 1;
        String userId = "1978-12-22_JVD"; //not the reporter of incident 1.
        //Act + Assert
        Assertions.assertThrows(IllegalArgumentException.class, () -> Repositories.getH2Repo().validateIncident(incidentId, userId));
    }

    @Test
    void validateIncidentThatHasBeenValidatedAlready(){
        //Arrange
        int incidentId = 1;
        String userId = "1989-01-28_AL";
        //Act + Assert
        Assertions.assertThrows(IllegalArgumentException.class, () -> Repositories.getH2Repo().validateIncident(incidentId, userId));
    }

    @Test
    void validateUser(){
        //Arrange
        String userId = "1976-11-09_MA";
        String type = "Murder";

        //Act
        boolean validUser = Repositories.getH2Repo().validateUser(userId, type);
        //Assert
        Assertions.assertTrue(validUser);
    }
}
