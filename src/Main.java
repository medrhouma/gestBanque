import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/banque_db";
        String user = "postgres"; // Default username
        String password = "hama"; // Password you set during installation

        try {
            // Explicitly load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Connect to the database
            try (Connection connection = DriverManager.getConnection(url, user, password)) {
                System.out.println("Connected to the database!");

                // Test CRUD operations
                BanqueDAO banqueDAO = new BanqueDAO(connection);
                CompteDAO compteDAO = new CompteDAO(connection);

                // Create a new banque
                Banque banque = new Banque(1, "Banque Centrale");
                banqueDAO.create(banque);

                // Create a new compte
                Compte compte = new Compte(1, 1000.0, 1);
                compteDAO.create(compte);
                Compte compte1 = new Compte(2, 2000.0, 1);
                compteDAO.create(compte1);

                // Read the compte
                Compte compteLu = compteDAO.read(1);
                System.out.println("Compte lu: " + compteLu);

                // Update the compte
                compte.setSolde(1500.0);
                compteDAO.update(compte);
                System.out.println("Compte mis à jour: " + compteDAO.read(1));

                // Delete the compte
                compteDAO.delete(1);
                System.out.println("Compte supprimé.");
            }
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}