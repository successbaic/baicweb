/**
 * eID select plugin
 */
(function($) {

	var refresh = function(o, type) {

		o.each(function() {

					var mclass1 = "eIDUI_select";
					var mclass2 = "eIDUI_selectckd";
					var mclass3 = "eIDUI_selectlist";

					var vselect = $(this);
					var selectobj = $(vselect.find("select").get(0));
					selectobj.trigger("eIDEventItemSelected");

					mclass1 = selectobj.parents("div").attr("class");
					mclass2 = $(selectobj.parents("div").children("div").get(0))
							.attr("class");
					mclass3 = $(selectobj.parents("div").children("div").get(1))
							.attr("class");

					if (vselect.find("select").get(0).length == 0) {
						vselect.find("." + mclass1).hide();
						vselect.addClass("eIDUI_nodevice");
					} else {
						vselect.removeClass("eIDUI_nodevice");
						vselect.find("." + mclass1).show();
						selectobj.siblings("." + mclass3).hide().children("ol")
								.children("li").remove();
						selectobj
								.children("option")
								.each(
										function() {
										    var bankCardType=""
											if(null==$(this).attr('bankTailNumer') || $(this).attr('bankTailNumer')==""){
												bankCardType=$(this).attr('bankCardType');
											}else{
												bankCardType="&nbsp;" + $(this).attr('bankCardType');
											}
											selectobj
													.siblings("." + mclass3)
													.children("ol")
													.append(
															"<li><div style='clear:both'></div><div style='float:left;margin-top:4px;'><img src='"
																	+ $(this)
																			.attr(
																					'logoUrl1')
																	+ "' height='46px', width='58px'/></div><div style='float:left;text-align:left'><div>"
																	+ $(this)
																			.attr(
																					'issueBank')
																	+ "&nbsp;</div><div style='font-size:12px;color:#919191'>"
																	+ $(this)
																			.attr('bankTailNumer')
																	+ bankCardType
																	+ "</div></div></li>");
										});
										
					    var bankCardType=""
						if(null==selectobj.find("option:selected").attr('bankTailNumer') 
						         || selectobj.find("option:selected").attr('bankTailNumer')==""){
							bankCardType= selectobj.find("option:selected").attr('bankCardType');
						}else{
							bankCardType="&nbsp;" + selectobj.find("option:selected").attr('bankCardType');
						}
						selectobj
								.siblings("." + mclass2)
								.html(
										"<div style='clear:both'></div><div style='float:left;margin-top:4px;'><img src='"
												+ selectobj.find(
														"option:selected")
														.attr('logoUrl1')
												+ "' height='46px' width='58px'/></div><div style='float:left;text-align:left'><div>"
												+ selectobj.find(
														"option:selected")
														.attr('issueBank')
												+ "&nbsp;</div><div style='font-size:12px;color:#919191'>"
												+ selectobj.find(
														"option:selected")
														.attr('bankTailNumer')	
												+ bankCardType
												+ "</div>");
						selectobj.siblings("." + mclass3).find("li").click(
								function() {
									$(this).parents("." + mclass3).siblings(
											"." + mclass2).html($(this).html())
											.siblings("select").children(
													"option").eq(
													$(this).index()).attr(
													"selected", true).siblings(
													"option").attr("selected",
													false);
									$(this).parents("." + mclass3).siblings(
											"." + mclass2).html($(this).html())
											.siblings("select").trigger("eIDEventItemSelected");
								});
					}
				});
	};

	$.fn.eIDselect = function(options) {

		if (options == "refresh") {
			refresh($(this));
			return;
		}
		var defaults = {
			"width" : "211px",
			// "mclass" : "",
			"scroll" : false,
			"ddheight" : "180px",
			"type" : 1,
			"installed" : false
		};
		var options = $.extend({}, defaults, options);

		this.init = function() {
			return this
					.each(function() {
						
						var vselect = $(this); // div
						vselect.html("");
						if (options.installed == false) {
							var html = "<div class='eIDUI_dtl3'>"
									+ "<div class='eIDUI_btndiv2'>"
									+ "<input type='button' onclick='setupPlugin();' value='请点此安装控件'"
									+ "class=' eIDUI_plugin_setup' id='btnok' />" + "</div>"
									+ "<div class='eIDUI_btndivt'>"
									+ "<p class='eIDUI_pluginp'>控件安装完毕才能登录</p>"
									+ "</div>" + "</div>";
							vselect.html(html);
							return;
						}

						var mclass1 = "eIDUI_select";
						var mclass2 = "eIDUI_selectckd";
						var mclass3 = "eIDUI_selectlist";

						if (options.type == 2) {
							mclass1 = "eIDUI_select2";
							mclass2 = "eIDUI_selectckd2";
							mclass3 = "eIDUI_selectlist2";
						}
						

						if (vselect.parent("." + mclass1).length <= 0) {

							vselect.append(
									"<div class='" + mclass1 + "'></div>")
									.children("." + mclass1).append(
											"<div class='" + mclass2 + "'>"
											// +
											// vselect.children("option:checked").text()
											+ "</div><div class='" + mclass3
													+ "'><ol></ol></div>")
									.append(
											"<select id='" + vselect.attr("id")+"Select"
													+ "'></select>");
						}
						
						var selectobj = $(vselect.find("select").get(0));
						selectobj.children("option").each().end().hide()
								.parent("." + mclass1).click(
										function() {
											$(this).css("z-index", "10000")
													.children("." + mclass3)
													.slideToggle("fast");
										}).mouseleave(
										function() {
											$(this).children("." + mclass3)
													.slideUp("fast");
										}).children("." + mclass3).find("li")
								.click(
										function() {
											$(this).parents("." + mclass3)
													.siblings("." + mclass2)
													.text($(this).text())
													.siblings("select")
													.children("option").eq(
															$(this).index())
													.attr("selected", true)
													.siblings("option").attr(
															"selected", false);
											
										});
										
										

						if (options.width) {
							selectobj.parent("." + mclass1).css("width",
									options.width);
						}
						/*if (options.height) {
							selectobj.parent("." + mclass1).css("height",
									options.height);
						}*/

						/*
						 * if (options.id) {
						 * selectobj.parent("."+mclass1).attr("id", options.id); }
						 */

						if (options.mclass) {
							selectobj.parent("." + mclass1).addClass(
									options.mclass);
						}

						if (options.scroll) {
							selectobj.siblings("." + mclass3).css("overflow",
									"auto");
							selectobj.siblings("." + mclass3).css("height",
									"40px");
						}
						if (options.ddheight) {
							selectobj.siblings("." + mclass3).css("height",
									options.ddheight);
						}
					});
		};

		return this.init();

	};

	/*
	 * $.fn.eIDselect.refresh = function(){ refresh($(this)); }
	 */

})(jQuery);
