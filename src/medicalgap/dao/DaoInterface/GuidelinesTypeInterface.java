package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.TypeGuideline;

public interface GuidelinesTypeInterface {

	public TypeGuideline addGuideline(TypeGuideline guideline);
	public void deleteGuideline(TypeGuideline guideline);
	public TypeGuideline updateGuideline(TypeGuideline guideline);
	public TypeGuideline getGuideline(int id_guideline);
	public List<TypeGuideline> getAllGuidelines();
	public List<TypeGuideline> getAllGuidelinesC(String nameC);

}
