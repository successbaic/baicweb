package com.macrosoft.icms.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;
import com.macrosoft.icms.qydj.QYDJ_CZXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;

public class PDFGszcCreator {
	private static BaseFont bfChinese;  

	public BaseFont getBfChinese() {  
        return bfChinese;    
    }    
    
    public void setBfChinese(BaseFont bfChinese) {    
        this.bfChinese = bfChinese;    
    }    

    /**
     * 自然人独资章程
     * @param openo
     * @throws DocumentException
     * @throws IOException
     * @throws ParseException 
     */
    public static void createDzGszcPdfByData(String fileName,String path,Map dataMap) throws DocumentException, IOException, ParseException {  
		//设置PDF输出路径
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

		Date date = new Date();
		 //转换日期格式
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    String createDate = formatter.format(date);
		Map<String, String> jbxxMap = (Map<String, String>) dataMap.get("jbxxMap");
		String entname =(String)jbxxMap.get("entname");
		String dom =(String)jbxxMap.get("dom");
		String busscope =(String)jbxxMap.get("busscope");
		String regcap =(String)jbxxMap.get("regcap");
		String opfyears =(String)jbxxMap.get("opfyears");
    	Rectangle rect = new Rectangle(PageSize.A4);  
        Document doc = new Document(rect, 50.0F, 50.0F, 50.0F, 50.0F); 
    	PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(filePath));
    	doc.open();
    		
    	// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// 标题字体风格
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "有限公司章程";
		Paragraph title = new Paragraph(contextString, titleFont);
		// 设置标题格式对齐方式
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// 正文字体风格
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context11String ="第一章    总   则";
		Paragraph context11 = new Paragraph(context11String,font);
	 	// 正文格式左对齐
	 	context11.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context11.setSpacingBefore(20);
	 	doc.add(context11);
	 	
		String context12String = "          第一条  为适应社会主义市场经济的要求，发展生产力，依据《中华人民共和国公司法》（以下简称《公司法》）及有关法律、法规制定本章程。";
		Paragraph context12 = new Paragraph(context12String,font);
	 	// 正文格式左对齐
	 	context12.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context12.setSpacingBefore(10);
	 	doc.add(context12);
	 	
		String context21String = "第二章    	公司名称和住所";
		Paragraph context21 = new Paragraph(context21String,font);
	 	// 正文格式左对齐
	 	context21.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context21.setSpacingBefore(10);
	 	doc.add(context21);
	 	
		String context22String = "          第二条    公司名称："+entname+
		"\n"+
		"           第三条    公司住所："+dom;
		Paragraph context22 = new Paragraph(context22String,font);
		// 正文格式左对齐
		context22.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context22.setSpacingBefore(10);
		doc.add(context22);
	 	
		String context31String = "第三章	    公司经营范围";
		Paragraph context31 = new Paragraph(context31String,font);
	 	// 正文格式左对齐
	 	context31.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context31.setSpacingBefore(10);
	 	doc.add(context31);
	 	
	 	String context32String = "          第四条	公司经营范围："+busscope;
		Paragraph context32 = new Paragraph(context32String,font);
		// 正文格式左对齐
		context32.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context32.setSpacingBefore(10);
		doc.add(context32);
	 	
		String context41String = "第四章    公司注册资本、股东姓名或名称、出资方式、出资额及出资时间";
		Paragraph context41 = new Paragraph(context41String,font);
	 	// 正文格式左对齐
	 	context41.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context41.setSpacingBefore(10);
	 	doc.add(context41);
	 	
	 	String context42String = "          第五条  公司注册资本 "+regcap+" 万元人民币。"+
	 		 	"\n"+
	 		 	"           第六条  股东姓名或名称、出资额、出资方式及出资比例如下：\n";
		List czxxList = (List) dataMap.get("czxxList");
		String inv ="";
		String condate ="";
	    float subconam = (float) 0.00;
		float subconprop = (float) 0.00;
		for(int i=0;i<czxxList.size();i++){
			QYDJ_CZXX_SQ czsq = (QYDJ_CZXX_SQ) czxxList.get(i);
             inv = czsq.getINV();
             condate = czsq.getCONDATE();
             if(!"".equals(condate)){
             Date dat= sdf.parse(condate);
             condate=formatter.format(dat);
             }
             subconam = czsq.getSUBCONAM();
             subconprop = czsq.getSUBCONPROP();
             context42String+="                             "+inv+"以货币认缴出资 "+subconam+" 万元，占总资本的 "+subconprop+"%；\n"+
            		 "                             股东认缴的出资于 "+condate+" 前全部缴清。\n";
		}
	 	
		Paragraph context42 = new Paragraph(context42String,font);
		// 正文格式左对齐
		context42.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context42.setSpacingBefore(10);
		doc.add(context42);
		
		String context51String = "第五章    股东转让出资的条件";
		Paragraph context51 = new Paragraph(context51String,font);
	 	// 正文格式左对齐
	 	context51.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context51.setSpacingBefore(10);
	 	doc.add(context51);
	 	
	 	String context52String = "          第七条  股东可以向股东以外的人转让其全部或部分出资。"+
	 	"\n"+ 
	 	"          第八条  股东依法转让其出资后，由公司将受让人的姓名或名称、住址以及受让的出资额记载于股东名册。";
		Paragraph context52 = new Paragraph(context52String,font);
		// 正文格式左对齐
		context52.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context52.setSpacingBefore(10);
		doc.add(context52);
		
