import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompteDAO {
    private Connection connection;

    public CompteDAO(Connection connection) {
        this.connection = connection;
    }

    // Create
    public void create(Compte compte) throws SQLException {
        String sql = "INSERT INTO Compte (solde, banque_id) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDouble(1, compte.getSolde());
            statement.setInt(2, compte.getBanqueId());
            statement.executeUpdate();
        }
    }

    // Read
    public Compte read(int id) throws SQLException {
        String sql = "SELECT * FROM Compte WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Compte(
                        resultSet.getInt("id"),
                        resultSet.getDouble("solde"),
                        resultSet.getInt("banque_id")
                );
            }
        }
        return null;
    }

    // Update
    public void update(Compte compte) throws SQLException {
        String sql = "UPDATE Compte SET solde = ?, banque_id = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDouble(1, compte.getSolde());
            statement.setInt(2, compte.getBanqueId());
            statement.setInt(3, compte.getId());
            statement.executeUpdate();
        }
    }

    // Delete
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM Compte WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // List all
    public List<Compte> list() throws SQLException {
        List<Compte> comptes = new ArrayList<>();
        String sql = "SELECT * FROM Compte";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                comptes.add(new Compte(
                        resultSet.getInt("id"),
                        resultSet.getDouble("solde"),
                        resultSet.getInt("banque_id")
                ));
            }
        }
        return comptes;
    }
}
