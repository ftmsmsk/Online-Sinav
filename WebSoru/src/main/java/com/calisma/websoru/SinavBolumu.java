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

import Properties.kullaniciPro;
import Properties.secenekPro;
import Properties.sinavSoruGetirPro;
import Properties.soruPro;
import Utils.DB;

@Controller
public class SinavBolumu {

	@RequestMapping(value = "SinavBolumu/{katid}", method = RequestMethod.GET)
	public String SinavBolumu(@PathVariable String katid) {

		return "SinavBolumu";
	}

	String kulid;
	int i;

	DB db = new DB();

	@RequestMapping(value = "/sinavBasla", method = RequestMethod.POST)
	public String SinavSoruGetir(@RequestParam String adi, @RequestParam String soyadi,
			@RequestParam(defaultValue = "") String exampleRadios, Model model) {
		try {
			String q = "Call kullaniciKayit('" + adi + "','" + soyadi + "')";
			db.baglan().executeQuery(q);
		} catch (Exception e) {
			System.out.println("kullanýcý kaydý basarýsýzdýr!!");
		}

		List<kullaniciPro> ls = new ArrayList<kullaniciPro>();
		try {
			String q = "Call kullaniciId('" + adi + "','" + soyadi + "')";
			ResultSet rs = db.baglan().executeQuery(q);
			if (rs.next()) {
				kullaniciPro k = new kullaniciPro();
				k.setKid(rs.getString(1));
				kulid = rs.getString(1);
				// System.out.println("aaaaaaaaaaaaaa"+rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("Kullanici idsi alinamadi!!!");
		}

		return "SinavBolumu";
	}

	@RequestMapping(value = "/sinavBasladi", method = RequestMethod.GET)
	public String sinavBasla(Model model) {

		System.out.println("i:" + i);
		i = 0;
		List<soruPro> sorugtr = sinavSoruGetir();
		List<secenekPro> secenekLs = secenekGetirme(sorugtr.get(i).getSid());

		model.addAttribute("i", (i + 1));
		model.addAttribute("soru", sorugtr.get(i).getSoruAdi());
		model.addAttribute("sinavBasla", "Sýnav Baþladý.");
		if (secenekLs.size() > 0) {
			model.addAttribute("secenekLs", secenekLs);
			System.out.println(" secenekLs list gonderildi");
		}
		return "SinavBolumu";
	}

	@RequestMapping(value = "/sinavBasladi", method = RequestMethod.POST)
	public String sinavBasla1(Model model, @RequestParam(defaultValue = "0") String exampleRadios) {
		
		System.out.println("i:" + i);
		List<soruPro> sorugtr = sinavSoruGetir();
		kayit(sorugtr.get(i).getSid(), exampleRadios, kulid);
		i++;
		if (i < sorugtr.size()) {
			List<secenekPro> secenekLs = secenekGetirme(sorugtr.get(i).getSid());

			model.addAttribute("i", (i + 1));
			model.addAttribute("soru", sorugtr.get(i).getSoruAdi());
			model.addAttribute("sinavBasla", "Sýnav Baþladý.");
			if (secenekLs.size() > 0) {
				model.addAttribute("secenekLs", secenekLs);
				System.out.println(" secenekLs list gonderildi");
			}
		}else {
			model.addAttribute("sinavBitti", "Sýnav Bitti.");
		}
		return "SinavBolumu";
	}

	public List<soruPro> sinavSoruGetir() {
		List<soruPro> sorugtr = new ArrayList<soruPro>();
		try {

			String q = "call sinavSorulari()";
			ResultSet rs = db.baglan().executeQuery(q);
			while (rs.next()) {
				soruPro qp = new soruPro();
				qp.setSid(rs.getString(1));
				qp.setSoruAdi(rs.getString(2));
				sorugtr.add(qp);
			}

		} catch (Exception e) {
			System.err.println("soru getirme hatasi:" + e);
		}

		return sorugtr;

	}

	public List<secenekPro> secenekGetirme(String sid) {
		List<secenekPro> secenekLs = new ArrayList<secenekPro>();
		try {
			String q = "call secenekGetir('" + sid + "')";
			ResultSet rs = db.baglan().executeQuery(q);
			while (rs.next()) {
				secenekPro op = new secenekPro();
				op.setSoruid(rs.getString(1));
				op.setSecenekid(rs.getString(2));
				op.setSecenek(rs.getString(3));
				op.setSdurum(rs.getString(4));

				secenekLs.add(op);
			}
		} catch (Exception e) {
			System.err.println("secenek getirme hatasi:" + e);
		}

		return secenekLs;
	}

	public String kayit(String soruid, String exampleRadios, String kulid) {
		try {
			String q = "Call sinavKayit('" + soruid + "','" + exampleRadios + "','" + kulid + "')";
			db.baglan().executeUpdate(q);
		} catch (Exception e) {
			System.out.println("sýnav kaydý basarýlamadý" + e);
		}
		return "SinavBolumu";
	}

}
