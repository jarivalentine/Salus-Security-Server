package be.howest.ti.mars.logic.data;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.State;
import be.howest.ti.mars.logic.domain.User;
import be.howest.ti.mars.logic.exceptions.RepositoryException;
import org.h2.tools.Server;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.SecureRandom;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/*
This is only a starter class to use an H2 database.
In this start project there was no need for a Java interface MarsRepository.
Please always use interfaces when needed.

To make this class useful, please complete it with the topics seen in the module OOA & SD
 */

public class MarsH2Repository {
    private static final Logger LOGGER = Logger.getLogger(MarsH2Repository.class.getName());
    private static final String SQL_SELECT_INCIDENTS = "select * from incidents;";
    private static final String SQL_SELECT_LABELS_BY_INCIDENT_ID = "select * from incidents_labels where incidentId = ?;";
    private static final String SQL_USER_BY_ID = "select * from users where id = ?;";
    private static final String SQL_INSERT_INCIDENT = "insert into incidents (`type`, `longitude`, `latitude`, `state`, `reporterId`) values (?, ?, ?, ?, ?);";
    private static final String SQL_INSERT_LABELS = "insert into incidents_labels (label, incidentId) values (?, ?);";
    private static final String SQL_INSERT_BYSTANDER = "insert into bystander_incidents (userId, incidentId) values (?, ?);";
    private static final String SQL_INSERT_AGGRESSORS = "insert into aggressor_incidents (userId, incidentId) values(? ,?);";
    private static final String SQL_UPDATE_SUBSCRIPTION = "update users set subscribed = ? where id = ?;";
    private static final String SQL_SELECT_BYSTANDERS_BY_USER_ID =
            "select i.* from bystander_incidents join incidents i on bystander_incidents.incidentId = i.id where userId = ?;";
    private static final String SQL_SELECT_BYSTANDERS_BY_INCIDENT_ID =
            "select u.* from users u join bystander_incidents bi on bi.userId = u.id where bi.incidentId = ?;";

    private static final String SQL_SELECT_AGGRESSORS_BY_INCIDENT_ID =
            "select u.* from users u join aggressor_incidents bi on bi.userId = u.id where bi.incidentId = ?;";

    private static final String INCIDENT_STRING_FORMAT = "%s %s %s %s";

    private static final String SQL_DELETE_INCIDENT_BY_INCIDENT_ID = String.format(INCIDENT_STRING_FORMAT,
            "delete from incidents where id = ?;",
            "delete from aggressor_incidents where incidentId = ?;",
            "delete from bystander_incidents where incidentId = ?;",
            "delete from incidents_labels where incidentId = ?;");
    private static final String SQL_REMOVE_CONSTRAINTS = String.format(INCIDENT_STRING_FORMAT,
            "alter table incidents drop constraint CONSTRAINT_46D;",
            "alter table incidents_labels drop constraint CONSTRAINT_EA5;",
            "alter table bystander_incidents drop constraint CONSTRAINT_36E;",
            "alter table aggressor_incidents drop constraint CONSTRAINT_233;");

    private static final String SQL_ADD_CONSTRAINTS = String.format(INCIDENT_STRING_FORMAT,
            "alter table incidents add foreign key (reporterId) references users(id);",
            "alter table incidents_labels add foreign key (incidentId) references incidents(id);",
            "alter table bystander_incidents add foreign key (incidentId) references incidents(id);",
            "alter table aggressor_incidents add foreign key (incidentId) references incidents(id);");

    private static final String SQL_SELECT_USERS = "select * from users";

    private static final String MSG_CANT_GET_INCIDENTS = "Failed to retrieve incidents.";
    private static final String MSG_CANT_GET_USERS = "Failed to retrieve users";
    private static final int INDEX_CORRECTION = 1;
    private final Server dbWebConsole;
    private final String username;
    private final String password;
    private final String url;

