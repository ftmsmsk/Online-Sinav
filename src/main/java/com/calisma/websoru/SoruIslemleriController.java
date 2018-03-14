package com.calisma.websoru;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import Properties.soruPro;
import Utils.DB;

@Controller
public class SoruIslemleriController {

	DB db=new DB();
	
	@RequestMapping(value="SoruIslemleri/{katid}",method=RequestMethod.GET)
	public String SoruIslemleri(@PathVariable String katid,Model model) {
		
		List<soruPro> ls=new ArrayList<soruPro>();
		try {
			String q="select * from sorular";
			ResultSet rs=db.baglan().executeQuery(q);
			while(rs.next()) {
				soruPro u=new soruPro();
				u.setSid(rs.getString(1));
				u.setSoruAdi(rs.getString(2));
				ls.add(u);
				System.out.println("adi:"+rs.getString(2));
				
			}
			model.addAttribute("ls",ls);
		} catch (Exception e) {
			System.err.println("Data Getirme Hatasi:"+e);
		}
		
		return "SoruIslemleri";
	}
	
	@RequestMapping(value="/SoruIslemleri/1/soruAl",method=RequestMethod.POST)
	public String soruAl(@RequestParam String soru,Model model) {
		
		if(soru.equals("")) {
			model.addAttribute("hata","Lütfen sorunuzu yazýnýz ! ");
		}else {
		
		
		try {
			String q="Call soruekle('"+soru+"')";
			db.baglan().executeQuery(q);
			
		} catch (Exception e) {
			System.err.println("Soru yazma iþlemi baþarýsýzdýr!");
		}
		}
		model.addAttribute("soru",soru );
		SoruIslemleri("1", model);
		
		return "SoruIslemleri";
		
	}

	
	@RequestMapping(value="/SoruSil/{sid}",method=RequestMethod.GET)
	public String soruSil(@PathVariable String sid,Model model) {
		
		try {
			String q="Call soruSil('"+sid+"')";
			db.baglan().executeUpdate(q);
			
		} catch (Exception e) {
			System.err.println("Soru silme iþlemi baþarýsýzdýr!");
		}
		
		SoruIslemleri("1", model);
		return "SoruIslemleri";
	}
	
	
	
	
	
	
	
	
}
