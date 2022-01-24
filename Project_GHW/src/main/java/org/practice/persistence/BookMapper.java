package org.practice.persistence;

import java.util.List;

import org.practice.domain.BookVO;

public interface BookMapper {
	public List<BookVO> getList();
	public void insert(BookVO board);
	public BookVO read(int i);
	public long delete(int i);
	public int update(BookVO board);
	public void insertSelectKey(BookVO board);
}
