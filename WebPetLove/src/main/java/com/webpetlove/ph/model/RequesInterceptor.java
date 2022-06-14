package com.webpetlove.ph.model;

import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RequesInterceptor extends HandlerInterceptorAdapter {
//	private static Object lock  = new Object();
//	private static int count = 0;
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException{
//		synchronize(lock){
//            count++;
//        }
//	}
	 private final static AtomicInteger count = new AtomicInteger(0);

	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

	        count.incrementAndGet();

	        System.out.println("[---count---]" + count);

	        return true;
	    }

}
