import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BanqueDAO {
    private Connection connection;

    public BanqueDAO(Connection connection) {
        this.connection = connection;
    }

    // Create
    public void create(Banque banque) throws SQLException {
        String sql = "INSERT INTO Banque (nom) VALUES (?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, banque.getNom());
            statement.executeUpdate();
        }
    }

    // Read
    public Banque read(int id) throws SQLException {
        String sql = "SELECT * FROM Banque WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Banque(
                        resultSet.getInt("id"),
                        resultSet.getString("nom")
                );
            }
        }
        return null;
    }

    // Update
    public void update(Banque banque) throws SQLException {
        String sql = "UPDATE Banque SET nom = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, banque.getNom());
            statement.setInt(2, banque.getId());
            statement.executeUpdate();
        }
    }

    // Delete
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM Banque WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // List all
    public List<Banque> list() throws SQLException {
        List<Banque> banques = new ArrayList<>();
        String sql = "SELECT * FROM Banque";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                banques.add(new Banque(
                        resultSet.getInt("id"),
                        resultSet.getString("nom")
                ));
            }
        }
        return banques;
    }
}