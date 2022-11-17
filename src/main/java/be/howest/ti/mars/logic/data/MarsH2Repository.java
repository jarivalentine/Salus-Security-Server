package be.howest.ti.mars.logic.data;

import be.howest.ti.mars.logic.domain.Incident;
import be.howest.ti.mars.logic.domain.Quote;
import be.howest.ti.mars.logic.domain.User;
import be.howest.ti.mars.logic.exceptions.RepositoryException;
import org.h2.tools.Server;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
This is only a starter class to use an H2 database.
In this start project there was no need for a Java interface MarsRepository.
Please always use interfaces when needed.

To make this class useful, please complete it with the topics seen in the module OOA & SD
 */

public class MarsH2Repository {
    private static final Logger LOGGER = Logger.getLogger(MarsH2Repository.class.getName());
    private static final String SQL_QUOTA_BY_ID = "select id, quote from quotes where id = ?;";
    private static final String SQL_INSERT_QUOTE = "insert into quotes (`quote`) values (?);";
    private static final String SQL_UPDATE_QUOTE = "update quotes set quote = ? where id = ?;";
    private static final String SQL_DELETE_QUOTE = "delete from quotes where id = ?;";
    private static final String SQL_SELECT_INCIDENTS = "select * from incidents;";
    private static final String SQL_SELECT_LABELS_BY_INCIDENT_ID = "select * from incidents_labels where incidentId = ?;";
    private static final String SQL_USER_BY_ID = "select * from users where id = ?;";
    private static final String SQL_INSERT_INCIDENT = "insert into incidents (`type`, `longitude`, `latitude`, `validated`, `reporterId`) values (?, ?, ?, ?, ?);";
    private static final String SQL_INSERT_LABELS = "insert into incidents_labels (label, incidentId) values (?, ?);";
    private static final String SQL_INSERT_BYSTANDER = "insert into bystander_incidents (userId, incidentId) values (?, ?);";
    private static final String SQL_UPDATE_SUBSCRIPTION = "update users set subscribed = ? where id = ?;";
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
        List<Incident> incidents = new ArrayList<>();
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_INCIDENTS)
        ) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Incident newIncident = new Incident(
                            rs.getInt("id"),
                            rs.getString("type"),
                            rs.getString("longitude"),
                            rs.getString("latitude"),
                            rs.getTimestamp("datetime"),
                            rs.getBoolean("validated"),
                            rs.getString("reporterId")
                            );
                    newIncident.setLabels(getLabelsFromIncidents(newIncident.getId()));
                    incidents.add(newIncident);
                }
            }
            return incidents;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to get incidents.", ex);
            throw new RepositoryException("Could not get incidents.");
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
            stmt.setBoolean(4, newIncident.isValidated());
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

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating bystander failed, no rows affected.");
            }
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

    public Quote getQuote(int id) {
        try (
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(SQL_QUOTA_BY_ID)
        ) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Quote(rs.getInt("id"), rs.getString("quote"));
                } else {
                    return null;
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to get quote.", ex);
            throw new RepositoryException("Could not get quote.");
        }
    }

    public Quote insertQuote(String quoteValue) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_INSERT_QUOTE, Statement.RETURN_GENERATED_KEYS))
        {

            stmt.setString(1, quoteValue);

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            Quote quote = new Quote(quoteValue);
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    quote.setId(generatedKeys.getInt(1));
                    return quote;
                }
                else {
                    throw new SQLException("Creating quote failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to create quote.", ex);
            throw new RepositoryException("Could not create quote.");
        }
    }

    public Quote updateQuote(int quoteId, String quote) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE_QUOTE)) {

            stmt.setString(1, quote);
            stmt.setInt(2, quoteId);
            stmt.executeUpdate();
            return new Quote(quoteId, quote);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to update quote.", ex);
            throw new RepositoryException("Could not update quote.");
        }
    }

    public void deleteQuote(int quoteId) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_DELETE_QUOTE)) {

            stmt.setInt(1, quoteId);
            stmt.execute();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Failed to delete quote.", ex);
            throw new RepositoryException("Could not delete quote.");
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
