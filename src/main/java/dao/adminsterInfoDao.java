package dao;
import java.util.List;

import POJO.AdminsterInfoPO;




public interface adminsterInfoDao {
	AdminsterInfoPO get(Integer id);
	Integer save(AdminsterInfoPO user);
	List<AdminsterInfoPO> findByName(String name);
}
