package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Quote;
import be.howest.ti.mars.logic.domain.User;

import java.util.List;

public interface MarsController {
    Quote getQuote(int quoteId);

    Quote createQuote(String quote);

    Quote updateQuote(int quoteId, String quote);

    void deleteQuote(int quoteId);
    List<Incident> getIncidents();
    User getUser(String id);

    Incident createIncident(String reportedId, String latitude, String longitude);
    Incident getIncident(int incidentId);
    List<Incident> getIncidentsFromUser(String id);
    User subscribeUser(String id);
    User unSubscribeUser(String id);
    Incident helpIncident(String id, int incidentId);
    List<Incident> getHelpedIncidents(String id);
}
