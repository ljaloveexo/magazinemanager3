package POJO;

import java.io.Serializable;

public class BookInfoPO implements Serializable{
	private Integer id;
    private String bookname;
    private String booktype;
    private String bookcn;
    

	public BookInfoPO(Integer id, String bookname, String booktype,String bookcn) {
		super();
		this.id = id;
		this.bookname = bookname;
		this.booktype = booktype;
		this.bookcn = bookcn;
	}
    
    
    public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	
	public BookInfoPO () {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	

	

	
	public String getBooktype() {
		return booktype;
	}

	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}

	public String getBookcn() {
		return bookcn;
	}

	public void setBookcn(String bookcn) {
		this.bookcn = bookcn;
	}

}

