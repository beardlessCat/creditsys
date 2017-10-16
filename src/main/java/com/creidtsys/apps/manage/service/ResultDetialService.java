package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.ResultDetial;

@Service
public class ResultDetialService {
	@Autowired
	private SqlSessionFactory sqlSessionFactory ;

	public void add(ResultDetial resultDetial) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().insert("cn.sys.manage.entity.ResultDetialMapper.add",resultDetial);
	}

	public List<ResultDetial> ifContain(String rdInfoId) {
		// TODO Auto-generated method stub
		List<ResultDetial> list = sqlSessionFactory.openSession().selectList("cn.sys.manage.entity.ResultDetialMapper.ifContain",rdInfoId);
		return list;
	}

	public  void editDetial(ResultDetial resultDetial) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().update("cn.sys.manage.entity.ResultDetialMapper.edit",resultDetial);
	}

	public void editResult(ResultDetial resultDetial) {
		// TODO Auto-generated method stub
	
		sqlSessionFactory.openSession().update("cn.sys.manage.entity.ResultDetialMapper.editRe",resultDetial);
	}

	public void edit(List<ResultDetial> list) {
		
		for(ResultDetial resultDetial : list){
			editResult(resultDetial);
			//getByCond(resultDetial);
		}
	}
	public String getByCond(ResultDetial resultDetial){
		List<ResultDetial> list =sqlSessionFactory.openSession().selectList("cn.sys.manage.entity.ResultDetialMapper.getByCond", resultDetial);
		return list.get(0).getRdId();
	}

	public void delete(ResultDetial ResultDetial) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().delete("cn.sys.manage.entity.ResultDetialMapper.delete",ResultDetial);
	}
}
