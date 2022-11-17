package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Quote;
import be.howest.ti.mars.logic.domain.User;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class MockMarsController implements MarsController {
    private static final String SOME_QUOTE = "quote";
    @Override
    public Quote getQuote(int quoteId) {
        return new Quote(quoteId, SOME_QUOTE);
    }

    @Override
    public Quote createQuote(String quote) {
        return new Quote(1, quote);
    }

    @Override
    public Quote updateQuote(int quoteId, String quote) {
        return new Quote(quoteId, quote);
    }

    @Override
    public void deleteQuote(int quoteId) {
    }

    @Override
    public List<Incident> getIncidents() {
        return List.of(new Incident("1989-01-28_AL", "3", "53"));
    }

    @Override
    public User getUser(String id) {
        return new User(id, "Adison", "Lopez", false);
    }

    @Override
    public Incident createIncident(String reportedId, String latitude, String longitude) {
        return new Incident(longitude, latitude, reportedId);
    }

    @Override
    public Incident getIncident(int incidentId) {
        Incident incident = getIncidents().get(0);
        incident.setId(1);
        return incident;
    }

    @Override
    public List<Incident> getIncidentsFromUser(String id){
        return getIncidents()
                .stream()
                .filter(incident -> Objects.equals(incident.getReporterId(), id))
                .collect(Collectors.toList());
    }

    @Override
    public User subscribeUser(String id) {
        User user = getUser(id);
        user.subscribe();
        return user;
    }

    @Override
    public User unSubscribeUser(String id) {
        User user = getUser(id);
        user.unsubscribe();
        return user;
    }

    @Override
    public Incident helpIncident(String id, int incidentId) {
        return getIncident(incidentId);
    }

    @Override
    public List<Incident> getHelpedIncidents(String id) {
        return null;
    }

}
