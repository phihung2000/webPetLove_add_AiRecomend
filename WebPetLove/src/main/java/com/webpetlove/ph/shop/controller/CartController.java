package com.webpetlove.ph.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webpetlove.ph.entity.Product;
import com.webpetlove.ph.model.Cart;
import com.webpetlove.ph.model.CartResponse;
import com.webpetlove.ph.model.Item;
import com.webpetlove.ph.mysql.repo.ProductRepository;

@RestController
@RequestMapping("/cart")
public class CartController extends HttpServlet {

  private static final long serialVersionUID = 1L;

  private @Autowired ProductRepository productRepository;

  @GetMapping("/remove/{productId}")
  public CartResponse remove(@PathVariable Long productId, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    cart.removeToCart(productId);
    session.setAttribute("cart", cart);
    return updateCartView(cart, "đã xóa thành công sản phẩm khỏi giỏ hàng: " + product.getProductName());
  }

  @GetMapping("/plus/{productId}")
  public CartResponse doPost(@PathVariable Long productId, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    if (cart.getCartItems().containsKey(productId)) {
      cart.plusToCart(productId, new Item(product, cart.getCartItems().get(productId).getQuantity()));
    } else {
      cart.plusToCart(productId, new Item(product, 1));
    }
    session.setAttribute("cart", cart);
    return updateCartView(cart, "đã thêm thành công sản phẩm vào giỏ hàng: " + product.getProductName());
  }

  @GetMapping("/sub/{productId}")
  public CartResponse sub(@PathVariable Long productId, HttpServletRequest request) {
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Product product = productRepository.findById(productId).get();
    cart.subToCart(productId, new Item(product, cart.getCartItems().get(productId).getQuantity()));
    session.setAttribute("cart", cart);
    return updateCartView(cart, "đã xóa thành công 1 sản phẩm khỏi giỏ hàng: " + product.getProductName());
  }
  
  private CartResponse updateCartView(Cart cart, String message) {
    CartResponse resp = new CartResponse();
    Double totalPrices = 0d;
    int quantity = 0;
    
    if (cart != null) {
      Map<Long, Item> datas = cart.getCartItems();
      
      for(Item i: datas.values()) {
        totalPrices += (i.getProduct().getProductPrice() * i.getQuantity());
        quantity += i.getQuantity();
      }
    }
    resp.setQuantity(quantity);
    resp.setPrice(totalPrices.longValue());
    resp.setMessage(message);
    return resp;
  }
}
