package com.urfavoriteott.ufo.contents.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.urfavoriteott.ufo.contents.model.service.PaymentService;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    
    @RequestMapping("payment.pay")
	public String paymentView() {

		return "contents/payment";
	}

	@RequestMapping("insert.pay")
	public String insertPay() {

		return "";
	}
}