package be.howest.ti.mars.logic.domain;

import java.util.Objects;

public class User {
    private final String id;
    private final String firstName;
    private final String lastName;
    private boolean subscribed;

    public User(String id, String firstName, String lastName, boolean subscribed) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
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

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
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
