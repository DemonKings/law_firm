package com.weitong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weitong.dao.BusinessAreaDao;
import com.weitong.domain.BusinessArea;
import com.weitong.service.BusinessAreaService;

@Service
@Transactional
public class BusinessAreaServiceImpl implements BusinessAreaService {
	@Autowired
	private BusinessAreaDao businessAreaDao;
	
	@Override
	public List<BusinessArea> findAll() {
		//调用dao查询
		return businessAreaDao.findAll();
	}

}