    public MarsH2Repository(String url, String username, String password, int console) {
        try {
            this.username = username;
            this.password = password;
            this.url = url;
            this.dbWebConsole = Server.createWebServer(
                    "-ifNotExists",
                    "-webPort", String.valueOf(console)).start();
            LOGGER.log(Level.INFO, "Database web console started on port: {0}", console);
            this.generateData();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "DB configuration failed", ex);
            throw new RepositoryException("Could not configure MarsH2repository");
        }
    }

    public List<Incident> getIncidents() {
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_INCIDENTS)
        ) {
            return createIncidents(stmt);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
            throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
        }
    }

    private List<String> getLabelsFromIncidents(int incidentId){
        List<String> labels = new ArrayList<>();
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_LABELS_BY_INCIDENT_ID)
        ) {
            stmt.setInt(1, incidentId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    labels.add(rs.getString("label"));
                }
            }
            return labels;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to get labels.", ex);
            throw new RepositoryException("Could not get labels.");
        }
    }

    public User getUser(String id) {
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_USER_BY_ID)
        ) {
            stmt.setString(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(rs.getString("id"),
                            rs.getString("firstname"),
                            rs.getString("lastname"),
                            rs.getBoolean("subscribed"));
                } else {
                    return null;
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to get user.", ex);
            throw new RepositoryException("Could not get user.");
        }
    }

    public User subscribeUser(String id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE_SUBSCRIPTION)) {

            stmt.setBoolean(1, true); //subscribe
            stmt.setString(2, id);
            stmt.executeUpdate();
            return getUser(id);

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to update subscription.", ex);
            throw new RepositoryException("Could not update subscription.");
        }
    }

    public User unSubscribeUser(String id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE_SUBSCRIPTION)) {

            stmt.setBoolean(1, false); //unsubscribe
            stmt.setString(2, id);
            stmt.executeUpdate();
            return getUser(id);

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to update subscription.", ex);
            throw new RepositoryException("Could not update subscription.");
        }
    }

    public Incident insertIncident(String reportedId, String latitude, String longitude) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_INCIDENT, Statement.RETURN_GENERATED_KEYS))
        {
            Incident newIncident = new Incident(reportedId, longitude, latitude);

            stmt.setString(1, newIncident.getType());
            stmt.setString(2, newIncident.getLongitude());
            stmt.setString(3, newIncident.getLatitude());
            stmt.setString(4, newIncident.getState().toString());
            stmt.setString(5, newIncident.getReporterId());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    newIncident.setId(generatedKeys.getInt(1));
                    newIncident.setDateTime(generatedKeys.getTimestamp(2));
                    insertLabels(newIncident.getLabels(), newIncident.getId());
                    addAggressors(newIncident.getId(), newIncident.getReporterId());
                    return newIncident;
                }
                else {
                    throw new SQLException("Creating quote failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to create incident.", ex);
            throw new RepositoryException("Could not create incident.");
        }
    }

    private void insertLabels(List<String> labels, int id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_LABELS))
        {
            for (String label : labels) {
                stmt.setString(1, label);
                stmt.setInt(2, id);
                stmt.executeUpdate();
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to create incident label.", ex);
            throw new RepositoryException("Could not create incident label.");
        }
    }

    public Incident helpIncident(String userId, int incidentId){
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_BYSTANDER))
        {
            stmt.setString(1, userId);
            stmt.setInt(2, incidentId);

            stmt.executeUpdate();
            return getIncidentWithId(incidentId);

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to create bystander.", ex);
            throw new RepositoryException("Could not create bystander.");
        }
    }

    private Incident getIncidentWithId(int incidentId) {
        return getIncidents()
                .stream()
                .filter(incident -> incident.getId() == incidentId)
                .findAny()
                .orElseThrow(() -> new NoSuchElementException("Incident doesn't exist with such id"));
    }

    public List<Incident> getHelpedIncidents(String userId) {
            try (
                    Connection conn = getConnection();
                    PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BYSTANDERS_BY_USER_ID)
            ) {
                stmt.setString(1, userId);
                return createIncidents(stmt);
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
                throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
            }
    }

    public List<User> getBystandersFromIncident(int incidentId) {
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BYSTANDERS_BY_INCIDENT_ID)
        ) {
            stmt.setInt(1, incidentId);
            return createUsers(stmt);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
            throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
        }
    }

    private List<User> createUsers(PreparedStatement stmt){
        List<User> users = new ArrayList<>();
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User newUser = new User(
                        rs.getString("id"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getBoolean("subscribed")
                );
                users.add(newUser);
            }
            return users;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
            throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
        }
    }

    public List<User> getAggressorFromIncident(int incidentId) {
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_AGGRESSORS_BY_INCIDENT_ID)
        ) {
            stmt.setInt(1, incidentId);
            return createUsers(stmt);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
            throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
        }
    }

    private List<Incident> createIncidents(PreparedStatement stmt){
        List<Incident> incidents = new ArrayList<>();
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Incident newIncident = new Incident(
                        rs.getInt("id"),
                        rs.getString("type"),
                        rs.getString("longitude"),
                        rs.getString("latitude"),
                        rs.getTimestamp("datetime"),
                        State.valueOf(rs.getString("state")),
                        rs.getString("reporterId")
                );
                newIncident.setLabels(getLabelsFromIncidents(newIncident.getId()));
                incidents.add(newIncident);
            }
            return incidents;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_INCIDENTS, ex);
            throw new RepositoryException(MSG_CANT_GET_INCIDENTS);
        }
    }

    private void addAggressors(int incidentId, String reporterId) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_AGGRESSORS))
        {
            List<String> users = getRandomUsersIds(reporterId);
            for (String userId : users) {
                stmt.setString(1, userId);
                stmt.setInt(2, incidentId);
                stmt.executeUpdate();
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to create aggressors for incidents.", ex);
            throw new RepositoryException("Could not create aggressors for incidents.");
        }
    }

    private List<String> getRandomUsersIds(String reporterId) {
        SecureRandom random = new SecureRandom();
        int bound = random.nextInt(getUsers().size() + INDEX_CORRECTION);
        List<String> randomUsers = new ArrayList<>();
        List<User> usersWithoutReporter = getUsers().stream()
                .filter(user -> !Objects.equals(user.getId(), reporterId))
                .collect(Collectors.toList());

        for (int i = 0; i < bound; i++) {
            User newUser = usersWithoutReporter.get(random.nextInt(usersWithoutReporter.size()));
            if (!randomUsers.contains(newUser.getId())) randomUsers.add(newUser.getId());
        }
        return randomUsers;
    }

    public List<User> getUsers(){
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_USERS)
        ) {
            return createUsers(stmt);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, MSG_CANT_GET_USERS, ex);
            throw new RepositoryException(MSG_CANT_GET_USERS);
        }
    }

    public void removeIncident(int incidentId) {
        try (Connection conn = getConnection();
             PreparedStatement incidentStmt = conn.prepareStatement(SQL_DELETE_INCIDENT_BY_INCIDENT_ID);
             PreparedStatement removeConstraintsStmt = conn.prepareStatement(SQL_REMOVE_CONSTRAINTS);
             PreparedStatement addConstraintsStmt = conn.prepareStatement(SQL_ADD_CONSTRAINTS))
        {
            if (getIncidentWithId(incidentId) == null) {throw new RepositoryException("Failed to retrieve incident"); }
               removeConstraintsStmt.executeUpdate();

               incidentStmt.setInt(1, incidentId);
               incidentStmt.setInt(2, incidentId);
               incidentStmt.setInt(3, incidentId);
               incidentStmt.setInt(4, incidentId);
               incidentStmt.executeUpdate();

               addConstraintsStmt.executeUpdate();

            } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to remove incident.", ex);
            throw new RepositoryException("Failed to remove incident.");
        }
    }

    public void cleanUp() {
        if (dbWebConsole != null && dbWebConsole.isRunning(false))
            dbWebConsole.stop();

        try {
            Files.deleteIfExists(Path.of("./db-11.mv.db"));
            Files.deleteIfExists(Path.of("./db-11.trace.db"));
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Database cleanup failed.", e);
            throw new RepositoryException("Database cleanup failed.");
        }
    }

    public void generateData() {
        try {
            executeScript("db-create.sql");
            executeScript("db-populate.sql");
        } catch (IOException | SQLException ex) {
            LOGGER.log(Level.SEVERE, "Execution of database scripts failed.", ex);
        }
    }

    private void executeScript(String fileName) throws IOException, SQLException {
        String createDbSql = readFile(fileName);
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(createDbSql);
        ) {
            stmt.executeUpdate();
        }
    }

    private String readFile(String fileName) throws IOException {
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream(fileName);
        if (inputStream == null)
            throw new RepositoryException("Could not read file: " + fileName);

        return new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}
