import java.util.Base64;
import java.io.*;

public class SerializationUtil {

    public static String serialize(UserSession userSession) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(userSession);
        oos.close();
        return Base64.getEncoder().encodeToString(baos.toByteArray());
    }

    public static UserSession deserialize(String base64String) throws IOException, ClassNotFoundException {
        if (base64String == null || base64String.length() % 4 != 0) {
            throw new IllegalArgumentException("Invalid cookie to decode");
        }
        byte[] data = Base64.getDecoder().decode(base64String);
        try (ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(data))) {
            return (UserSession) ois.readObject();
        }
    }
}
