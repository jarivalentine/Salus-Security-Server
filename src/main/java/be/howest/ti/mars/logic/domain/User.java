package be.howest.ti.mars.logic.domain;

import java.util.Objects;

public class User {
    private final String id;
    private final String dob;
    private final String firstname;
    private final String lastname;
    private final boolean subscribed;
    private static final int DOB_LENGTH = 10;

    public User(String dob, String firstname, String lastname, boolean subscribed) {
        this.id = createId();
        this.dob = dob;
        this.firstname = firstname;
        this.lastname = lastname;
        this.subscribed = subscribed;
    }

    private String createId() {
        if (dob.length() != DOB_LENGTH) throw new IllegalArgumentException("Date of birth should be formatted like this: YYYY-MM-DD");
        char firstLetterFN = firstname.charAt(0);
        char firstLetterLN = lastname.charAt(0);
        return String.format("%s_%s%s", dob, firstLetterFN, firstLetterLN); //1989-01-28_AL
    }

    public String getId() {
        return id;
    }

    public String getDob() {
        return dob;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public boolean isSubscribed() {
        return subscribed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(id, user.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
