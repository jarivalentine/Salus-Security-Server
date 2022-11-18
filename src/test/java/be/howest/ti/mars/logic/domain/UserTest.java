package be.howest.ti.mars.logic.domain;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {
    @Test
    void checkGettersFromUser(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);

        assertEquals("Alison", user.getFirstname());
        assertEquals("Lopez", user.getLastname());
        assertEquals("1989-01-28_AL", user.getId());
        assertFalse(user.isSubscribed());
    }

    @Test
    void checkSubbingOfUser(){
        User user = new User("1989-01-28_AL", "Alison", "Lopez", false);
        assertFalse(user.isSubscribed());

        //subscribe
        user.subscribe();
        assertTrue(user.isSubscribed());

        //unsubscribe
        user.unsubscribe();
        assertFalse(user.isSubscribed());
    }

    @Test
    void checkEqualsAndHash(){
        User user = new User("1989-01-28_AL", "Ben", "Tennison", true);
        User user2 = new User("1989-01-28_AL", "Alison", "Lopez", false);
        assertEquals(user, user2); //equals and hash on id
    }
}