package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Quote;
import be.howest.ti.mars.logic.domain.User;
import java.util.Collections;
import java.util.List;
import io.vertx.core.Future;
import io.vertx.core.Promise;

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
        return List.of(new Incident("53", "3", "1989-01-28_AL")); //these are random values
    }

    public User getUser(String id) {
        return new User(id, "Adison", "Lopez", false);
    }

    @Override
    public Incident createIncident(String reportedId, String latitude, String longitude) {
        return new Incident(longitude, latitude, reportedId);
    }

    @Override
    public Incident getIncident(int incidentId) {
        return getIncidents().get(incidentId);
    }

}
