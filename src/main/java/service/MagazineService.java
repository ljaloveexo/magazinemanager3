package service;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.MagazineDao;
import POJO.BookInfoPO;


public class MagazineService{

	private MagazineDao info = (MagazineDao) new ClassPathXmlApplicationContext("classpath:applicationContext.xml").getBean("magazineDao");

	public void setMagazineDao(MagazineDao info) {
		this.info = info;
	}
	//删除
public String delete(Integer id){
	String message=null;
	boolean rs=info.findByName2(id);
    
	if(!rs){
    	message= "dbError";
    }
    
	else{			
		message="success" ;
	}
	
	return message;
	
}
//����ͼ����Ϣ
public String add(String bookname, String booktype,String bookcn)
{
		BookInfoPO book = new BookInfoPO();
		book.setBookname(bookname);
		book.setBooktype(booktype);
		book.setBookcn(bookcn);
		info.save(book);
		
	
	return "success";
}
//修改
public boolean update(Integer id,String bookname, String booktype,String bookcn)
{
	
	    String message = null;
	    
		
		if(info.update(id,bookname,booktype,bookcn)){
			message = "success";
		}else 
			message="error";
	
	return true;
}

public List<BookInfoPO> findAllBooks(){
	return info.findAllInfo();
}
//查询
public List<BookInfoPO> searchByName(String name){
	
	return info.findByName(name);
}

//	public Pager<BookInfoPO> findByPage(BookInfoPO searchModel, int pageNum, int pageSize) {
//		Pager<BookInfoPO> result = info.findByPage(searchModel, pageNum, pageSize);
//		return result;
//	}


}

