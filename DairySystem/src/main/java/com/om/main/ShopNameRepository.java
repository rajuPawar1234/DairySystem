package com.om.main;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.om.model.ShopDetailsModel;

@Repository
public interface ShopNameRepository extends JpaRepository<ShopDetailsModel, Integer>{

}
