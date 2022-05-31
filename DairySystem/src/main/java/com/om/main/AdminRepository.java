package com.om.main;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.model.Adminlogin;

@Repository
public interface AdminRepository extends JpaRepository<Adminlogin, Integer>{

	@Query("Select a from Adminlogin a where a.username =:username and a.password =:password")
	public Adminlogin checkLoginDetails(@Param("username") String username, @Param("password") String password);
}
