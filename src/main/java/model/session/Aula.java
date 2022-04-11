package model.session;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HB_AULA")
public class Aula {

	
	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_aula;
	
	@Column(name = "descrizione")
	private String descrizione;
	
	@Column(name = "numero_posti")
	private int num_posti;
	
	@OneToMany(mappedBy = "aula", cascade = CascadeType.ALL, orphanRemoval = true, targetEntity = Corso.class)
	private List<Corso> corsi = new ArrayList<Corso>();
	
	public int getId_aula() {
		return id_aula;
	}

	public void setId_aula(int id_aula) {
		this.id_aula = id_aula;
	}

	public int getNum_posti() {
		return num_posti;
	}

	public void setNum_posti(int num_posti) {
		this.num_posti = num_posti;
	}

	public List<Corso> getCorsi() {
		return corsi;
	}

	public void setCorsi(List<Corso> corsi) {
		this.corsi = corsi;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione=descrizione;
	}


}
