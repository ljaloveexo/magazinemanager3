package dao;
import java.util.List;

import POJO.BookInfoPO;


public interface MagazineDao {
	BookInfoPO get(Integer id);
	Integer save(BookInfoPO book);
	List<BookInfoPO> findByName(String name);
	boolean findByName2(Integer name);
	boolean update(Integer id,String bookname,String booktype,String bookcn);
	List<BookInfoPO> findAllInfo();
//	Pager<BookInfoPO> findByPage(BookInfoPO searchModel, int pageNum,int pageSize);
	}


