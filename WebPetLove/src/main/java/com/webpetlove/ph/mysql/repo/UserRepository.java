package com.webpetlove.ph.mysql.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.webpetlove.ph.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
  @Query(value="Select * from users where user_email= ?1", nativeQuery = true)
  User findByUserEmail(String mail);
  
  @Query(value="Select * from users where user_id= ?1", nativeQuery = true)
  User findByUserid(Long id);
  
  User findByUserEmailAndUserPassAndGroupid(String mail, String password, int groupId);
  
  @Query(value = "Select * from users where user_email = ?1 and user_pass = ?2 and usergroup_id = 1", nativeQuery = true)
  User finduser(String email, String password);
  
  @Query(value = "Select * from users where user_email = ?1 and user_pass = ?2 and usergroup_id = 2", nativeQuery = true)
  User findAdmin(String email, String password);
  
  @Transactional
  @Modifying
  @Query(value = "update users set user_name =?1, phone = ?2, petlove =?3, DiaChi =?4 where user_id = ?5", nativeQuery = true)
  void finupdate(String username,String phone,String petlove,String diachi,Long id);
}
