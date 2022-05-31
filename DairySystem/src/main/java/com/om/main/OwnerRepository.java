package com.om.main;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.om.model.OwnerDetailsModel;

@Repository
public interface OwnerRepository extends JpaRepository<OwnerDetailsModel, Integer>{

	@Query("Select a from OwnerDetailsModel a where a.ownerUserName =:username and a.ownerPassword =:password")
	public OwnerDetailsModel checkLoginDetails(@Param("username") String username, @Param("password") String password);
}
