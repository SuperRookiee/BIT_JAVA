package org.practice.service;

import java.util.List;

import org.practice.domain.BookVO;

public interface BookService {
	public void register(BookVO book);
	public BookVO get(int bookid);
	public boolean modify(BookVO book);
	public boolean remove(int bookid);
	public List<BookVO> getList();
}
