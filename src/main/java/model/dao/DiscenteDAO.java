package model.dao;

import model.session.Discente;

public class DiscenteDAO extends AbstractDAO<Discente>{

	@Override
	public Class<Discente> getPersistentClass() {
		// TODO Auto-generated method stub
		return Discente.class;
	}

}
