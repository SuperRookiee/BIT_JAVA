package org.book.domain;

import lombok.Data;

@Data
public class BookVO {
	private int bookid;
	private String bookname;
	private String publisher;
	private int price;
}
