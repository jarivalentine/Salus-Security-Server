package be.howest.ti.mars.logic.data;

import be.howest.ti.mars.logic.exceptions.RepositoryException;
import io.vertx.core.json.JsonObject;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Map;

class MarsH2RepositoryExceptionsTest {

    private static final String URL = "jdbc:h2:./db-11";

    @Test
    void getH2RepoWithNoDbFails() {
        // Arrange
        Repositories.shutdown();

        // Act + Assert
        Assertions.assertThrows(RepositoryException.class, Repositories::getH2Repo);
    }

    @Test
    void functionsWithSQLExceptionFailsNicely() {
        // Arrange
        int id = 1;
        JsonObject dbProperties = new JsonObject(Map.of("url",URL,
                "username", "",
                "password", "",
                "webconsole.port", 9000 ));
        Repositories.shutdown();
        Repositories.configure(dbProperties);
        MarsH2Repository repo = Repositories.getH2Repo();
        repo.cleanUp();

        // Act + Assert
        Assertions.assertThrows(RepositoryException.class, () -> repo.getUser("1989-01-28_AL"));
        Assertions.assertThrows(RepositoryException.class, repo::getIncidents);
        Assertions.assertThrows(RepositoryException.class, () -> repo.insertIncident("1989-01-28_AL", "53", "32"));
        Assertions.assertThrows(RepositoryException.class, () -> repo.helpIncident("1989-01-28_AL", 1));
        Assertions.assertThrows(RepositoryException.class, () -> repo.subscribeUser("1989-01-28_AL"));
        Assertions.assertThrows(RepositoryException.class, () -> repo.unSubscribeUser("1989-01-28_AL"));
        Assertions.assertThrows(RepositoryException.class, () -> repo.getHelpedIncidents("1989-01-28_AL"));
        Assertions.assertThrows(RepositoryException.class, () -> repo.getBystandersFromIncident(1));
        Assertions.assertThrows(RepositoryException.class, () -> repo.getAggressorFromIncident(1));
        Assertions.assertThrows(RepositoryException.class, () -> repo.removeIncident(1));
        Assertions.assertThrows(RepositoryException.class, () -> repo.validateIncident(1));
    }


}
