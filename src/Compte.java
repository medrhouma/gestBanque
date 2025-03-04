public class Compte {
    private int id;
    private double solde;
    private int banqueId;

    // Constructors
    public Compte() {}

    public Compte(int id, double solde, int banqueId) {
        this.id = id;
        this.solde = solde;
        this.banqueId = banqueId;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public double getSolde() { return solde; }
    public void setSolde(double solde) { this.solde = solde; }

    public int getBanqueId() { return banqueId; }
    public void setBanqueId(int banqueId) { this.banqueId = banqueId; }

    @Override
    public String toString() {
        return "Compte{" +
                "id=" + id +
                ", solde=" + solde +
                ", banqueId=" + banqueId +
                '}';
    }
}
