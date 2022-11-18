package be.howest.ti.mars.logic.domain;

import java.security.SecureRandom;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Incident {
    private int id;
    private final String type;
    private Timestamp datetime;
    private final String longitude;
    private final String latitude;
    private final boolean validated;
    private List<String> labels;
    private final String reporterId;
    private static final int NO_ID = -1;
    private static final Timestamp NO_DATE = Timestamp.valueOf(LocalDateTime.of(1970, 1, 1, 0, 0, 0));
    private static final List<String> RANDOM_TYPES_LIST = List.of("Murder", "Theft", "Vandalism", "Assault");
    private static final List<String> RANDOM_LABELS_LIST = List.of("Armed", "Child Danger", "Critical Condition", "Under Control");
    private final SecureRandom random = new SecureRandom();
    private static final int INDEX_CORRECTION = 1;

    public Incident(String reporter, String longitude, String latitude) {
        this.id = NO_ID;
        this.type = getRandomType();
        this.datetime = NO_DATE;
        this.longitude = Objects.requireNonNull(longitude);
        this.latitude = Objects.requireNonNull(latitude);
        this.validated = getSuperComplexAISHA256HashedAndDecryptedAIValidation();
        this.labels = getRandomLabels();
        this.reporterId = Objects.requireNonNull(reporter);
    }

    public Incident(int id, String type, String longitude, String latitude, Timestamp datetime, boolean validated, String reporterId) {
        this.id = id;
        this.type = type;
        this.datetime = datetime;
        this.longitude = longitude;
        this.latitude = latitude;
        this.validated = validated;
        this.labels = new ArrayList<>();
        this.reporterId = reporterId;
    }

    public void setLabels(List<String> newLabels){
        labels = newLabels;
    }

    public void setId(int newID) {
        this.id = newID;
    }

    public void setDateTime(Timestamp timestamp) {
        datetime = timestamp;
    }

    private String getRandomType() {
        return Incident.RANDOM_TYPES_LIST.get(random.nextInt(Incident.RANDOM_TYPES_LIST.size()));
    }

    private boolean getSuperComplexAISHA256HashedAndDecryptedAIValidation() { // Quantum AI calculating the complex validity of an incident
        int odds = random.nextInt(10); // 0-8 = true, 9 = false
        return odds <= 8;
    }

    private List<String> getRandomLabels() {
        int amountOfLabels = random.nextInt(Incident.RANDOM_LABELS_LIST.size() + INDEX_CORRECTION);
        List<String> randomLabels = new ArrayList<>();
        for (int i = 0; i < amountOfLabels; i++) {
            String newLabel = Incident.RANDOM_LABELS_LIST.get(random.nextInt(Incident.RANDOM_LABELS_LIST.size()));
            if (!randomLabels.contains(newLabel)) randomLabels.add(newLabel);
        }
        return randomLabels;
    }

    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getDatetime() {
        return datetime.toLocalDateTime().toString();
    }

    public String getLongitude() {
        return longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public boolean isValidated() {
        return validated;
    }

    public List<String> getLabels() {
        return labels;
    }

    public String getReporterId() {
        return reporterId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Incident incident = (Incident) o;
        return id == incident.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
