<?php
	if(MODULE_PRODUCT_ALSO_BOUGHT_INCLUDED != 1) exit;
	$this->load->model('catalog/product_also_bought');
    $this->language->load('product/product_also_bought');
    $this->data['tab_also_bought_title'] = $this->language->get('tab_also_bought_title');
    $this->data['text_no_product_also_bought'] = $this->language->get('text_no_product_also_bought');
    $this->data['products_also_bought'] = array(); 
    $products_also_bought_result = $this->model_catalog_product_also_bought->getProductAlsoBought($this->request->get['product_id'], 4);
    
    foreach ($products_also_bought_result as $result) {
		if ($result['image']) {
			$image = $result['image'];
		} else {
			$image = 'no_image.jpg';
		}
	
		if ($this->config->get('config_review')) {
			$rating = $this->model_catalog_review->getAverageRating($result['product_id']);	
		} else {
			$rating = false;
		}
		
		$special = FALSE;
		
		//$discount = 10; //$this->model_catalog_product->getProductDiscount($result['product_id']);
		$discount=0;
		if ($discount) {
			$price = $this->currency->format($this->tax->calculate($discount, $result['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			//$special = $this->model_catalog_product->getProductSpecial($result['product_id']);
		
			if ($special) {
				$special = $this->currency->format($this->tax->calculate($special, $result['tax_class_id'], $this->config->get('config_tax')));
			}
		}
	
		$options = $this->model_catalog_product->getProductOptions($result['product_id']);
	
		if ($options) {
			$add = 'index.php?route=product/product&product_id=' . $result['product_id'];
		} else {
			$add = HTTPS_SERVER . 'index.php?route=checkout/cart&product_id=' . $result['product_id'];
		}
		
		$link='index.php?route=product/product&product_id=' . $result['product_id'];
			
	
		$this->data['products_also_bought'][] = array(
			'product_id'    => $result['product_id'],
			'name'    		=> $result['name'],
			'model'   		=> $result['model'],
			'rating'  		=> $rating,
			'stars'   		=> sprintf($this->language->get('text_stars'), $rating),
			'price'   		=> $price,
			'options'   	=> $options,
			'special' 		=> $special,
			'image'   		=> $this->model_tool_image->resize($image, 38, 38),
			'thumb'   		=> $this->model_tool_image->resize($image, $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height')),
			'href'    		=> $link,
			'add'    		=> $add
		);
	}
	    	
?>