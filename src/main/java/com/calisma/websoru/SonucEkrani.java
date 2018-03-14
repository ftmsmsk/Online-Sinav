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

import Properties.sinavSoruGetirPro;
import Properties.sonucGetirPro;
import Utils.DB;

@Controller
public class SonucEkrani {

    DB db=new DB();
	@RequestMapping(value="SonucEkrani/{katid}",method=RequestMethod.GET)
	public String SoruIslemleri(@PathVariable String katid,Model model) {
		
		return "SonucEkrani";
	}
	
	int i=0;
	@RequestMapping(value="/sonucGetir",method=RequestMethod.POST)
	public String sonuc(@RequestParam String ad,@RequestParam String soyad,Model model) {
		
		List<sonucGetirPro> sg=new ArrayList<sonucGetirPro>();
		try {
			String q="Call sonucGetir('"+ad+"','"+soyad+"')";
			ResultSet rs=db.baglan().executeQuery(q);
			while(rs.next()) {
				i++;
				sonucGetirPro g=new sonucGetirPro();
				g.setSid(i+"");
				g.setSoruAdi(rs.getString(2));
				g.setSecenek(rs.getString(3));
				g.setSdurum(rs.getString(4));
				sg.add(g);
			}
			model.addAttribute("sg",sg);
		} catch (Exception e) {
		System.err.println("Sonuc Getirme hatasi!!!"+e);
		}
		
		
		
		
		
		return "SonucEkrani";
	}
	
	
	
	
}
