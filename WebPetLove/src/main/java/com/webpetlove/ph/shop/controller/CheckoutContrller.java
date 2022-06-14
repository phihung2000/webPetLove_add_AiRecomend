package com.webpetlove.ph.shop.controller;

import java.util.Date;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webpetlove.ph.entity.Bill;
import com.webpetlove.ph.entity.BillDetail;
import com.webpetlove.ph.entity.Recommend;
import com.webpetlove.ph.entity.allBill;
import com.webpetlove.ph.mysql.repo.RecomendRepository;
import com.webpetlove.ph.entity.User;
import com.webpetlove.ph.model.Cart;
import com.webpetlove.ph.model.Item;
import com.webpetlove.ph.mysql.repo.BillDetailRepository;
import com.webpetlove.ph.mysql.repo.BillRepository;

@Controller
@RequestMapping("/checkout")
public class CheckoutContrller {
  
  public @Autowired BillRepository billRepository;
  public @Autowired BillDetailRepository billDetailRepository;
  private @Autowired RecomendRepository recomendReposity;

  @PostMapping("")
  public String checkout(@RequestParam String payment, @RequestParam String address, @RequestParam String phone, HttpServletRequest request) throws IOException{

      String product = "";
      long quantity = 0;
      double price = 0;
      HttpSession session = request.getSession();
      Cart cart = (Cart) session.getAttribute("cart");
      User user = (User) session.getAttribute("user");
      File file = new File("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\out.txt");
      FileWriter fw = new FileWriter(file, true);
      PrintWriter pw = new PrintWriter(fw);	
      pw.println();
      List<allBill> ListallBill = new ArrayList<allBill>();
      try {
          Bill bill = new Bill();
          bill.setAddress(address);
          bill.setPayment(payment);
          bill.setUserId(user.getId());
          bill.setDate(new Date());
          bill.setTotal(cart.totalCart());
          bill.setStatus((short)1);
          bill.setPhone(phone);
          bill.setNoti(false);
          billRepository.save(bill);
          
          for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
            billDetailRepository.save(new BillDetail(bill.getId(),
                      list.getValue().getProduct().getProductID(),
                      list.getValue().getProduct().getProductPrice(),
                      list.getValue().getQuantity()));
            		  ListallBill.add(new allBill(list.getValue().getProduct().getProductID()));
              product = list.getValue().getProduct().getProductName();
              quantity = list.getValue().getQuantity();
              price = list.getValue().getProduct().getProductPrice();
          }
          
          ListallBill.forEach((item)->{
        	  System.out.print(item.getProductId() +" ");
        	  pw.print(item.getProductId()+" ");
          });
          pw.close();
        //theem khuyeens nghi vao sql
          try (BufferedReader bufferedReader =
		            new BufferedReader(new FileReader("G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt"))) {
				   String line = bufferedReader.readLine();
				   int i=0,sodongResultAI=0;
				   while (line != null) 
				   {
					   
					   sodongResultAI++;
				       line = bufferedReader.readLine();
				   }  
				// Đọc dữ liệu từ File với File và FileReader
				   String url = "G:\\DoAnTotNghiep\\WebPetLove\\src\\main\\resources\\resultAI.txt";
			        File file2 = new File(url);
			        BufferedReader reader = new BufferedReader(new FileReader(file2));
			        String LineResultAI = reader.readLine();
			       //end
				   System.out.print("so dong trong file la : "+ sodongResultAI +"\n");
				   Integer[] nbs = new Integer[sodongResultAI]; 
				   while (LineResultAI != null) 
				   {
					   
					   String [] array = LineResultAI.split(" ");
					   nbs[i]= array.length;
					   i++;
					   LineResultAI = reader.readLine();
				   }
				   int minResultAI =nbs[0] ;
				   int maxResultAI = nbs[0];
				   for( int s =0 ; s< nbs.length; s++)
				   {
					   if( nbs[s] < minResultAI)
					   {
						   minResultAI = nbs[s];
					   }
					   if( nbs[s]> maxResultAI)
					   {
						   maxResultAI = nbs[s];
					   }
				   }
				   System.out.print("min : "+ minResultAI +"\n");
				   System.out.print("max : "+ maxResultAI +"\n");
				// đọc file và ghi vào mảng 2 chiều
				String[][] arrResultAI = new String [sodongResultAI][maxResultAI];
				String[] arr2_ResultAI = new String[maxResultAI];
				ArrayList<String> listResultAI = new ArrayList<String>();
				BufferedReader readersResultAI = new BufferedReader(new FileReader(file2));
		        String LineResultAIs = readersResultAI.readLine();
		        while (LineResultAIs != null) 
				   {
		        	String [] array = LineResultAIs.split(" ");
		        	int L = array.length;
					   for( int s =0 ; s< L; s++)
					   {
						   listResultAI.add(array[s]);
						   if( s == L-1)
						   {
							   for(int k=L+1 ; k<=maxResultAI ; k++)
							   {
								   listResultAI.add("0");
							   }
						   }
					   }
					   LineResultAIs = readersResultAI.readLine();
				   }
		        int j=0;
		        String s1 ="0";
		        for( int a =0 ; a< sodongResultAI ; a++)
		        {
		        		for( int b =0 ; b<maxResultAI ; b++)
			        	{
//		        				if(!((listResultAI.get(j)).equals(s1)))
//		        				{
		        					arrResultAI[a][b] = listResultAI.get(j);
//		        				}
		        				Long product_id_recomened = Long.parseLong(arrResultAI[a][b]);
		        				Long Loai_recomend = Long.parseLong(arrResultAI[a][0]);
		        				System.out.print(listResultAI.get(j));
		        				Recommend recomend = new Recommend();
								
								  if(product_id_recomened != 0) { recomend.setProduct_id(product_id_recomened);
								  recomend.setLoai_Recommend(Loai_recomend); recomendReposity.save(recomend); }
								 
		        				j++;
			        	}
		        	System.out.println();
		        }
			} catch (IOException e) {
				   e.printStackTrace();
			}
          //end
          cart = new Cart();
          session.setAttribute("cart", cart);      
      } catch (Exception e) {

      }
      return ("redirect:/shop/homepage");
  } 
}
