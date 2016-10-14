package medicalgap.dao.DaoInterface;

import java.util.List;

import medicalgap.dao.entity.TypeMedicalactiv;

public interface MedicalTypeInterface {

	public TypeMedicalactiv addTypeMedicalactiv( TypeMedicalactiv tm);
	public void deleteTypeMedicalactiv(TypeMedicalactiv tm);
	public TypeMedicalactiv updateTypeMedicalactiv(TypeMedicalactiv tm);
	public TypeMedicalactiv getTypeMedicalactiv(int id_tm);
	public List<TypeMedicalactiv> getAllTypeMedicalactiv();
	public List<TypeMedicalactiv> getAllTypeMedicalactivC(String nameC);

	
}
