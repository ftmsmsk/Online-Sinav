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

import Properties.secenekPro;
import Properties.soruPro;
import Utils.DB;

@Controller
public class SecenekEkle {

	DB db=new DB();
	
	@RequestMapping(value="/SecenekEkle/{sid}",method=RequestMethod.GET)
	public String SoruIslemleri(@PathVariable String sid,Model model) {
		List<soruPro> ls=new ArrayList<soruPro>();
		
		System.out.println("sid:   "+sid);
		try {
			String q="Call soruGetir('"+sid+"')";
			ResultSet rs=db.baglan().executeQuery(q);
			if(rs.next()) {
				soruPro s=new soruPro();
				s.setSid(sid);
				s.setSoruAdi(rs.getString(1));
				model.addAttribute("s",s);
			}
			
		} catch (Exception e) {
			System.err.println("Soru getirme hatasý!!"+e);
		}
		
		List<secenekPro> lp=new ArrayList<secenekPro>();
		try {
			String q="Call secenekGetir('"+sid+"')";
			ResultSet rs=db.baglan().executeQuery(q);
			while(rs.next()) {
				secenekPro p=new secenekPro();
				p.setSoruid(rs.getString(1));
				p.setSecenekid(rs.getString(2));
				p.setSecenek(rs.getString(3));
				p.setSdurum(rs.getString(4));
				lp.add(p);
				
				
			}
			model.addAttribute("lp",lp);
		} catch (Exception e) {
			System.err.println("Secenek Getirme Hatasi:"+e);
		}
		return "SecenekEkle";
	}
	
	
	
	
	@RequestMapping(value="/dataAl/{sid}",method=RequestMethod.POST)
	public String dataAl(@PathVariable String sid,@RequestParam String cvp,@RequestParam String cevap) {
		try {
			String q="Call secenekEkle('"+sid+"','"+cvp+"','"+cevap+"')";
			ResultSet rs=db.baglan().executeQuery(q);
		} catch (Exception e) {
			System.err.println("Seçenek Baþarýyla Eklenemedi!!"+e);
		}
		System.out.println(cvp);
		System.out.println(cevap);
		return "redirect:/SecenekEkle/"+sid;
	}
	
	

	@RequestMapping(value="/secenekSil/{sid}/{secenekid}",method=RequestMethod.GET)
	public String secenekSil(@PathVariable String sid,@PathVariable String secenekid ) {
		System.out.println("secenekid:"+secenekid);
		try {
			String q="Call secenekSil('"+secenekid+"')";
			db.baglan().executeUpdate(q);
			
			
			
		} catch (Exception e) {
			System.err.println("Seçenek Baþarýyla Silinemedi!!"+e);
		}
		
		return "redirect:/SecenekEkle/"+sid;
	}
	
	
	
	
	
	
}
