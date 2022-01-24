package org.global.beans;

public class BookBeans {
	String bookId;
	String bookname;
	String publisher;
	String price;
	
	public BookBeans() {
	}

	public BookBeans(String bookId, String bookname, String publisher, String price) {
		super();
		this.bookId = bookId;
		this.bookname = bookname;
		this.publisher = publisher;
		this.price = price;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
}
