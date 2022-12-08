package be.howest.ti.mars.logic.domain;

import java.util.Objects;

public class User {
    private final String id;
    private final String firstname;
    private final String lastname;
    private boolean subscribed;

    public User(String id, String firstname, String lastname, boolean subscribed) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.subscribed = subscribed;
    }

    public void subscribe() {
        subscribed = true;
    }

    public void unsubscribe() {
        subscribed = false;
    }

    public String getId() {
        return id;
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
    public String toString() {
        return String.format("(%s) %s %s (%b)", id, firstname, lastname, subscribed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