		String context61String = "第六章    公司组织机构及产生办法、职权";
		Paragraph context61 = new Paragraph(context61String,font);
	 	// 正文格式左对齐
	 	context61.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context61.setSpacingBefore(10);
	 	doc.add(context61);
	 	
	 	String context62String = "          第九条    公司不设股东会，股东是公司的最高权力机构。\n 股东行使下列职权：\n"+
	 	"          （一）决定公司的经营方针和投资计划；\n"+
	 	"          （二）委派和撤换非由职工代表担任的执行董事、监事，决定有关执行董事、监事的报酬事项；\n	"+
	 	"          （三）审议批准执行董事的报告；\n"+
	 	"          （四）审议批准监事的报告；\n"+
	 	"          （五）审议批准公司的年度财务预算方案、决算方案；\n"+
	 	"          （六）审议批准公司的利润分配方案和弥补亏损方案；\n"+
	 	"          （七）对公司增加或者减少注册资本作出决定；\n"+
	 	"          （八）对发行公司债券作出决定；\n"+
	 	"          （九）对公司合并、分立、变更公司形式、解散和清算等事项作出决定； \n"+
	 	"          （十）修改公司章程；\n"+
        "          （十一）公司章程规定的其它职权。\n"+
	 	"          股东做出上款所列决定时，应当采取书面形式，并由股东签名后置备于公司。"+
        "\n"+
	 	"          第十条  公司设执行董事一人，由股东委派产生。执行董事每届任期3年，任期届满，经委派可连任。执行董事对股东负责，行使下列职权：\n"+
	 	"          （一）决定公司的经营计划和投资方案；\n"+
	 	"          （二）制订公司的年度财务预算方案、决算方案；\n"+
	 	"          （三）制订公司的利润分配方案和弥补亏损方案；\n"+
	 	"          （四）制订公司增加或者减少注册资本的方案；\n"+
	 	"          （五）拟订公司合并、分立、变更公司形式、解散的方案；\n"+
	 	"          （六）决定公司内部管理机构的设置；\n"+
	 	"          （七）聘任或者解聘公司高级管理人员，决定其报酬事项；\n"+
	 	"          （八）制定公司的基本管理制度。"+
	 	"\n"+
	 	"          第十一条  公司设经理一名，由执行董事聘任或者解聘。"+
	 	"\n"+
	 	"          第十二条  经理对执行董事负责，行使下列职权：\n"+
	 	"          （一）主持公司的生产经营管理工作；\n"+
	 	"          （二）组织实施公司年度经营计划和投资方案；\n"+
	 	"          （三）拟订公司内部管理机构设置方案；\n"+
	 	"          （四）拟订公司的基本管理制度；\n"+
	 	"          （五）制定公司的具体规章；\n"+
	 	"          （六）提请聘任或者解聘公司副经理、财务负责人；\n"+
	 	"          （七）聘任或者解聘除应由执行董事聘任或者解聘以外的负责管理的人员；"+
	 	"\n"+
	 	"          第十三条  公司设监事一名，由股东委派产生，每届任期三年，任期届满，经股东委派可以连任。"+
	 	"\n"+
	 	"          第十四条  监事行使下列职权：\n"+
	 	"          （一）	检查公司财务；\n"+
	 	"          （二）对执行董事、高级管理人员执行公司职务时违反法律、法规或者公司章程的行为进行监督；对违反法律、行政法规、公司章程的执行董事、高级管理人员提出罢免的建议；\n"+
	 	"          （三）当执行董事和高级管理人员的行为损害公司利益时，要求执行董事和经理予以纠正；\n"+
	 	"          （四）向股东提出议案；\n"+
	 	"          （五）依照《公司法》的规定，对公司执行董事、高级管理人员提起诉讼。"+
	 	"\n"+
	 	"          第十五条  执行董事、监事应当遵守法律、行政法规以及公司章程，忠实履行职务，维护公司利益，不得利用在公司的地位和职权，为自己牟取私利。执行董事、监事执行公司职务时违反法律、行政法规或者公司章程的规定，给公司造成损害的，应当承担赔偿责任。";	 	
		Paragraph context62 = new Paragraph(context62String,font);
		// 正文格式左对齐
		context62.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context62.setSpacingBefore(10);
		doc.add(context62);
		
		String context71String = "第七章	公司的法定代表人";
		Paragraph context71 = new Paragraph(context71String,font);
	 	// 正文格式左对齐
	 	context71.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context71.setSpacingBefore(10);
	 	doc.add(context71);
	 	
	 	String context72String = "          第十六条  执行董事为公司的法定代表人，每届任期为三年，由股东委派产生。"+
	 	"\n"+
	 	"          第十七条  公司法定代表人行使下列职权：\n"+
	 	"          （一）代表公司签署有关文件；\n"+
	 	"          （二）本章程第十条规定的职权。";
		Paragraph context72 = new Paragraph(context72String,font);
		// 正文格式左对齐
		context72.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context72.setSpacingBefore(10);
		doc.add(context72);
		
		String context81String = "第八章	财务、会计、利润分配及劳动用工制度";
		Paragraph context81 = new Paragraph(context81String,font);
	 	// 正文格式左对齐
	 	context81.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context81.setSpacingBefore(10);
	 	doc.add(context81);
	 	
