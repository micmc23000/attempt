/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.micmc23000.attempt2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 *
 * @author Michael
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
      
@Autowired
  public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
  	 auth.inMemoryAuthentication().withUser("bob").password("pass").roles("SUPERADMIN").and().withUser("tom").password("pass").roles("ADMIN").and().withUser("mary").password("pass").roles("USER");
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
  	http.authorizeRequests().antMatchers("/login").permitAll()
                .antMatchers("/", "/*agent*/**").access("hasRole('USER')")
                .and()
                .formLogin()
                .defaultSuccessUrl("/login/allItems")
                .and().logout().logoutUrl("/logout");
  } 
}
