package org.practice.service;

import java.util.List;

import org.practice.domain.BookVO;
import org.practice.persistence.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BookServiceImpl implements BookService {
	@Setter(onMethod_=@Autowired)
	private BookMapper mapper;
	
	@Override
	public List<BookVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}

	@Override
	public void register(BookVO book) {
		log.info("register...."+book);
		mapper.insertSelectKey(book);
	}

	@Override
	public BookVO get(int bookid) {
		log.info("get...."+bookid);
		return mapper.read(bookid);
	}

	@Override
	public boolean modify(BookVO board) {
		log.info("modify....."+board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int bookid) {
		log.info("remove...."+bookid);
		return mapper.delete(bookid) == 1;
	}
}
