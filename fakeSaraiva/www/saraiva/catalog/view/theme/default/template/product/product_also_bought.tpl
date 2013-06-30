<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet_also_bought.css" />

<div id="product_also_bought" class="tabs_also_bought">
    <a class="selected" tab="#tab_product_also_bought"><?php echo $tab_also_bought_title; ?></a>
</div>
<div id="tab_product_also_bought" class="tab_page">
	<?php if ($products_also_bought) { ?>
      <table class="list">
        <?php for ($i = 0; $i < sizeof($products_also_bought); $i = $i + 4) { ?>
        <tr>
          <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
          <td width="25%"><?php if (isset($products_also_bought[$j])) { ?>
            <a href="<?php echo str_replace('&', '&amp;', $products_also_bought[$j]['href']); ?>"><img src="<?php echo $products_also_bought[$j]['thumb']; ?>" title="<?php echo $products_also_bought[$j]['name']; ?>" alt="<?php echo $products_also_bought[$j]['name']; ?>" /></a><br />
            <a href="<?php echo str_replace('&', '&amp;', $products_also_bought[$j]['href']); ?>"><?php echo $products_also_bought[$j]['name']; ?></a><br />
            <span style="color: #999; font-size: 11px;"><?php echo $products_also_bought[$j]['model']; ?></span><br />
            <?php 
			$display_price = 0;
			if ($display_price) { ?>
            <?php if (!$products_also_bought[$j]['special']) { ?>
            <span style="color: #900; font-weight: bold;"><?php echo $products_also_bought[$j]['price']; ?></span>
            <?php } else { ?>
            <span style="color: #900; font-weight: bold; text-decoration: line-through;"><?php echo $products_also_bought[$j]['price']; ?></span> <span style="color: #F00;"><?php echo $products_also_bought[$j]['special']; ?></span>
            <?php } ?>
			<a class="button_add_small" href="<?php echo $products_also_bought[$j]['add']; ?>" title="<?php echo $button_add_to_cart; ?>" >&nbsp;</a>
            <?php } ?>
            <br />
            <?php if ($products_also_bought[$j]['rating']) { ?>
            <img src="catalog/view/theme/default/image/stars_<?php echo $products_also_bought[$j]['rating'] . '.png'; ?>" alt="<?php echo $products_also_bought[$j]['stars']; ?>" />
            <?php } ?>
            <?php } ?></td>
          <?php } ?>
        </tr>
        <?php } ?>
      </table>
      <?php } else { ?>
      <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;"><?php echo $text_no_product_also_bought; ?></div>
      <?php } ?>
</div>
<script type="text/javascript"><!--
$("#product_also_bought").tabs('a'); 
//--></script>

