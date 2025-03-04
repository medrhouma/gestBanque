public class CompteEpargne extends Compte {
    private double benefice;

    // Constructors
    public CompteEpargne() {}

    public CompteEpargne(int id, double solde, int banqueId, double benefice) {
        super(id, solde, banqueId);
        this.benefice = benefice;
    }

    // Getters and Setters
    public double getBenefice() { return benefice; }
    public void setBenefice(double benefice) { this.benefice = benefice; }

    @Override
    public String toString() {
        return "CompteEpargne{" +
                "id=" + getId() +
                ", solde=" + getSolde() +
                ", banqueId=" + getBanqueId() +
                ", benefice=" + benefice +
                '}';
    }
}
