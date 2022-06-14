package com.webpetlove.ph.service;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.webpetlove.ph.entity.Category;
import com.webpetlove.ph.model.Value;
import com.webpetlove.ph.mysql.repo.CategoryRepository;
import com.webpetlove.ph.mysql.repo.ProductRepository;

@Component
public class ChartService {

  private Logger log = LoggerFactory.getLogger(getClass());

  private @Autowired CategoryRepository categoryRepository;
  private @Autowired ProductRepository productRepository;

  public List<Value> getAll() {
    List<Value> list = new LinkedList<>();
    for (Category category : categoryRepository.findAll()) {
      list.add(new Value(category.getCategoryName(),
          productRepository.findByCategoryId(category.getCategoryID()).size()));
    }
    return list;
  }
}
