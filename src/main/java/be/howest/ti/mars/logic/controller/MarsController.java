package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.User;

import java.util.List;

public interface MarsController {
    List<Incident> getIncidents();
    User getUser(String id);
    Incident createIncident(String reportedId, String latitude, String longitude);
    Incident getIncident(int incidentId);
    List<Incident> getIncidentsFromUser(String id);
    User subscribeUser(String id);
    User unSubscribeUser(String id);
    Incident helpIncident(String id, int incidentId);
    List<Incident> getHelpedIncidents(String id);
    List<User> getBystandersFromIncident(int incidentId);
    List<User> getAggressorFromIncident(int incidentId);
    List<User> getUsers();
    void removeIncident(int incidentId);
    Incident validateIncident(int incidentId, String userId);
    boolean validateUser(String userId, String type);
}
