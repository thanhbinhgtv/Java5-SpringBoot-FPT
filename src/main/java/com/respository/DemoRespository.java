package com.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Demo;

public interface DemoRespository extends JpaRepository<Demo, Integer>{

}
