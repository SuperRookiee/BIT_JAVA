package org.book.mapper;

import java.util.List;

import org.book.domain.BookVO;


public interface BookMapper {
	public List<BookVO> getList(); // select all
}
