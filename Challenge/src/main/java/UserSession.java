import java.io.Serializable;

public class UserSession implements Serializable {

    private String username;
    private String role;

    public UserSession(String username, String role) {
        this.username = username;
        this.role = role;
    }
    public String getRole() { return role; }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