	 	String context82String = "          第十八条  公司应当依照法律、行政法规和国务院财政部门的规定建立本公司的财务、会计制度。"+
	 	"\n"+
	 	"          第十九条  公司应当在每一年度终了时编制财务会计报告，并依法经会计师事务所审计，于第二年三月一日前将财务会计报告送交股东。"+
	 	"\n"+
	 	"          第二十条  公司分配当年税后利润时，应当提取利润的百分之十列入公司法定公积金，公司法定公积金累积额为公司注册资本的百分之五十以上的，可不再提取。\n"+
	 	"          公司的法定公积金不足以弥补以前年度亏损的，在依照前款规定提取法定公积金之前，应当先用当年利润弥补亏损。\n"+
	 	"          公司从税后利润中提取法定公积金后，经股东同意，还可以从税后利润中提取任意公积金。"+
	 	"\n"+
	 	"          第二十一条  公司的公积金用于弥补公司的亏损，扩大公司生产经营或者转为增加公司资本。\n"+
	 	"          法定公积金转为资本时，所留存的该项公积金不得少于转增前注册资本的百分之二十五。"+
	 	"\n"+
	 	"          第二十二条  劳动用工制度按照国家法律、法规及国务院劳动部门的有关规定执行。\n";
		Paragraph context82 = new Paragraph(context82String,font);
		// 正文格式左对齐
		context82.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context82.setSpacingBefore(10);
		doc.add(context82);
		
		String context91String = "第九章	公司解散事由与清算办法";
		Paragraph context91 = new Paragraph(context91String,font);
	 	// 正文格式左对齐
	 	context91.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context91.setSpacingBefore(10);
	 	doc.add(context91);
	 	
	 	String yyqx="";
	    if("长期".equals(opfyears)){
	    	yyqx="长期";    	
	    }else{
	    	yyqx=opfyears+" 年";
	    }
	 	String context92String = "          第二十三条  公司的营业期限为"+yyqx+"，从《企业法人营业执照》签发之日起计算。"+
	 	"\n"+
	 	"          第二十四条  公司因下列原因解散：\n"+
	 	"          （一）公司章程规定的营业期限届满；\n"+
	 	"          （二）股东决定解散；\n"+
	 	"          （三）公司合并或分立需要解散；\n"+
	 	"          （四）依法被吊销营业执照、责令关闭或者被撤销。"+
	 	"\n"+
	 	"          第二十五条  公司解散时，应依《公司法》的规定由股东对公司进行清算。清算结束后，应当制作清算报告，并报送公司登记机关，申请注销公司登记，公告公司终止。";
		Paragraph context92 = new Paragraph(context92String,font);
		// 正文格式左对齐
		context92.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context92.setSpacingBefore(10);
		doc.add(context92);
		
		String context101String = "第十章  附    则";
		Paragraph context101 = new Paragraph(context101String,font);
	 	// 正文格式左对齐
	 	context101.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context101.setSpacingBefore(10);
	 	doc.add(context101);
	 	
