package medicalgap.dao.DaoInterface;

import java.util.List;
import medicalgap.dao.entity.Tae;

public interface TaeInterface {

	public Tae addTae(Tae tae);

	public void deleteTae(Tae tae);

	public Tae updateTae(Tae tae);

	public Tae getTae(long id_tae);

	public List<Tae> getAllTaes();

	public List<Tae> getAllTaes(String categorie);

	public List<Tae> getAllTaes(String categorie, String type);

}