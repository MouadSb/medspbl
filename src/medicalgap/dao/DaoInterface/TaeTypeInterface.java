package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.TypeTae;

public interface TaeTypeInterface  {

	public TypeTae addTypeTae(TypeTae tae);

	public void deleteTypeTae(TypeTae tae);

	public TypeTae updateTypeTae(TypeTae tae);

	public TypeTae getTypeTae(int id_tae);

	public List<TypeTae> getAllTaes();
	
	public List<TypeTae> getAllTaesC(String nameC);


}
