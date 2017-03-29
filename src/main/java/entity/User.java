package entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tomi on 22/03/17.
 */

@Entity
@Table(name = "USER")
public class User {

    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "ID")
    private String id;

    @Column(name = "FNAME")
    private String firstName;

    @Column(name = "LNAME")
    private String lastName;

    @Id
    @Column(name = "EMAIL")
    private String email;

    @Column(name = "COURSE")
    private String course;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "ROLE")
    private String role;

    /*@ManyToMany
    private List<Subject> subjects = new ArrayList<Subject>();*/

    private boolean moderator;
    private boolean admin;

    public User() {
    }

    public User(String firstName, String lastName, String email, String course,
                String password, boolean moderator, boolean admin) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.course = course;
        this.password = password;
        this.moderator = moderator;
        this.admin = admin;
        assignRole();
    }

    public void makeModerator() {
        moderator = false;
        admin = true;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void makeAdmin(){
        admin = true;
        moderator = false;
    }

    public void makeStandard(){
        admin = moderator = false;
    }

    private void assignRole(){
        if(admin) role = "admin";
        else if(moderator) role = "moderator";
        else role = "user";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }
}
