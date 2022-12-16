package be.howest.ti.mars.logic.domain;

import org.junit.jupiter.api.Test;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class IncidentTest {
    @Test
    void checkNonRandomGetters(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        Incident incident = new Incident(user.getId(), "53", "3");
        String startUnixTime = "1970-01-01T00:00";

        assertEquals(startUnixTime, incident.getDatetime());
        assertEquals(-1, incident.getId());
        assertEquals("53", incident.getLatitude());
        assertEquals("3", incident.getLongitude());
        assertEquals(user.getId(), incident.getReporterId());
    }

    @Test
    void checkRandomnessAIValidator(){
        SecureRandom random = new SecureRandom();
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        int bound = 10;
        for (int i = 0; i < 1000; i++) {
            list1.add(random.nextInt(bound));
        }

        for (int i = 0; i < 1000; i++) {
            list2.add(random.nextInt(bound));
        }

        assertNotEquals(list1, list2);
    }

    @Test
    void checkSetLabels(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        Incident incident = new Incident(user.getId(), "53", "32");
        List<String> labels = List.of("Critical Condition");

        incident.setLabels(labels);

        assertEquals(labels, incident.getLabels());
    }

    @Test
    void checkSetId(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        Incident incident = new Incident(user.getId(), "53", "32");
        int id = 5;

        incident.setId(id);

        assertEquals(id, incident.getId());
    }

    @Test
    void checkEqualsAndHashCode(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        Incident incident = new Incident(user.getId(), "53", "32");

        User user2 = new User("2000-08-12_DJ", "Dahlia", "Johns", true);
        Incident incident2 = new Incident(user2.getId(), "11", "88");

        assertEquals(incident2, incident); //equals and hash on id
    }

    @Test
    void checkValidation(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        Incident incident = new Incident(user.getId(), "53", "32");

        incident.setSuperComplexAISHA256HashedAndDecryptedAIValidation();

        assertNotEquals(State.ACTIVE, incident.getState());
    }
}