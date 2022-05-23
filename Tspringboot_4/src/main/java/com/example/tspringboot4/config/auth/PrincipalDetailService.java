package com.example.tspringboot4.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//System.out.println("loadUserByUsername(username)");
		User user = userRepository.findByUsername(username);
		
		if(user == null) return null;
		PrincipalDetails puser = new PrincipalDetails(user);
		return puser;
	}
	

}
