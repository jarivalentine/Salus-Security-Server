package be.howest.ti.mars.logic.controller;

import be.howest.ti.mars.logic.data.Repositories;
import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Subscription;
import be.howest.ti.mars.logic.domain.User;
import nl.martijndwars.webpush.Notification;
import nl.martijndwars.webpush.PushService;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.GeneralSecurityException;
import java.security.Security;
import java.util.*;
import java.util.stream.Collectors;


import static java.lang.Integer.parseInt;

/**
 * DefaultMarsController is the default implementation for the MarsController interface.
 * The controller shouldn't even know that it is used in an API context..
 * <p>
 * This class and all other classes in the logic-package (or future sub-packages)
 * should use 100% plain old Java Objects (POJOs). The use of Json, JsonObject or
 * Strings that contain encoded/json data should be avoided here.
 * Keep libraries and frameworks out of the logic packages as much as possible.
 * Do not be afraid to create your own Java classes if needed.
 */
public class DefaultMarsController implements MarsController {
    private static final String MSG_USER_ID_UNKNOWN = "No user with id: %s";

    private static final String MSG_INCIDENT_ID_UNKNOWN = "No such incident with incidentId: %d";

    private final Set<Subscription> subscriptions;
    private final PushService pushService;

    public DefaultMarsController() {
        subscriptions = new HashSet<>();
        pushService = new PushService();
        try {
            if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
                Security.addProvider(new BouncyCastleProvider());
            }
            pushService.setSubject("mailto:jari.valentine@student.howest.be");
            pushService.setPrivateKey("AP5pxaIKUir89NHRITzauBdlm7GKwjD4SXyk1fe3QODb");
            pushService.setPublicKey("BDrFN6INkPapFsXAaF5fH4e6-gGKM9dQJYW2-PhzP1lJl9yTMKyQuQy8fZ919EvKjFj-iUMPaZ6Hwdw0ofXXiHc=");
        } catch (GeneralSecurityException e) {
            throw new IllegalStateException("Unable to initialize push service", e);
        }
    }

    public void addSubscription(Subscription subscription) {
        subscriptions.add(subscription);
    }

    @Override
    public List<Incident> getIncidents() {
        List<Incident> incidents = Repositories.getH2Repo().getIncidents();
        if (incidents.isEmpty())
            throw new NoSuchElementException("Could not retrieve incidents");

        return incidents;
    }

    @Override
    public User getUser(String id) {
        if (null == Repositories.getH2Repo().getUser(id))
            throw new NoSuchElementException(String.format(MSG_USER_ID_UNKNOWN, id));

        return Repositories.getH2Repo().getUser(id);
    }

    @Override
    public Incident createIncident(String reportedId, String latitude, String longitude) {
        Incident incident = Repositories.getH2Repo().insertIncident(reportedId, latitude, longitude);
        sendNotification(incident);
        return incident;
    }

    private void sendNotification(Incident incident) {
        subscriptions.forEach(subscription -> {
            try {
                Notification notification = new Notification(
                        subscription.getEndpoint(),
                        subscription.getUserPublicKey(),
                        subscription.getAuthAsBytes(),
                        ("New incident reported by " + getUser(incident.getReporterId()).getFirstname()).getBytes());
                pushService.send(notification);
            } catch (Exception e) { //NOSONAR
                throw new IllegalStateException("Unable to send notification", e);
            }
        });
    }

    @Override
    public Incident getIncident(int incidentId) {
        return getIncidents()
                .stream()
                .filter(incident -> incident.getId() == incidentId)
                .findAny()
                .orElseThrow(() -> new NoSuchElementException(String.format(MSG_INCIDENT_ID_UNKNOWN, incidentId)));
    }

    @Override
    public List<Incident> getIncidentsFromUser(String id) {
        return getIncidents()
                .stream()
                .filter(incident -> Objects.equals(incident.getReporterId(), id))
                .collect(Collectors.toList());
    }

    @Override
    public User subscribeUser(String id) {
        if (Repositories.getH2Repo().getUser(id) == null)
            throw new NoSuchElementException(String.format(MSG_USER_ID_UNKNOWN, id));

        return Repositories.getH2Repo().subscribeUser(id);
    }

    @Override
    public User unSubscribeUser(String id) {
        if (Repositories.getH2Repo().getUser(id) == null)
            throw new NoSuchElementException(String.format(MSG_USER_ID_UNKNOWN, id));

        return Repositories.getH2Repo().unSubscribeUser(id);
    }

    @Override
    public Incident helpIncident(String id, int incidentId) {
        if (Repositories.getH2Repo().getUser(id) == null)
            throw new NoSuchElementException(String.format(MSG_USER_ID_UNKNOWN, id));
        if (getIncident(incidentId) == null)
            throw new NoSuchElementException(String.format(MSG_INCIDENT_ID_UNKNOWN, incidentId));

        return Repositories.getH2Repo().helpIncident(id, incidentId);
    }

    @Override
    public List<Incident> getHelpedIncidents(String id) {
        if (Repositories.getH2Repo().getUser(id) == null)
            throw new NoSuchElementException(String.format(MSG_USER_ID_UNKNOWN, id));
        return Repositories.getH2Repo().getHelpedIncidents(id);
    }

    @Override
    public List<User> getBystandersFromIncident(int incidentId) {
        if (getIncident(incidentId) == null)
            throw new NoSuchElementException(String.format(MSG_INCIDENT_ID_UNKNOWN, incidentId));
        return Repositories.getH2Repo().getBystandersFromIncident(incidentId);
    }

    public List<User> getAggressorFromIncident(int incidentId) {
        if (getIncident(incidentId) == null)
            throw new NoSuchElementException(String.format(MSG_INCIDENT_ID_UNKNOWN, incidentId));
        return Repositories.getH2Repo().getAggressorFromIncident(incidentId);
    }

    @Override
    public List<User> getUsers() {
        return Repositories.getH2Repo().getUsers();
    }

    @Override
    public void removeIncident(int incidentId) {
        Repositories.getH2Repo().removeIncident(incidentId);
    }

    @Override
    public Incident validateIncident(int incidentId) {
        return Repositories.getH2Repo().validateIncident(incidentId);
    }

    @Override
    public boolean validateUser(String userId, String type) {
        return Repositories.getH2Repo().validateUser(userId, type);
    }
}