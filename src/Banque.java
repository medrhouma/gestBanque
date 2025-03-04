public class Banque {
    private int id;
    private String nom;

    // Constructors
    public Banque() {}

    public Banque(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    @Override
    public String toString() {
        return "Banque{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                '}';
    }
}