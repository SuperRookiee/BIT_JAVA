package org.book.service;

import java.util.List;

import org.book.domain.BookVO;
import org.book.mapper.BookMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service // 스프링에 빈으로 등록되는 서비스 객체의 어노테이션
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자 생성
public class BookServiceImpl implements BookService{
	private BookMapper mapper;
	
	@Override
	public List<BookVO> getList() {
		log.info("getList.............");
		return mapper.getList();
	}
}