	 	String context102String = "          第二十六条  公司章程经股东签字后生效。涉及章程修改的，经股东同意后，由法定代表人签字生效。"+
	 	"\n"+
	 	"          第二十七条  公司章程由股东负责解释，涉及公司登记事项的以公司登记机关登记为准。"+
	 	"\n"+
	 	"          第二十八条  本章程一式贰份，并报公司登记机关备案一份。"+
	 	"\n\n\n\n"+
	 	"          股东签字:"+
	 	"\n\n\n\n\n\n"+
	 	"                                                                                                                                                  "+createDate;
		Paragraph context102 = new Paragraph(context102String,font);
		// 正文格式左对齐
		context102.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context102.setSpacingBefore(10);
		doc.add(context102);
		
		
		doc.close();
    }
    
    /**
     * 2人以上自然人投资公司章程
     * @param openo
     * @throws DocumentException
     * @throws IOException
     * @throws ParseException 
     */
    public static void createGszcPdfByData(String fileName,String path,Map dataMap) throws DocumentException, IOException, ParseException {  
		//设置PDF输出路径
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

    	//ParameterSet pset = SysUtilities.changeRequestToParameterSet(request);
		Date date = new Date();
		 //转换日期格式
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    String createDate = formatter.format(date);
		Map<String, String> jbxxMap = (Map<String, String>) dataMap.get("jbxxMap");
		String entname =(String)jbxxMap.get("entname");
		String dom =(String)jbxxMap.get("dom");
		String busscope =(String)jbxxMap.get("busscope");
		String regcap =(String)jbxxMap.get("regcap");
		String opfyears =(String)jbxxMap.get("opfyears");
    	Rectangle rect = new Rectangle(PageSize.A4);  
        Document doc = new Document(rect, 50.0F, 50.0F, 50.0F, 50.0F); 
    	PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(filePath));
    	doc.open();
    		
    	// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// 标题字体风格
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "有限公司\n章              程";
		Paragraph title = new Paragraph(contextString, titleFont);
		// 设置标题格式对齐方式
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// 正文字体风格
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context11String ="第一章    宗  旨";
		Paragraph context11 = new Paragraph(context11String,font);
	 	// 正文格式左对齐
	 	context11.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context11.setSpacingBefore(20);
	 	doc.add(context11);
	 	
		String context12String = "          第一条  为了适应社会主义市场经济的发展和建立现代企业制度的需要，规范公司的组织行为，保护公司、股东及职工的合法权益，经过股东充分酝酿，并根据《公司法》，制定本章程，公司以为社会提供服务，为国家创造财富，为股东创造最好的经济效益为宗旨，公司依法经营、照章纳税。";
		Paragraph context12 = new Paragraph(context12String,font);
	 	// 正文格式左对齐
	 	context12.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context12.setSpacingBefore(10);
	 	doc.add(context12);
	 	
		String context21String = "第二章      公司名称和住所";
		Paragraph context21 = new Paragraph(context21String,font);
	 	// 正文格式左对齐
	 	context21.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context21.setSpacingBefore(10);
	 	doc.add(context21);
	 	
		String context22String = "          第二条    公司名称："+entname+
		"\n"+
		"           第三条    公司住所："+dom;
		Paragraph context22 = new Paragraph(context22String,font);
		// 正文格式左对齐
		context22.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context22.setSpacingBefore(10);
		doc.add(context22);
	 	
		String context31String = "第三章	    公司经营范围";
		Paragraph context31 = new Paragraph(context31String,font);
	 	// 正文格式左对齐
	 	context31.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context31.setSpacingBefore(10);
	 	doc.add(context31);
	 	
	 	String context32String = "          第四条    公司经营范围："+busscope;
		Paragraph context32 = new Paragraph(context32String,font);
		// 正文格式左对齐
		context32.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context32.setSpacingBefore(10);
		doc.add(context32);
	 	
		String context41String = "第四章    公司注册资本、股东姓名或名称、出资方式、\n出资额及出资时间";
		Paragraph context41 = new Paragraph(context41String,font);
	 	// 正文格式左对齐
	 	context41.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context41.setSpacingBefore(10);
	 	doc.add(context41);
	 	
		String context42String = "          第五条  公司注册资本 "+regcap+" 人民币。"+
			 	"\n"+
			 	"           第六条  股东姓名或名称、出资额、出资方式及出资比例如下：\n";
	 	List czxxList = (List) dataMap.get("czxxList");
		String inv ="";
		String condate ="";
		float subconam = (float) 0.00;
		float subconprop = (float) 0.00;
		for(int i=0;i<czxxList.size();i++){
			 QYDJ_CZXX_SQ czxx = (QYDJ_CZXX_SQ) czxxList.get(i);
             inv =czxx.getINV();
             condate =  czxx.getCONDATE();
             if(!"".equals(condate)){
             Date dat= sdf.parse(condate);
             condate=formatter.format(dat);
             }
             subconam =  czxx.getSUBCONAM();
             subconprop =  czxx.getSUBCONPROP();
             context42String+="                             "+inv+" 以货币认缴出资 "+subconam+" 万元人民币，占总资本的 "+subconprop+"%；\n"+
            		 "                             股东认缴的出资于 "+condate+" 前全部缴清。\n";
		}
		 context42String+="\n"+
	 	"           第七条  公司成立后向股东签发出资证明书。股东出资证明一式两联，一联交该股东，一联留公司备案。\n"+
	 	"          出资证明书应当载明下列事项：\n"+
	 	"          （一）公司名称；\n"+
	 	"          （二）公司成立日期；\n"+
	 	"          （三）公司注册资本；\n"+
	 	"          （四）股东的姓名或者名称、缴纳的出资额和出资日期；\n"+
	 	"          （五）出资证明书的编号和核发日期。";
		Paragraph context42 = new Paragraph(context42String,font);
		// 正文格式左对齐
		context42.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context42.setSpacingBefore(10);
		doc.add(context42);
		
		String context51String = "第五章   公司的股权转让";
		Paragraph context51 = new Paragraph(context51String,font);
	 	// 正文格式左对齐
	 	context51.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context51.setSpacingBefore(10);
	 	doc.add(context51);
	 	
	 	String context52String = "          第八条  公司的股东之间可以相互转让其全部或者部分股权。"+
	 	"\n"+ 
	 	"           第九条  股东向股东以外的人转让股权,须经其他股东过半数同意。股东应就其股权转让事项书面通知其他股东征求同意，其他股东自接到书面通知之日起满三十日未答复的，视为同意转让。其他股东半数以上不同意转让的，不同意的股东应当购买该转让的股权；不购买的，视为同意转让。经股东同意转让的股权，在同等条件下，其他股东有优先购买权。两个以上股东主张行使优先购买权的，协商确定各自的购买比例；协商不成的，按照转让时各自的出资比例行使优先购买权。"+
	 	"\n"+
	 	"          第十条  自然人股东死亡后，其合法继承人继承股东资格。"+
	 	"\n"+
	 	"          第十一条  股东依法转让股权后，由公司将受让人的姓名或名称、住址以及受让的出资额记载于股东名册。";
	 	Paragraph context52 = new Paragraph(context52String,font);
		// 正文格式左对齐
		context52.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context52.setSpacingBefore(10);
		doc.add(context52);
		
		String context61String = "第六章  公司的机构及其产生办法、职权、议事规则";
		Paragraph context61 = new Paragraph(context61String,font);
	 	// 正文格式左对齐
	 	context61.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context61.setSpacingBefore(10);
	 	doc.add(context61);
	 	
	 	String context62String = "          第十二条  公司股东会由全体股东组成。股东会是公司的权利机构，依照《公司法》行使职权。"+
        "\n"+
	 	"          第十三条  股东会行使下列职权：\n"+
	 	"          （一）决定公司的经营方针和投资计划；\n"+
	 	"          （二）选举和更换执行董事，决定有关执行董事的报酬事项；\n"+
	 	"          （三）选举和更换非由职工代表出任的监事，决定有关监事的报酬事项；\n"+
	 	"          （四）审议批准执行董事的报告；\n"+
	 	"          （五）审议批准监事的报告；\n"+
	 	"          （六）审议批准公司的年度财务预算方案、决算方案；	\n"+
	 	"          （七）审议批准公司的利润分配方案和弥补亏损的方案；\n"+
	 	"          （八）对公司增加或者减少注册资本作出决议；\n"+
	 	"          （九）对公司合并、分立、解散、清算或者变更公司形式作出决议；\n"+
	 	"          （十）修改公司章程。\n"+
	 	"           对前款所列事项股东以书面形式一致表示同意的，可以不召开股东会会议，直接作出决定，并由全体股东在决定文件上签名、盖章。"+
	 	"\n"+
	 	"          第十四条  首次股东会会议由出资最多的股东召集和主持，依照《公司法》规定行使职权。"+
	 	"\n"+
	 	"          第十五条  股东会会议分为定期会议和临时会议。\n"+
	 	"定期会议自首次股东会议召开之日起每6个月召开一次。代表十分之一以上表决权的股东、执行董事、监事提议召开临时会议的，应当召开临时会议。"+
	 	"\n"+
	 	"          第十六条  股东会会议由执行董事召集和主持。\n"+
	 	"执行董事不能履行或者不履行召集股东会会议职责的，由监事召集和主持；监事不召集和主持的，代表十分之一以上表决权的股东可以自行召集和主持。"+
	 	"\n"+
	 	"          第十七条  召开股东会会议，应当于会议召开十五日前通知全体股东。\n"+
	 	" 股东会应当对所议事项的决定作出会议记录，出席会议的股东应当在会议记录上签名。"+
	 	"\n"+
	 	"          第十八条  股东会会议由股东按照出资比例行使表决权。每   万元人民币为一个表决权。"+
	 	"\n"+
	 	"          第十九条  股东会会议应对所议事项作出决议，决议应由代表二分之一      以上表决权的股东表决通过，但是股东会会议作出修改公司章程、增加或者减少注册资本的决议，以及公司合并、分立、解散或者变更公司形式的决议，必须经代表三分之二以上表决权的股东通过。公司章程另有规定的从其规定。  "+
	 	"\n"+
	 	"          第二十条  公司设执行董事，由股东会选举产生。该项决议须经股东会代表三分之二以上表决权的股东通过。\n"+
	 	"          执行董事任期为三年，任期届满，可连选连任。执行董事在任期内，股东会不得无故解除其职务。\n"+
	 	"          执行董事对股东会负责，行使下列职权：\n"+
	 	"          （一）召集股东会会议，并向股东会报告工作；\n"+
	 	"          （二）执行股东会的决议；\n"+
	 	"          （三）决定公司的经营计划和投资方案； \n"+
	 	"          （四）制订公司的年度财务预算方案、决算方案； \n"+
	 	"          （五）制订公司的利润分配方案和弥补亏损方案；\n"+
	 	"          （六）制订公司增加或者减少注册资本的方案；\n"+
	 	"          （七）制订公司合并、分立、解散或者变更公司形式的方案；\n"+
	 	"          （八）决定公司内部管理机构的设置；	\n"+
	 	"          （九）决定聘任或者解聘公司经理及其报酬事项，并根据经理的提名决定聘任或者解聘公司副经理、财务负责人及其报酬事项；\n"+
	 	"          （十）制定公司的基本管理制度。\n"+
	 	"          （十一）公司章程规定的其他职权。"+
	 	"\n"+
	 	"          第二十一条  公司设经理1人，由执行董事聘任或者解聘。\n"+
	 	"          经理行使下列职权：\n"+
	 	"          （一）主持公司的生产经营管理工作，组织实施执行董事决议；\n"+
	 	"          （二）组织实施公司年度经营计划和投资方案；\n"+
	 	"          （三）拟订公司内部管理机构设置方案；\n"+
	 	"          （四）拟订公司的基本管理制度；\n"+
	 	"          （五）制定公司的具体规章；\n"+
	 	"          （六）提请聘任或者解聘公司副经理、财务负责人；\n"+
	 	"          （七）聘任或者解聘除应由执行董事聘任或者解聘以外的负责管理人员；"+
	 	"\n"+
	 	"          第二十二条  公司设监事1人，由股东会选举产生。监事任期每届三年，任期届满，连选可以连任。公司执行董事、高级管理人员不得兼任监事。"+
	 	"\n"+
	 	"          第二十三条  监事行使下列职权：\n"+
	 	"          （一）检查公司财务；\n"+
	 	"          （二）对执行董事、高级管理人员执行公司职务的行为进行监督，对违反法律、行政法规、公司章程或者股东会决议的执行董事、高级管理人员提出罢免的建议； \n"+
	 	"          （三）当执行董事、高级管理人员的行为损害公司的利益时，要求执行董事、高级管理人员予以纠正； \n"+
	 	"          （四）提议召开临时股东会会议，在执行董事不履行《公司法》规定的召集和主持股东会会议职责时召集和主持股东会会议；\n"+
	 	"          （五）向股东会会议提出提案； \n"+
	 	"          （六）依照《公司法》第一百五十二条的有关规定，对执行董事、高级管理人员提起诉讼；"+
	 	"\n"+
	 	"          第二十四条 执行董事、监事、高级管理人员应当遵守法律、行政法规以及公司章程，忠实履行职务，维护公司利益，不得利用在公司的地位和职权，为自己牟取私利。执行董事、监事、高级管理人员执行公司职务时违反法律、行政法规或者公司章程的规定，给公司造成损害的，应当承担赔偿责任。"
	 	;	 	
		Paragraph context62 = new Paragraph(context62String,font);
		// 正文格式左对齐
		context62.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context62.setSpacingBefore(10);
		doc.add(context62);
		
		String context71String = "第七章	公司法定代表人";
		Paragraph context71 = new Paragraph(context71String,font);
	 	// 正文格式左对齐
	 	context71.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context71.setSpacingBefore(10);
	 	doc.add(context71);
	 	
	 	String context72String = "          第二十五条  执行董事为公司的法定代表人。"+
	 	"\n"+
	 	"           第二十六条 公司法定代表人经公司登记机关依法核准登记，取得法定代表人资格。法定代表人的签字应当在公司登记机关备案。";
		Paragraph context72 = new Paragraph(context72String,font);
		// 正文格式左对齐
		context72.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context72.setSpacingBefore(10);
		doc.add(context72);
		
		String context81String = "第八章  公司财务、会计、利润分配及劳动用工制度";
		Paragraph context81 = new Paragraph(context81String,font);
	 	// 正文格式左对齐
	 	context81.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context81.setSpacingBefore(10);
	 	doc.add(context81);
	 	
	 	String context82String = "          第二十七条  公司应当依照法律、行政法规和国务院财政部门的规定建立本公司的财务、会计制度。"+
	 	"\n"+
	 	"          第二十八条  公司应当在每一年度终了时编制财务会计报告，并依法经会计师事务所审计，于第二年三月一日前将财务会计报告送交各股东。"+
	 	"\n"+
	 	"          第二十九条  公司分配当年税后利润时，应当提取利润的百分之十列入公司法定公积金，公司法定公积金累积额为公司注册资本的百分之五十以上的，可不再提取。	\n"+
	 	"          公司的法定公积金不足以弥补以前年度亏损的，在依照前款规定提取法定公积金之前，应当先用当年利润弥补亏损。\n"+
	 	"          公司从税后利润中提取法定公积金后，经股东会决议，还可以从税后利润中提取任意公积金。\n"+
	 	"          公司弥补亏损和提取公积金后所余税后利润，公司按照股东的实缴的出资比例分配。"+
	 	"\n"+
	 	"          第三十条  公司的公积金用于弥补公司的亏损，扩大公司生产经营或者转为增加公司资本。\n"+
	 	"          法定公积金转为资本时，所留存的该项公积金不得少于转增前注册资本的百分之二十五。"+
	 	"\n"+
	 	"          第三十一条  劳动用工制度按照国家法律、法规及国务院劳动部门的有关规定执行。";
		Paragraph context82 = new Paragraph(context82String,font);
		// 正文格式左对齐
		context82.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context82.setSpacingBefore(10);
		doc.add(context82);
		
		String context91String = "第九章  公司的解散事由与清算办法";
		Paragraph context91 = new Paragraph(context91String,font);
	 	// 正文格式左对齐
	 	context91.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context91.setSpacingBefore(10);
	 	doc.add(context91);
	 	
	 	String yyqx="";
	    if("长期".equals(opfyears)){
	    	yyqx="长期。";    	
	    }else{
	    	yyqx=opfyears+" 年。";
	    }
	 	String context92String = "          第三十二条  公司营业期限 "+yyqx+
	 	"\n"+
	 	"           第三十三条  公司因下列原因解散：\n"+
	 	"          （一）	公司章程规定的营业期限届满；\n"+
	 	"          （二）股东会决议解散；\n"+
	 	"          （三）因公司合并或分立需要解散；\n"+
	 	"          （四）依法被吊销营业执照、责令关闭或者被撤销；\n"+
	 	"          （五）公司经营管理发生严重困难，继续存续会使股东利益受到重大损失，通过其他途径不能解决的，持有公司全部股东表决权百分之十以上的股东，可以请求人民法院解散公司。"+
	 	"\n"+
	 	"          第三十四条  公司解散时，应依据《公司法》的规定成立清算组对公司进行清算。清算结束后，清算组应当制作清算报告，报股东会或者有关部门确认。并报送公司登记机关申请注销登记，公告公司终止。";
		Paragraph context92 = new Paragraph(context92String,font);
		// 正文格式左对齐
		context92.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context92.setSpacingBefore(10);
		doc.add(context92);
		
		String context101String = "第十章  股东认为需要规定的其他事项";
		Paragraph context101 = new Paragraph(context101String,font);
	 	// 正文格式左对齐
	 	context101.setAlignment(Element.ALIGN_CENTER);
	 	// 离上一段落（标题）空的行数
	 	context101.setSpacingBefore(10);
	 	doc.add(context101);
	 	
	 	String context102String = "          第三十五条  公司根据需要可修改公司章程，修改公司章程的决议必须经代表三分之二以上表决权的股东通过，公司章程修正案或修改后的公司章程应送登记机关备案；涉及变更登记事项的，同时应向公司登记机关申请变更登记。"+
	 	"\n"+
	 	"          第三十六条  公司章程的解释权属于股东会。"+
	 	"\n"+
	 	"          第三十七条  公司登记事项以公司登记机关核准的为准。"+
	 	"\n"+
	 	"          第三十八条  本章程经股东共同协商订立，自签定之日起生效。"+
	 	"\n"+
	 	"          第三十九条  本章程一式  份，公司存档一份，股东各持一份，并报公司登记机关备案一份。"+
	 	"\n\n\n\n"+
	 	"          全体股东签字："+
	 	"\n\n\n\n\n\n"+
	 	"                                                                                                                                                      "+createDate;
		Paragraph context102 = new Paragraph(context102String,font);
		// 正文格式左对齐
		context102.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context102.setSpacingBefore(10);
		doc.add(context102);
		
		
		doc.close();
    }
    
    /**
     * 承诺书
     * @param openo
     * @throws DocumentException
     * @throws IOException
     */
    public static void createCnsPdfByData(String fileName,String path) throws DocumentException, IOException {  
		//设置PDF输出路径
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

		Date date = new Date();
		 //转换日期格式
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
	    String createDate = formatter.format(date);
    	Rectangle rect = new Rectangle(PageSize.A4);  
        Document doc = new Document(rect, 50.0F, 50.0F, 50.0F, 50.0F); 
    	PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(filePath));
    	doc.open();
    		
    	// 设置中文字体
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// 标题字体风格
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "承   诺   书";
		Paragraph title = new Paragraph(contextString, titleFont);
		// 设置标题格式对齐方式
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// 正文字体风格
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context1String = "一、本(拟成立)公司及全体股东承诺对所向高新区市场监督管理局提供的所有申请登记注册材料（包括但不限于股东、董事、董事长或执行董事的签字，无论从形式上还是实质内容上）不含虚假成分，并对其真实性、有效性、合法性负责，包括愿为此承担相应法律责任。";
		Paragraph context1 = new Paragraph(context1String,font);
	 	// 正文格式左对齐
	 	context1.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context1.setSpacingBefore(15);
	    // 设置第一行空的列数
		context1.setFirstLineIndent(20);
	 	doc.add(context1);
		
		String context2String = "二、本公司董事、监事、经理的任职是按照《公司法》等法律法规政策和《公司章程》的规定依法产生的，并经股东在全流程网上登记系统自动生成的《公司登记（备案）申请书》，并依据《电子签名法》进行电子签名确认，公司董事、监事、经理及提供的其他人员身份信息真实、有效合法。";
		Paragraph context2 = new Paragraph(context2String,font);
	 	// 正文格式左对齐
	 	context2.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context2.setSpacingBefore(10);
	    // 设置第一行空的列数
		context2.setFirstLineIndent(20);
	 	doc.add(context2);
	 	
	 	String context3String = " 三、本公司全体人员保证遵守国家计划生育有关政策规定，如有违犯国家计划生育政策和规定的情况，由此产生的一切后果均由公司及责任人负责承担。";
		Paragraph context3 = new Paragraph(context3String,font);
	 	// 正文格式左对齐
	 	context3.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context3.setSpacingBefore(10);
	    // 设置第一行空的列数
		context3.setFirstLineIndent(20);
	 	doc.add(context3);
	 	
        String context4String = "四、自然人股东不是国家公务员及法律法规和政策规定不允许参与经营（或限制权利）的其他人员。";
        Paragraph context4 = new Paragraph(context4String,font);
	 	// 正文格式左对齐
	 	context4.setAlignment(Element.ALIGN_LEFT);
	 	// 离上一段落（标题）空的行数
	 	context4.setSpacingBefore(10);
	    // 设置第一行空的列数
		context4.setFirstLineIndent(20);
	 	doc.add(context4);    
	 	
	   String context5String = "五、本公司法定代表人、董事、监事、经理符合有关法律、法规规定的任职资格，不存在以下情况：\n"+
	   "        1、	无民事行为能力或者限制民事行为能力的；\n"+
	   "        2、	正在被执行刑罚或者正在被执行刑事强制措施的；\n"+
	   "        3、	正在被公安机关或者国家安全机关通缉的；\n"+
	   "        4、	因犯有贪污贿赂罪、侵犯财产罪或者破坏社会主义市场经济秩序罪，被判处刑罚，执行期满未逾五年的；因犯有其他罪，被判处刑罚，执行期满未逾三年的；或者因犯罪被判处剥夺政治权利，执行期满未逾五年的；\n"+
	   "        5、	担任因经营不善破产清算的企业的法定代表人或者董事、经理，并对该企业的破产负有个人责任，自该企业破产清算完结之日起未逾三年的；\n"+
	   "        6、	担任因违法被吊销营业执照的企业的法定代表人，并对该企业违法行为负有个人责任，自该企业被吊销营业执照之日起未逾三年的；\n"+
	   "        7、	个人负债数额较大，到期未清偿的；\n"+
	   "        8、	法律、法规规章、政策规定的其它不能担任企业法定代表人、董事、监事、经理的。";
	   Paragraph context5 = new Paragraph(context5String,font);
		// 正文格式左对齐
	   context5.setAlignment(Element.ALIGN_LEFT);
	// 离上一段落（标题）空的行数
	   context5.setSpacingBefore(10);
		    // 设置第一行空的列数
	   context5.setFirstLineIndent(20);
	   doc.add(context5);    
		 	
	   String context6String = "六、公司为自然人独资的一人有限公司的，经股东电子签名确认：本人承诺只办理本公司一个一人有限公司，不再出资办理其他一人有限公司。本人出资设立的该一人有限公司不再出资办理其他一人有限公司。本人保证以上内容真实性并对其负责。";
	   Paragraph context6 = new Paragraph(context6String,font);
		// 正文格式左对齐
		context6.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context6.setSpacingBefore(10);
		 // 设置第一行空的列数
		context6.setFirstLineIndent(20);
		doc.add(context6);    
	 	
		String context7String = "七、股东郑重承诺：工商部门已告知相关审批事项和审批部门。在领取营业执照后，我（本企业/农民专业合作社/个体工商户）将按照规定及时到相关审批部门办理审批（许可、备案）手续，在未取得相关行政审批（许可、备案）前不从事相关（应经许可备案的）经营活动。如有超出登记经营范围从事后置审批事项经营的需要，也将先行办理经营范围变更登记和相应审批手续，未取得相关审批前不从事相关经营活动。\n"+
        "        本承诺书经股东电子签名后生效。"+
		"\n\n\n\n\n"+
        "                                                                                                                                                    "+createDate;
		Paragraph context7 = new Paragraph(context7String,font);
		// 正文格式左对齐
		context7.setAlignment(Element.ALIGN_LEFT);
		// 离上一段落（标题）空的行数
		context7.setSpacingBefore(10);
		 // 设置第一行空的列数
		context7.setFirstLineIndent(20);
		doc.add(context7);    

        doc.close();        
    }
    
    /**
     * 公司基本信息/出资人信息
     * @param openo
     * @return
     * @throws DocumentException
     * @throws IOException
     * @throws ParseException
     */
    public String getPdfUrlAndCreatePdf(String openo) throws DocumentException, IOException, ParseException{
		QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
		QYDJ_CZXX_SQ czxx = new QYDJ_CZXX_SQ();
		List<QYDJ_CZXX_SQ> czxxs = new ArrayList<QYDJ_CZXX_SQ>();
		try {
			jbxx.setOPENO(openo);
			jbxx.doSelect();
		    czxxs = czxx.getList(" WHERE OPENO='"+openo+"'");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		Map<String, String> jbxxMap = new HashMap<String, String>();
		//企业名称
		jbxxMap.put("entname", jbxx.getENTNAME());
		jbxxMap.put("regno", jbxx.getNAMEAPPNO());
	
		//设置住所
		StringBuilder dom = new StringBuilder();
		dom.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROVINCE().length()==6?jbxx.getPROVINCE():jbxx.getPROVINCE()+"00", "1")).append("  省（市/自治区）  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCITY(),"1")).append("  市（地区/盟/自治州）  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCOUNTY(),"1")).append("  县（自治县/旗/自治旗/市/区）  ");
		dom.append(jbxx.getTOWN()).append("  乡（民族乡/镇/街道）  ");
		dom.append(jbxx.getVILLAGE()).append("  村（路/社区）  ");
		dom.append(jbxx.getHOUSENUMBER()).append("  号");
		jbxxMap.put("dom", dom.toString());
		//设置经营范围
		jbxxMap.put("busscope", jbxx.getBUSSCOPE());
        //注册资本
		jbxxMap.put("regcap", jbxx.getREGCAP() + "万元");

		//设置营业期限
		String opfyears;
		String yyqx=(String)jbxx.doPreProcess(jbxx.getOPDATETO());
		jbxxMap.put("opfyears", yyqx);
		map.put("jbxxMap", jbxxMap);		
		//设置股东信息	
		map.put("czxxList", czxxs);
		
		//设置保存路径
		String enttype = jbxx.getENTTYPE();
		String opetype = getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "2");
		
		String sqsPath = PropertiesConfigUtil.getValue("SQS_PATH")+ "/" + opetype + "/";
		String fileName = "gszc_"+openo + ".pdf";
	
		if("1151".equals(enttype)){
			createDzGszcPdfByData(fileName, sqsPath, map);
		}else{
			createGszcPdfByData(fileName, sqsPath, map);
		}
		return sqsPath+fileName;
    }
	
    
    /**
     * 承诺书信息
     * @param openo
     * @return
     * @throws IOException 
     * @throws DocumentException 
     */
    public String getCnsPdfUrlAndCreatePdf(String openo) throws DocumentException, IOException{
    	QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
		try {
			jbxx.setOPENO(openo);
			jbxx.doSelect();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        String opetype = getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "2");	
		String sqsPath = PropertiesConfigUtil.getValue("SQS_PATH")+ "/" + opetype + "/";
		String fileName = "cns_"+openo + ".pdf";
		createCnsPdfByData(fileName, sqsPath);
		return sqsPath+fileName;
    }
    
    
	/**
	 * 根据type和code获取dmdz表中的content或者remark
	 * @param type
	 * @param code
	 * @param flag 1:content 2:remark
	 * @return
	 */
	public static String getDmdzByTypeAndCode(String type,String code,String flag){
		String remark = "";
		SYS_DMDZ dmdz = new SYS_DMDZ();
		dmdz.setTYPE(type);
		dmdz.setCODE(code);
		try {
			dmdz.doSelect();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if("1".equals(flag)){
			remark = dmdz.getCONTENT();
		}else if("2".equals(flag)){
			remark = dmdz.getREMARK();
		}
		return remark;
	}
	
	
	public static void main(String[] args) {
		PDFGszcCreator creator = new PDFGszcCreator();
//		try {
//			try {
//				System.out.println(creator.getPdfUrlAndCreatePdf("37020021701160001"));
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		} catch (DocumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		try {
			System.out.println(creator.getCnsPdfUrlAndCreatePdf("37020021701160001"));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

