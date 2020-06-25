package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.Demo;
import com.respository.DemoRespository;

@Service
@Transactional
public class DemoService {
	@Autowired
	private DemoRespository resp;
	
	public List<Demo> listAll(){
		return resp.findAll();
	}
	public void save(Demo demo) {
		resp.save(demo);
	}
	public Demo get(int id) {
		return resp.findById(id).get();
	}
	public void delete(int id) {
		resp.deleteById(id);
	}
}
