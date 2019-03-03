package dao;
import java.util.List;
import POJO.UserInfoPO;

public interface UserInfoDao {
	UserInfoPO get(Integer id);
	Integer save(UserInfoPO user);
	List<UserInfoPO> findByName(String name);
}
