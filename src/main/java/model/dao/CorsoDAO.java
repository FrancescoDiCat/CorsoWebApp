package model.dao;

import model.session.Corso;

public class CorsoDAO extends AbstractDAO<Corso>{

	@Override
	public Class<Corso> getPersistentClass() {
		// TODO Auto-generated method stub
		return Corso.class;
	}

}
