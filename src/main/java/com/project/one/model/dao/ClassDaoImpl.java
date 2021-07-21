package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;

@Repository
public class ClassDaoImpl implements ClassDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ClassDto> selectList() {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ClassDto> classList(PagingDto pDto) {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "classList", pDto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ClassDto> main_selectList() {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "main_selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ClassDto selectOne(int class_no) {
		ClassDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", class_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public ClassDto selectOneByTitle(String class_title) {
		ClassDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOneByTitle", class_title);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ClassDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ClassDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int updateSale(ClassDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "updateSale", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int class_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", class_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	//마이페이지 
	@Override
	public List<ClassDto> userClass(String member_id) {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "userClass", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return list;
		}

	@Override
	public int classCount() {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "classCount");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<ClassDto> classListPaging(PagingDto pDto) {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "classListPaging", pDto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public int classListCount() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "classListCount");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ClassDto> classListSearch(PagingDto pDto) {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "classListSearch", pDto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int classSearchCount(PagingDto pDto) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "classSearchCount", pDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;		
	}

	@Override
	public List<ClassDto> searchedList(String search_keyword) {
		List<ClassDto> list = new ArrayList<ClassDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "searchedList", search_keyword);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
