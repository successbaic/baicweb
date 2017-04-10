package com.macrosoft.icms.util;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;
import com.macrosoft.icms.qydj.GTDJ_JBXX_SQ;
import com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ;
import com.macrosoft.icms.qydj.QYDJ_CZXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_JBXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_RYXX_SQ;
import com.macrosoft.icms.qydj.QYDJ_SQWT_SQ;
import com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ;
import com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ;
import com.macrosoft.icms.qydj.QYDJ_YWSB_SQ;

public class PDFCreator {

	private static Logger logger = Logger.getLogger(PDFCreator.class);
	
	
	public static void createPdfByData(String fileName,String path,Map dataMap){
		Document document = new Document(PageSize.A4.rotate(), 50, 50, 50, 50);  
		String opetype = (String)dataMap.get("opetype");
		  
        try {  
        	//设置PDF输出路径
            File file = new File(path);  
            if (!file.exists()) {  
                file.mkdirs();  
            }  
            PdfWriter.getInstance(document, new FileOutputStream(path + fileName));  
  
            //开始编辑PDF内容
            document.open();  

            //设置中文字体编码格式
            BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);  
            Font titleChinese = new Font(bfChinese, 30, Font.BOLD);
            //设置table内的文本样式
            Font contentFont = new Font(bfChinese, 16, Font.NORMAL);
          //设置table内的标题样式
            Font tblTitleFont = new Font(bfChinese, 16, Font.BOLD);
            //设置该PDF的标题
            Paragraph title = new Paragraph((String)dataMap.get("title"),titleChinese);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);
            
            Paragraph attionTitle = new Paragraph("注：请仔细阅读本申请书《填写说明》，按要求填写。",contentFont);
            attionTitle.setAlignment(Paragraph.ALIGN_CENTER);
            
            if("GT".equals(opetype)){
            	Map<String, String> gtMap = (Map<String, String>)dataMap.get("gtMap");
            	Table gtxxtable = new Table(5); 
                int gtxxwidths[] = {30,15,20,15,20};  
                gtxxtable.setWidths(gtxxwidths);  
                gtxxtable.setWidth(100);  
                gtxxtable.setPadding(3);  
                gtxxtable.setBorderWidth(1);
                gtxxtable.setAlignment(Cell.ALIGN_CENTER);
                
                Cell cell = new Cell(new Phrase("名 称",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("traname"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell =  new Cell(new Phrase("经营者",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setRowspan(7);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("姓名",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("name"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("性别",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("sex"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("身份证号码",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("cerno"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("住所",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("dom"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("邮政编码",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("postalcode"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("联系电话",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("tel"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("电子邮箱",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("email"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("政治面貌",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("polstand"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("民族",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("nation"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("文化程度",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("litedeg"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("职业状况",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("occstbeapp"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("组成形式",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setRowspan(2);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("grjy"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("jtjy"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("参加经营的家庭成员姓名及身份证号码",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("fammember"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(2);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("经营范围",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("busscoandform"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("经营场所",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("oploc"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("从业人员",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("empnum"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("资金数额",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("capam"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(2);
                gtxxtable.addCell(cell);
                
                Paragraph p1 = new Paragraph("\n    本人依照《个体工商户条例》申请登记为个体工商户，提交文件材料真实有效。谨对真实性承担责任。",contentFont);
                Paragraph p2 = new Paragraph("经营者签名： ",contentFont);
                p2.setIndentationLeft(500);
                Paragraph p3 = new Paragraph("年          月              日 ",contentFont);
                p3.setIndentationLeft(500);
                cell = new Cell();
                cell.add(p1);
                cell.add(p2);
                cell.add(p3);
                cell.setColspan(5);
                gtxxtable.addCell(cell);
                
                document.add(gtxxtable);
                
                Paragraph wtitle = new Paragraph("\n委托代理人证明",titleChinese);
                wtitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(wtitle);
                
                Map<String, String> wtrMap = (Map<String, String>)dataMap.get("wtrMap");
                Paragraph wtr = new Paragraph("\n委托人姓名 :" + (wtrMap==null?"":wtrMap.get("sqr")),contentFont);
                document.add(wtr);
                wtr = new Paragraph("委托代理人姓名 ：" + (wtrMap==null?"":wtrMap.get("wtr")),contentFont);
                document.add(wtr);
                wtr = new Paragraph("委托代理权限：  \n",contentFont);
                document.add(wtr);
                wtr = new Paragraph("1. " + (wtrMap==null?"同意□ 不同意□":wtrMap.get("qx1")) +  " 核对登记材料中的复印件并签署核对意见； ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("2. " + (wtrMap==null?"同意□ 不同意□":wtrMap.get("qx2")) +  " 修改有关表格的填写错误； ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("3. " + (wtrMap==null?"同意□ 不同意□":wtrMap.get("qx3")) +  " 领取各类通知书； ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("4. " + (wtrMap==null?"同意□ 不同意□":wtrMap.get("qx4")) +  " 领取个体工商户营业执照。 ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                
                wtr = new Paragraph("\n委托有效期限：自   " + (wtrMap==null?"":wtrMap.get("confrom")) + "  至       " + (wtrMap==null?"":wtrMap.get("conto")) + "\n",contentFont);
                document.add(wtr);
                
                Table t = new Table(4);
                int twidths[] = {20,30,20,30};  
                t.setWidths(twidths);  
                t.setWidth(100);  
                t.setPadding(3);  
                t.setBorderWidth(1);
                t.setAlignment(Cell.ALIGN_CENTER);
                
                Cell tCell = new Cell(new Phrase("委托代理人住所",contentFont));
                tCell.setColspan(2);
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("unit"),contentFont));
                tCell.setColspan(2);
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase("邮政编码",contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("postalcode"),contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase("联系电话",contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("tel"),contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                document.add(t);
                
                Paragraph pp = new Paragraph("\n委托人签名：",contentFont);
                document.add(pp);
                pp = new Paragraph("年            月                   日                                      ",contentFont);
                pp.setAlignment(Paragraph.ALIGN_RIGHT);
                document.add(pp);
                
            }else{
            	//设置基本信息（基本信息、设立、变更、备案、申请人声明）
                //基本信息和设立
            	Table jbxxtable = new Table(4); 
                int jbxxwidths[] = {20,30,20,30};  
                jbxxtable.setWidths(jbxxwidths);  
                jbxxtable.setWidth(100);  
                jbxxtable.setPadding(3);  
                jbxxtable.setBorderWidth(1);
                jbxxtable.setAlignment(Cell.ALIGN_CENTER);
                
                //基本信息
                Cell jbxxTitle = new Cell(new Phrase("√基本信息",tblTitleFont));
                jbxxTitle.setColspan(4);
                jbxxTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTitle);
                
                Map<String, String> jbxxMap = (Map<String, String>)dataMap.get("jbxxMap");
                
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"HHQY".equals(opetype)||"GRDZ".equals(opetype)||"WZGS".equals(opetype)||"WZHH".equals(opetype)||"HZS".equals(opetype)||"HZSFZ".equals(opetype)){
                	 Cell jbxxName = new Cell(new Phrase("名 称",contentFont));
                     jbxxName.setHorizontalAlignment(Element.ALIGN_CENTER);
                     jbxxtable.addCell(jbxxName);
                     
                     Cell jbxxNameValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                     jbxxNameValue.setColspan(3);
                     jbxxtable.addCell(jbxxNameValue);
                     
                     Cell jbxxRegno = new Cell(new Phrase("名称预先核准文号注册号/\n统一社会信用代码",contentFont));
                     jbxxRegno.setHorizontalAlignment(Element.ALIGN_CENTER);
                     jbxxtable.addCell(jbxxRegno);
                     if("WZGS".equals(opetype)){
                    	 Cell jbxxRegnoValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                    	 jbxxtable.addCell(jbxxRegnoValue);
                    	 Cell gbc = new Cell(new Phrase("国别（地区）",contentFont));
                    	 gbc.setHorizontalAlignment(Element.ALIGN_CENTER);
                         jbxxtable.addCell(gbc);
                         gbc = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                    	 gbc.setHorizontalAlignment(Element.ALIGN_CENTER);
                         jbxxtable.addCell(gbc);
                     }else{
                    	 Cell jbxxRegnoValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                         jbxxRegnoValue.setColspan(3);
                         jbxxtable.addCell(jbxxRegnoValue);
                     }
                }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	String lsdw = "公司名称";
                	if("NZYY".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                		lsdw = "隶属单位（企业）";
                	}
                	Cell cell = null;
                	if(!"HHFZ".equals(opetype)&&!"GRDZFZ".equals(opetype)){
                		cell = new Cell(new Phrase(lsdw,contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(cell);
                        cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("supentname"),contentFont));
                        jbxxtable.addCell(cell);
                        
                        cell = new Cell(new Phrase("注册号/统一社会信用代码",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(cell);
                        cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("supregno"),contentFont));
                        jbxxtable.addCell(cell);
                	}
                    
                    String fgsname = "分公司名称";
                    if("NZYY".equals(opetype)){
                    	fgsname = "营业单位名称";
                    }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	fgsname = "分支机构名称";
                    }
                    cell = new Cell(new Phrase(fgsname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(cell);
                    cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                    jbxxtable.addCell(cell);
                    
                    String regname = "分公司名称预先核准文号/注册号/统一社会信用代码";
                    if("NZYY".equals(opetype)){
                    	regname = "营业单位名称预先核准文号/注册号/统一社会信用代码";
                    }else if("NZYY".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)){
                    	regname = "分支机构名称预先核准文号/注册号/统一社会信用代码";
                    }
                    cell = new Cell(new Phrase(regname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(cell);
                    cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                    jbxxtable.addCell(cell);
                }
                if("WGJY".equals(opetype)){
                	Cell cell = new Cell(new Phrase("名 称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("名称预先核准文号注册号/统一社会信用代码",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("地 址（营业场所）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WGDB".equals(opetype)){
                	Cell cell = new Cell(new Phrase("代表机构名称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("登记证注册号/统一社会信用代码",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("驻在场所",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else{
                	String domname = "住所";
                    if("FGS".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	domname = "营业场所";
                    }else if("GRDZ".equals(opetype)){
                    	domname = "企业住所";
                    }else if("GRDZFZ".equals(opetype)||"HHFZ".equals(opetype)||"HZSFZ".equals(opetype)){
                    	domname = "经营场所";
                    }else if("WZHH".equals(opetype)||"HHQY".equals(opetype)){
                    	domname = "主要经营场所";
                    }
                    Cell jbxxDom = new Cell(new Phrase(domname,contentFont));
                    jbxxDom.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxDom);
                    
                    Cell jbxxDomValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                    jbxxDomValue.setColspan(3);
                    jbxxtable.addCell(jbxxDomValue);
                    
                    Cell jbxxOploc = new Cell(new Phrase("生产经营地",contentFont));
                    jbxxOploc.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOploc);
                    
                    Cell jbxxOplocValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("oploc"),contentFont));
                    jbxxOplocValue.setColspan(3);
                    jbxxtable.addCell(jbxxOplocValue);
                }
                
                Cell jbxxTel = new Cell(new Phrase("联系电话",contentFont));
                jbxxTel.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTel);
                
                Cell jbxxTelValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                jbxxTelValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTelValue);
                
                Cell jbxxEmail = new Cell(new Phrase("邮政编码",contentFont));
                jbxxEmail.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxEmail);
                
                Cell jbxxEmailValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("postalcode"),contentFont));
                jbxxEmailValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxEmailValue);
                
                //设立
                String slname = "√设立 ";
                if("NZFR".equals(opetype)||"NZYY".equals(opetype)||"WGJY".equals(opetype)){
                	slname = "√开业";
                }
                Cell slTitle = new Cell(new Phrase(slname,tblTitleFont));
                slTitle.setColspan(4);
                slTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(slTitle);
                
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"WZGS".equals(opetype)){
                	Cell jbxxLerep = new Cell(new Phrase("法定代表人姓名",contentFont));
                    jbxxLerep.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxLerep);
                    
                    Cell jbxxLerepValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    jbxxLerepValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxLerepValue);
                    
                    if("WZGS".equals(opetype)){
                    	Cell cell = new Cell(new Phrase("国别（地区）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("职务",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("position"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("投资总额（万元）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congro"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("币种",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congrocur"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("折美元（万元）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congrousd"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("注册资本（万元）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("公司类型",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("设立方式（股份公司填写）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("insform"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                    }else{
                    	Cell jbxxPosition = new Cell(new Phrase("职 务",contentFont));
                        jbxxPosition.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxPosition);
                        
                        Cell jbxxPositionValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("position"),contentFont));
                        jbxxPositionValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxPositionValue);
                        
                        String regcapname = "注册资本";
                        if("NZFR".equals(opetype)){
                        	regcapname = "注册资金";
                        }
                        Cell jbxxRegcap = new Cell(new Phrase(regcapname,contentFont));
                        jbxxRegcap.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxRegcap);
                        
                        Cell jbxxRegcapValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                        jbxxRegcapValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxRegcapValue);
                        
                        String enttypename = "公司类型";
                        if("NZFR".equals(opetype)){
                        	enttypename = "经济性质";
                        }
                        Cell jbxxEnttype = new Cell(new Phrase(enttypename,contentFont));
                        jbxxEnttype.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxEnttype);
                        
                        Cell jbxxEnttypeValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                        jbxxEnttypeValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxEnttypeValue);
                    }
                    
                    if("GS".equals(opetype)){
                    	Cell jbxxInsform = new Cell(new Phrase("设立方式\n（股份公司填写）",contentFont));
                        jbxxInsform.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxInsform);
                        
                        Cell jbxxInsformValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("insform"),contentFont));
                        jbxxInsformValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxInsformValue.setColspan(3);
                        jbxxtable.addCell(jbxxInsformValue);
                        
                        Cell jbxxBusscope = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                        jbxxBusscope.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxBusscope);
                        
                        Cell jbxxBusscopeValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                        jbxxBusscopeValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxBusscopeValue.setColspan(3);
                        jbxxtable.addCell(jbxxBusscopeValue);
                    }
                    
                    Cell jbxxOpfyears = new Cell(new Phrase("营业期限",contentFont));
                    jbxxOpfyears.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOpfyears);
                    
                    Cell jbxxOpfyearsValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("opfyears"),contentFont));
                    jbxxOpfyearsValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOpfyearsValue);
                    
                    Cell jbxxConum = new Cell(new Phrase("申请副本数量",contentFont));
                    jbxxConum.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxConum);
                    
                    Cell jbxxConumValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                    jbxxConumValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxConumValue);
                    
                    if("NZFR".equals(opetype)){
                    	Cell jbxxBusscope = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                        jbxxBusscope.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxBusscope);
                        
                        Cell jbxxBusscopeValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                        jbxxBusscopeValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxBusscopeValue.setColspan(3);
                        jbxxtable.addCell(jbxxBusscopeValue);
                    }
                }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)||"HZSFZ".equals(opetype)){
                	Cell cell = null;
                	if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)){
                		cell = new Cell(new Phrase("负责人姓名",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("负责人居所",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("houseadd"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("负责人身份证号",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("cerno"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("从业人数",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empno"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("联系电话",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("邮政编码",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("postalcode"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("经营期限（仅合伙企业填写）",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                	}else{
                		cell = new Cell(new Phrase("负责人",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    	jbxxtable.addCell(cell);
                    	if("NZYY".equals(opetype)){
                    		cell = new Cell(new Phrase("联系电话",contentFont));
                        	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase("资金数额",contentFont));
                        	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                        	jbxxtable.addCell(cell);
                    	}
                    	cell = new Cell(new Phrase("申请执照副本数量",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                    	jbxxtable.addCell(cell);
                	}
                	
                	String bussname = "经营范围";
                	if("FGS".equals(opetype)){
                		bussname = "分公司经营范围";
                	}else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                		bussname = "分支机构经营范围";
                	}
                	cell = new Cell(new Phrase(bussname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	
                	cell = new Cell(new Phrase("核算方式",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("calculationmethod"),contentFont));
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("HHQY".equals(opetype)){
                	Cell hhcell = new Cell(new Phrase("执行事务合伙人",contentFont));
                	hhcell.setRowspan(2);
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("姓名或名称",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(2);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("委派代表（仅限执行事务合伙人为法人或其他组织时填写）",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(2);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("合伙企业类型",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("hhlx"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("出资额（万元）",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("hhcze"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("营业期限",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(" 自_________年_______月_______日到_________年_______月_______日",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("合伙人数",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("parnum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("其中，有限合伙人数（仅限有限合伙填写）",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("exenum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("从业人数",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empnum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                }else if("GRDZ".equals(opetype)){
                	Cell cell = new Cell(new Phrase("出资额",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("从业人数",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empnum"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("出资方式",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("grczfs"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WZHH".equals(opetype)){
                	Cell cell = new Cell(new Phrase("执行事务合伙人或委派代表",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("国 别（地 区）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("认缴出资额（万元）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("实缴出资额（万元）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("reccap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("币种",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcapcur"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("企业类型",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("合伙期限",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("opfyears"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("申请执照副本数量",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                }else if("WGJY".equals(opetype)){
                	Cell cell = new Cell(new Phrase("企业类型",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("主管部门",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("depincha"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("审批机关",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("exaauth"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("批准日期",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandate"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("负责人",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("在中国境内经营范围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("资金数额（万元）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("币种",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcapcur"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("营业期限",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("承包工程或经营管理项目",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("itemofoporcpro"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("外国（地区）企业名称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("外国（地区）企业境外住所",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentadd"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("外国（地区）企业经营范围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WGDB".equals(opetype)){
                	Cell cell = new Cell(new Phrase("首席代表姓名",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("代表姓名",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("业务范围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("驻在期限",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("批准设立机关名称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regorg"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("批准驻在期限",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("批准日期",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandate"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("批准文号",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandocno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	
                	cell = new Cell(new Phrase("外国（地区）企业情况",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(4);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("中文名称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("外文名称",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentforname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("住 所",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentadd"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("存续期限",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("cxqx"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("有权签字人姓名",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentautsign"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("企业责任形式",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forenliafor"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("资本（资产）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("国别（地区）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("经营范围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("HZS".equals(opetype)){
                	Cell cell = new Cell(new Phrase("法定代表人",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("成员出资总额（元）",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	Paragraph p1 = new Paragraph("成员总数：    " + dataMap.get("cyzs") + "     （名）",contentFont);
                	Paragraph p2 = new Paragraph("其中：农民成员    " + dataMap.get("nmcy") + "     （名） 所占比例    " + dataMap.get("nmcyrate") +"   %",contentFont);
                	p2.setIndentationLeft(60);
                	Paragraph p3 = new Paragraph("企业、事业单位或社会团体成员：     " + dataMap.get("frcy") +"    （名） 所占比例     " + dataMap.get("frcyrate") + "   %",contentFont);
                	p3.setIndentationLeft(120);
                	
                	cell = new Cell();
                	cell.add(p1);
                	cell.add(p2);
                	cell.add(p3);
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(4);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("经\n营\n范\n围",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }
                
                document.add(jbxxtable);
                
                //变更、备案和申请人声明
                //设置TABLE格式
                Table remarktable = new Table(6); 
                int remarkwidths[] = { 15,10,20,15,20,20};  
                remarktable.setWidths(remarkwidths);  
                remarktable.setWidth(100);  
                remarktable.setPadding(3);  
                remarktable.setBorderWidth(1);
                remarktable.setAlignment(Cell.ALIGN_CENTER);
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"HHQY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZGS".equals(opetype)||"WZHH".equals(opetype)||"HZS".equals(opetype)){
                    Cell bgTitle = new Cell(new Phrase("□变更",tblTitleFont));
                    bgTitle.setColspan(6);
                    bgTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bgTitle);
                    
                    Cell bg1 = new Cell(new Phrase("变更项目",contentFont));
                    bg1.setColspan(2);
                    bg1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg1);
                    
                    Cell bg2 = new Cell(new Phrase("原登记内容",contentFont));
                    bg2.setColspan(2);
                    bg2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg2);
                    
                    Cell bg3 = new Cell(new Phrase("拟变更内容",contentFont));
                    bg3.setColspan(2);
                    bg3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg3);
                    
                    for(int i=0;i<5;i++){
                    	Cell bg11 = new Cell("用于支撑高度");
                        bg11.setColspan(2);
                        remarktable.addCell(bg11);
                        
                        Cell bg21 = new Cell(" ");
                        bg21.setColspan(2);
                        remarktable.addCell(bg21);
                        
                        Cell bg31 = new Cell(" ");
                        bg31.setColspan(2);
                        remarktable.addCell(bg31);
                    }
                    
                    if("GS".equals(opetype)||"HHQY".equals(opetype)||"GRDZ".equals(opetype)||"WZGS".equals(opetype)||"WZHH".equals(opetype)||"HZS".equals(opetype)){
                    	Cell baTitle = new Cell(new Phrase("□备案 ",tblTitleFont));
                        baTitle.setColspan(6);
                        baTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(baTitle);
                        
                        Cell fgsCell = new Cell(new Phrase("分公司\n□增设□注销",contentFont));
                        fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        fgsCell.setRowspan(2);
                        remarktable.addCell(fgsCell);
                        
                        Cell nameCell = new Cell(new Phrase("名称",contentFont));
                        nameCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(nameCell);
                        
                        Cell nameValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(nameValueCell);
                        
                        Cell regnoCell = new Cell(new Phrase("注册号/统一社会信用代码",contentFont));
                        regnoCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        regnoCell.setColspan(2);
                        remarktable.addCell(regnoCell);
                        
                        Cell regnoValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(regnoValueCell);
                        
                        Cell djjgCell = new Cell(new Phrase("登记机关",contentFont));
                        djjgCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(djjgCell);
                        
                        Cell djjgValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(djjgValueCell);
                        
                        Cell djrqCell = new Cell(new Phrase("登记日期",contentFont));
                        djrqCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        djrqCell.setColspan(2);
                        remarktable.addCell(djrqCell);
                        
                        Cell djrqValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(djrqValueCell);
                        
                        if("GRDZ".equals(opetype)){
                        	Cell qtc = new Cell(new Phrase("其他",contentFont));
                        	qtc.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	remarktable.addCell(qtc);
                        	qtc = new Cell(new Phrase("□财务负责人   □联络员  ",contentFont));
                        	qtc.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	qtc.setColspan(5);
                        	remarktable.addCell(qtc);
                        }else{
                        	Cell qszCell = new Cell(new Phrase("清算组",contentFont));
                            qszCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qszCell.setRowspan(2);
                            remarktable.addCell(qszCell);
                            
                            Cell cyCell = new Cell(new Phrase("成员",contentFont));
                            cyCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(cyCell);
                            
                            Cell cyValueCell = new Cell(new Phrase("",contentFont));
                            cyValueCell.setColspan(4);
                            remarktable.addCell(cyValueCell);
                            
                            Cell fzrCell = new Cell(new Phrase("负责人",contentFont));
                            fzrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(fzrCell);
                            
                            Cell fzrValueCell = new Cell(new Phrase("",contentFont));
                            remarktable.addCell(fzrValueCell);
                            
                            Cell lxdhCell = new Cell(new Phrase("联系电话",contentFont));
                            lxdhCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            lxdhCell.setColspan(2);
                            remarktable.addCell(lxdhCell);
                            
                            Cell lxdhValueCell = new Cell(new Phrase("",contentFont));
                            remarktable.addCell(lxdhValueCell);
                        }
                        
                        if("GS".equals(opetype)||"WZGS".equals(opetype)){
                        	Cell qtCell = new Cell(new Phrase("其他",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	Cell qtValueCell = new Cell(new Phrase("□董事   □监事   □经理   □章程   □章程修正案   □财务负责人   □联络员  ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                        }else if("HHQY".equals(opetype)){
                        	Cell qtCell = new Cell(new Phrase("合伙协议",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	Cell qtValueCell = new Cell(new Phrase("□初次备案     □涉及变更事项备案   ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                            qtCell = new Cell(new Phrase("其他",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	qtValueCell = new Cell(new Phrase("□联络员     □财务负责人    ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                        }
                        
                    }else if("NZFR".equals(opetype)){
                    	Cell nzfrCell = new Cell(new Phrase("分支机构",contentFont));
                    	nzfrCell.setRowspan(2);
                    	nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("名称",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("性质",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("登记机关",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("登记类型",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("  ",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("□法人  □非法人",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("登记机关",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("□增设  □撤销",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("□备案 ",tblTitleFont));
                    	nzfrCell.setColspan(6);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(nzfrCell);
                        
                        nzfrCell = new Cell(new Phrase("主管部门\n（出资人）",contentFont));
                        nzfrCell.setRowspan(4);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("名称",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("法人类型",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("登记机关",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("证照号码",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("章程",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("□章程   □章程修正案 ",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        nzfrCell.setColspan(2);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("其他",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("□财务负责人   □联络员  ",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        nzfrCell.setColspan(2);
                    	remarktable.addCell(nzfrCell);
                    }
                }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)||"WGDB".equals(opetype)||"HZSFZ".equals(opetype)){
                	 Cell fgsCell = new Cell(new Phrase("□变更/备案",tblTitleFont));
                	 fgsCell.setColspan(6);
                	 fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("变更/备案项目",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("原登记/备案内容",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("申请变更登记/备案内容",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     for(int i=0;i<3;i++){
                    	 fgsCell = new Cell("用于支撑高度");
                    	 fgsCell.setColspan(2);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(" ");
                         fgsCell.setColspan(2);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(" ");
                         fgsCell.setColspan(2);
                         remarktable.addCell(fgsCell);
                     }
                     
                     if("FGS".equals(opetype)||"HZSFZ".equals(opetype)){
                    	 fgsCell = new Cell(new Phrase("□注销 ",tblTitleFont));
                         fgsCell.setColspan(6);
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                    	 fgsCell = new Cell(new Phrase("注销原因",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" □ 1、分公司被公司撤销;     □ 2、分公司被依法责令关闭;\n □ 3、分公司被吊销营业执照; □ 4、其它原因。",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("清税情况",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("  □ 已清理完毕   □ 未涉及纳税义务",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                     }else if("NZYY".equals(opetype)){
                    	 fgsCell = new Cell(new Phrase("□注销 ",tblTitleFont));
                         fgsCell.setColspan(6);
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                    	 fgsCell = new Cell(new Phrase("注销原因",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" □ 1、所属企业法人歇业;    □ 2、隶属单位决定撤销;\n □ 3、□ 3、被登记机关依法吊销或撤销;□ 4、其它原因。",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("债权债务清理",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("□主管部门或者清算组织负责清理债权债务 □ 债务清理完结 ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("清税情况",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" □ 已清理完毕   □ 未涉及纳税义务 ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("缴回公章情况",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" □ 已缴回        □ 未缴回 ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                     }
                }
                
                if("HHFZ".equals(opetype)||"GRDZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	Cell cell = null;
                	cell = new Cell(new Phrase("□注销 ",tblTitleFont));
                	cell.setColspan(6);
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    
                    cell = new Cell(new Phrase("注销原因 ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	cell = new Cell(new Phrase("□ 1.分支机构被上级企业撤销。      □ 2.分支机构被依法责令关闭。\n□ 3.分支机构被吊销营业执照。      □ 4.其他原因。 ",contentFont));	
                    }else if("GRDZ".equals(opetype)){
                    	cell = new Cell(new Phrase("□ 投资人决定解散\n□ 投资人死亡或者被宣告死亡，无继承人或者继承人决定放弃继承\n□ 依法被吊销营业执照\n□ 法律、行政法规规定的其他情形__________________ ",contentFont));
                    }
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(5);
                    remarktable.addCell(cell);
                    if("GRDZ".equals(opetype)){
                    	cell = new Cell(new Phrase("分支机构注销情况 ",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(cell);
                        cell = new Cell(new Phrase(" ",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(5);
                        remarktable.addCell(cell);
                    }
                    cell = new Cell(new Phrase("清税情况 ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    cell = new Cell(new Phrase(" □ 已清理完毕   □ 未涉及纳税义务",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(5);
                    remarktable.addCell(cell);
                }
                
                //申请人声明
                Cell sqrTitle = new Cell(new Phrase("√申请人声明",tblTitleFont));
                sqrTitle.setColspan(6);
                sqrTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                remarktable.addCell(sqrTitle);
                
                String sqrtext = "";
                if("GS".equals(opetype)||"WZGS".equals(opetype)){
                	sqrtext = "\n      本公司依照《公司法》、《公司登记管理条例》相关规定申请登记、备案，提交材料真实有效。 通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("FGS".equals(opetype)){
                	sqrtext = "\n      本公司依照《公司法》、《公司登记管理条例》及相关规定申请分公司登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("NZFR".equals(opetype)){
                	sqrtext = "\n      本企业依照《企业法人登记管理条例》、《企业法人登记管理条例施行细则》及相关规定申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("NZYY".equals(opetype)){
                	sqrtext = "\n      本企业依照《企业法人登记管理条例》、《企业法人登记管理条例施行细则》及相关规定申请登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。 \n";
                }else if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                	sqrtext = "\n      本企业依照相关法律法规规定申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	sqrtext = "\n      本企业依照相关法律法规规定申请分支机构登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("GRDZ".equals(opetype)){
                	sqrtext = "\n      本企业依照相关法律法规规定申请登记、变更（备案）、注销，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("WGJY".equals(opetype)){
                	sqrtext = "\n      本企业依照相关法律法规有关规定申请开业登记，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的企业信息为本企业提供、发布的信息，信息真实、有效。\n";
                }else if("WGDB".equals(opetype)){
                	sqrtext = "\n      本机构依照相关法律法规规定申请登记、备案，提交材料真实有效。 \n";
                }else if("HZS".equals(opetype)||"HZSFZ".equals(opetype)){
                	sqrtext = "\n      本社依法申请登记、备案，提交材料真实有效。通过联络员登录企业信用信息公示系统向登记机关报送、向社会公示的信息为本社提供、发布的信息，信息真实、有效。\n";
                }
                Paragraph sqrp = new Paragraph(sqrtext,contentFont);
                String fdbdrname = "法定代表人签字：";
                if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                	fdbdrname = "执行事务合伙人（含委派代表）签字：";
                }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	fdbdrname = "\n  隶属企业投资人\n  （合伙企业执行事务合伙人或委派代表）签字：";
                }else if("GRDZ".equals(opetype)){
                	fdbdrname = "投资人签字：";
                }else if("WGJY".equals(opetype)||"WGDB".equals(opetype)){
                	fdbdrname = "外国（地区）企业有权签字人签字:";
                }
                Paragraph fdbdr = new Paragraph("      " + fdbdrname + "                                                                                                      盖章：  ",contentFont);
                fdbdr.setFirstLineIndent(40);
                Paragraph fzrqz = new Paragraph("    " + (("GS".equals(opetype)||"HHQY".equals(opetype)||"WZHH".equals(opetype)||"GRDZ".equals(opetype)||"WZGS".equals(opetype)||"HZS".equals(opetype))?"（清算组负责人）签字：":"") +"                                                                                                                         年        月          日   ",contentFont);
                fzrqz.setFirstLineIndent(40);
                Cell allCell = new Cell();
                allCell.add(sqrp);
                allCell.add(fdbdr);
                allCell.add(fzrqz);
                allCell.setColspan(6);
                remarktable.addCell(allCell);
                
                document.add(remarktable);
                
                
            	 //设置法定代表人信息
                if("GRDZ".equals(opetype)){
                	Paragraph lerepTitle =  new Paragraph("\n投资人信息",titleChinese);
                    lerepTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle);
                    
                    //设置TABLE格式
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("姓 名",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("性 别",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("sex"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("出生日期",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("natdate"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("民　 族",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("nation"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("文化程度",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("litedeg"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("政治面貌",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("polstand"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    
                    Cell lerep13 = new Cell(new Phrase("移动电话",contentFont));
                    lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep13);
                    Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("mobile"),contentFont));
                    lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep14);
                    Cell lerep15 = new Cell(new Phrase("电子邮箱",contentFont));
                    lerep15.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep15);
                    Cell lerep16 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("email"),contentFont));
                    lerep16.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep16);
                    
                    Cell lerep17 = new Cell(new Phrase("身份证件类型",contentFont));
                    lerep17.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep17);
                    Cell lerep18 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep18.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep18);
                    Cell lerep19 = new Cell(new Phrase("身份证件号码",contentFont));
                    lerep19.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep19);
                    Cell lerep20 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep20.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep20);
                    
                    Cell lerep21 = new Cell(new Phrase("居　 所",contentFont));
                    lerep21.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep21);
                    Cell lerep22 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("houseadd"),contentFont));
                    lerep22.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep22);
                    Cell lerep23 = new Cell(new Phrase("邮政编码",contentFont));
                    lerep23.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep23);
                    Cell lerep24 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("postalcode"),contentFont));
                    lerep24.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep24);
                    
                    Cell lerep25 = new Cell(new Phrase("申请前职业状况",contentFont));
                    lerep25.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep25);
                    Cell lerep26 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("occstbeapp"),contentFont));
                    lerep26.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lerep26.setColspan(3);
                    lereptable.addCell(lerep26);
                    
                    document.add(lereptable);
                }else if("WGDB".equals(opetype)){
                	Paragraph lerepTitle1 =  new Paragraph("\n外国（地区）企业常驻代表机构",titleChinese);
                    lerepTitle1.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle1);
                    Paragraph lerepTitle2 =  new Paragraph("首席代表/代表信息",titleChinese);
                    lerepTitle2.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle2);
                    
                    
                    //设置TABLE格式
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("机构名称",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("entname"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("代表姓名",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("职务",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("position"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("国籍",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("country"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("入境时间",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("arrchdate"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("联系电话",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("tel"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    
                    Cell lerep13 = new Cell(new Phrase("证件类型",contentFont));
                    lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep13);
                    Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep14);
                    Cell lerep15 = new Cell(new Phrase("证件号码",contentFont));
                    lerep15.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep15);
                    Cell lerep16 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep16.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep16);
                    
                    Cell lerep17 = new Cell(new Phrase("境内居住地址",contentFont));
                    lerep17.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep17);
                    Cell lerep18 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("houaddinchina"),contentFont));
                    lerep18.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep18);
                    Cell lerep19 = new Cell(new Phrase("代表证有效期限",contentFont));
                    lerep19.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep19);
                    Cell lerep20 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("repdate"),contentFont));
                    lerep20.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep20);
                    
                    Paragraph rep1 = new Paragraph("本人承诺，不存在不得担任首席代表、代表的以下情形：",contentFont);
                    rep1.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep2 = new Paragraph("1、因损害中国国家安全或者社会公共利益，被判处刑罚的；",contentFont);
                    rep2.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep3 = new Paragraph("2、因从事损害中国国家安全或者社会公共利益等违法活动，依法被撤销设立登记、吊销登记证或者被有关部门依法责令关闭的代表机构的首席代表、代表，自被撤销、吊销或者责令关闭之日起未逾5年的；",contentFont);
                    rep3.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep4 = new Paragraph("3、国家工商行政管理总局规定的其他情形。",contentFont);
                    rep4.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep5 = new Paragraph("首席代表/代表签字",contentFont);
                    rep5.setAlignment(Paragraph.ALIGN_LEFT);
                    rep5.setIndentationLeft(200);
                    
                    Cell lerep21 = new Cell();
                    lerep21.add(rep1);
                    lerep21.add(rep2);
                    lerep21.add(rep3);
                    lerep21.add(rep4);
                    lerep21.add(rep5);
                    lerep21.setColspan(4);
                    lereptable.addCell(lerep21);
                    
                    document.add(lereptable);
                }else{
                	Paragraph lerepTitle = null;
                    if("GS".equals(opetype)||"NZFR".equals(opetype)||"WZGS".equals(opetype)||"HZS".equals(opetype)){
                    	lerepTitle = new Paragraph("\n法定代表人信息",titleChinese);
                    }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)||"HZSFZ".equals(opetype)){
                    	lerepTitle = new Paragraph("\n负责人信息",titleChinese);
                    }else if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                    	lerepTitle = new Paragraph("\n执行事务合伙人（含委派代表）信息",titleChinese);
                    }
                    lerepTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle);
                    
                    //设置TABLE格式
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("姓 名",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("固定电话",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("tel"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("移动电话",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("mobile"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("电子邮箱",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("email"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("身份证件类型",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("身份证件号码",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)){
                    	Cell lerep13 = new Cell(new Phrase("申请前职业状况",contentFont));
                        lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lereptable.addCell(lerep13);
                        Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("occstbeapp"),contentFont));
                        lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lerep14.setColspan(3);
                        lereptable.addCell(lerep14);
                    }else if("WZFZ".equals(opetype)||"WZHH".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)){
                    	Cell lerep13 = new Cell(new Phrase("国别（地区）",contentFont));
                        lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lereptable.addCell(lerep13);
                        Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("country"),contentFont));
                        lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lerep14.setColspan(3);
                        lereptable.addCell(lerep14);
                    }
                    
                    document.add(lereptable);
                }
                
                if("HZS".equals(opetype)){
                	Paragraph hzsp = new Paragraph("\n《中华人民共和国农民专业合作社法》第三十条规定：“农民专业合作社的理事长、理事、经理不得兼任业务性质相同的其他农民专业合作社的理事长、理事、监事、经理。”第三十一条规定：“执行与农民专业合作社业务有关的公务的人员，不得担任农民专业合作社的理事长、理事、监事、经理或者财务会计人员。”  本人符合《中华人民共和国农民专业合作社法》第三十条、第三十一条的规定，并对此承诺的真实性承担责任。",contentFont);
                	document.add(hzsp);
                	Paragraph hzsp1 = new Paragraph("\n法定代表人签名：",contentFont);
                	hzsp1.setIndentationLeft(200);
                	document.add(hzsp1);
                	Paragraph hzsp2 = new Paragraph("\n年        月          日                               ",contentFont);
                	hzsp2.setAlignment(Paragraph.ALIGN_RIGHT);
                	document.add(hzsp2);
                }
                
                if("GS".equals(opetype)||"WZGS".equals(opetype)){
                	//设置董监事信息(共用)
                    Paragraph ryxxTitle = new Paragraph("\n董事、监事、经理信息",titleChinese);
                    ryxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(ryxxTitle);
                    
                    //设置TABLE格式
                    Table ryxxtable = new Table(1);  
                    int ryxxwidths[] = { 100 };  
                    ryxxtable.setWidths(ryxxwidths);  
                    ryxxtable.setWidth(100);  
                    ryxxtable.setPadding(3);  
                    ryxxtable.setBorderWidth(1);
                    ryxxtable.setAlignment(Cell.ALIGN_CENTER);
                    List<Map<String,String>> ryxxList = (List<Map<String,String>>)dataMap.get("ryxxList");
                    if(ryxxList!=null&&!ryxxList.isEmpty()){
                    	for(int i=0;i<ryxxList.size();i++){
                    		Map<String,String> ryxxs = ryxxList.get(i);
                    		Paragraph p = new Paragraph();
                    		if("GS".equals(opetype)){
                    			Phrase p1 = new Phrase("姓名：" + (ryxxs==null?"":ryxxs.get("name")) + "     ",contentFont);
                    			p.add(p1);
                    			Phrase p2 = new Phrase("职务：" + (ryxxs==null?"":ryxxs.get("position")) + "     ",contentFont);
                    			p.add(p2);
                    			Phrase p3 = new Phrase("身份证件类型：" + (ryxxs==null?"":ryxxs.get("certype")) + "     ",contentFont);
                    			p.add(p3);
                    			Phrase p4 = new Phrase("身份证件号码：" + (ryxxs==null?"":ryxxs.get("cerno")) + "     ",contentFont);
                    			p.add(p4);
                    		}else if("WZGS".equals(opetype)){
                    			Phrase p1 = new Phrase("姓名：" + (ryxxs==null?"":ryxxs.get("name")) + "     ",contentFont);
                    			p.add(p1);
                    			Phrase p2 = new Phrase("国别（地区）：" + (ryxxs==null?"":ryxxs.get("country")) + "     ",contentFont);
                    			p.add(p2);
                    			Phrase p3 = new Phrase("身份证件类型：" + (ryxxs==null?"":ryxxs.get("certype")) + "     ",contentFont);
                    			p.add(p3);
                    			Phrase p4 = new Phrase("身份证件号码：" + (ryxxs==null?"":ryxxs.get("cerno")) + "     ",contentFont);
                    			p.add(p4);
                    			Phrase p5 = new Phrase("职务：" + (ryxxs==null?"":ryxxs.get("position")) + "     ",contentFont);
                    			p.add(p5);
                    			Phrase p6 = new Phrase("产生方式：" + (ryxxs==null?"":ryxxs.get("posbrform")) + "     ",contentFont);
                    			p.add(p6);
                    		}
                    		Cell cell = new Cell(p);
                    		ryxxtable.addCell(cell);
                    	}
                    }
                    document.add(ryxxtable); 
                }
                
                if("GS".equals(opetype)){
                	//设置股东发起人信息(共用)
                    Paragraph czxxTitle = new Paragraph("\n公司股东(发起人)出资信息",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //设置TABLE格式
                    Table czxxtable = new Table(7); 
                    int czxxwidths[] = { 20, 20,15,10,10,15,10 };  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("投资者名称\n或姓名",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("证件类型",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("证件号码",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("出资时间",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("出资方式",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("认缴出资额\n（万元）",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("出资比例",contentFont));
                    	ct7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct7);
                    	for(int i=0;i<czxxList.size();i++){
                    		List<String> czxxs = czxxList.get(i);
                    		if(!czxxs.isEmpty()){
                    			for(int j=0;j<czxxs.size();j++){
                    				Cell czCell = new Cell(new Phrase(czxxs.get(j),contentFont));
                    				czCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    				czxxtable.addCell(czCell);
                    			}
                    		}
                    	}
                    }
                    document.add(czxxtable);  
                }else if("WZGS".equals(opetype)||"WZHH".equals(opetype)){
                	//设置股东发起人信息(共用)
                    Paragraph czxxTitle = new Paragraph("\n投资者（股东/发起人）出资情况",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //设置TABLE格式
                    int length = 0;
                    int[] czxxwidths = null;
                    if("WZGS".equals(opetype)){
                    	length = 8;
                    	czxxwidths = new int[]{ 20, 10,15,10,10,15,10,10 };
                    }else if("WZHH".equals(opetype)){
                    	length = 9;
                    	czxxwidths = new int[]{ 12, 11,11,11,11,11,11,11,11 };  
                    }
                    Table czxxtable = new Table(length);
                    czxxtable.setWidths(czxxwidths);
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	String ct1text = "";
                    	if("WZGS".equals(opetype)){
                    		ct1text = "投资者名称\n或姓名";
                    	}else if("WZHH".equals(opetype)){
                    		ct1text = "合伙人名称\n或姓名";
                    	}
                    	Cell ct1 = new Cell(new Phrase(ct1text,contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct11 = new Cell(new Phrase("国别（地区）",contentFont));
                    	ct11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct11);
                    	Cell ct2 = new Cell(new Phrase("证件类型",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("证件号码",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct31 = new Cell(new Phrase("承担责任方式",contentFont)); 
                    	ct31.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct31);
                    	Cell ct4 = new Cell(new Phrase("出资时间",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("出资方式",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("认缴出资额\n（万元）",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("出资比例",contentFont));
                    	ct7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct7);
                    	for(int i=0;i<czxxList.size();i++){
                    		List<String> czxxs = czxxList.get(i);
                    		if(!czxxs.isEmpty()){
                    			for(int j=0;j<czxxs.size();j++){
                    				Cell czCell = new Cell(new Phrase(czxxs.get(j),contentFont));
                    				czCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    				czxxtable.addCell(czCell);
                    			}
                    		}
                    	}
                    }
                    document.add(czxxtable); 
                }else if("HHQY".equals(opetype)){
                	//全体合伙人名录及出资情况
                    Paragraph czxxTitle = new Paragraph("\n全体合伙人名录及出资情况",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //设置TABLE格式
                    Table czxxtable = new Table(9); 
                    int czxxwidths[] = { 12, 11,11,11,11,11,11,11,11 };  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("合伙人名称或姓名",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("住所",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("证件类型及号码",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("承担责任方式",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("出资方式",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("评估方式",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("认缴出资额（万元）",contentFont));
                    	ct7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct7);
                    	Cell ct8 = new Cell(new Phrase("实缴出资额（万元）",contentFont));
                    	ct8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct8);
                    	Cell ct9 = new Cell(new Phrase("缴付期限",contentFont));
                    	ct9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct9);
                    	for(int i=0;i<czxxList.size();i++){
                    		List<String> czxxs = czxxList.get(i);
                    		if(!czxxs.isEmpty()){
                    			for(int j=0;j<czxxs.size();j++){
                    				Cell czCell = new Cell(new Phrase(czxxs.get(j),contentFont));
                    				czCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    				czxxtable.addCell(czCell);
                    			}
                    		}
                    	}
                    }
                    document.add(czxxtable);  
                }else if("HZS".equals(opetype)){
                	//农民专业合作社成员出资清单
                    Paragraph czxxTitle = new Paragraph("\n农民专业合作社成员出资清单",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //设置TABLE格式
                    Table czxxtable = new Table(5); 
                    int czxxwidths[] = {10, 30,20,20,20};  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("序号",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("出资成员姓名或名称",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("出资方式",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("出资额（元）",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("出资成员签名或盖章",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	for(int i=0;i<czxxList.size();i++){
                    		List<String> czxxs = czxxList.get(i);
                    		if(!czxxs.isEmpty()){
                    			for(int j=0;j<czxxs.size();j++){
                    				Cell czCell = new Cell(new Phrase(czxxs.get(j),contentFont));
                    				czCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    				czxxtable.addCell(czCell);
                    			}
                    		}
                    	}
                    }
                    document.add(czxxtable);  
                    
                    Paragraph czzep = new Paragraph("\n成员出资总额:    " + dataMap.get("regcap") + "   (元)  ",contentFont);
                    czzep.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep.setIndentationLeft(100);
                    document.add(czzep);
                    Paragraph czzep1 = new Paragraph("\n法定代表人签名：  ",contentFont);
                    czzep1.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep1.setIndentationLeft(100);
                    document.add(czzep1);
                    Paragraph czzep2 = new Paragraph("\n年          月           日                                   ",contentFont);
                    czzep2.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(czzep2);
                }
                
                
                if("HZS".equals(opetype)){
                	//农民专业合作社成员名册
                    Paragraph czxxTitle = new Paragraph("\n农民专业合作社成员名册",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //设置TABLE格式
                    Table czxxtable = new Table(5); 
                    int czxxwidths[] = {10, 20,30,25,15};  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("hzsList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("序号",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("成员姓名或名称",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("证件名称及号码",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("住所",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("成员类型",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	for(int i=0;i<czxxList.size();i++){
                    		List<String> czxxs = czxxList.get(i);
                    		if(!czxxs.isEmpty()){
                    			for(int j=0;j<czxxs.size();j++){
                    				Cell czCell = new Cell(new Phrase(czxxs.get(j),contentFont));
                    				czCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    				czxxtable.addCell(czCell);
                    			}
                    		}
                    	}
                    }
                    document.add(czxxtable);  
                    
                    Paragraph czzep = new Paragraph("\n成员总数:    " + dataMap.get("cyzs") + "   (名)   其中： ",contentFont);
                    czzep.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep.setIndentationLeft(40);
                    document.add(czzep);
                    Paragraph czzep1 = new Paragraph("农民成员： " + dataMap.get("nmcy") + "   (名)所占比例：  " + dataMap.get("nmcyrate") + "    % ",contentFont);
                    czzep1.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep1.setIndentationLeft(100);
                    document.add(czzep1);
                    Paragraph czzep2 = new Paragraph("企业、事业单位或社会团体成员：   " + dataMap.get("frcy") + "   (名)所占比例： " + dataMap.get("frcyrate") + "  %",contentFont);
                    czzep2.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep2.setIndentationLeft(100);
                    document.add(czzep2);
                    
                    Paragraph czzep3 = new Paragraph("本农民专业合作社的成员符合《农民专业合作社登记管理条例》第十三条、第十四条的规定，并对此承诺的真实性承担责任。 ",contentFont);
                    czzep3.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep3.setIndentationLeft(40);
                    document.add(czzep3);
                    
                    Paragraph czzep4 = new Paragraph("\n法定代表人签名： ",contentFont);
                    czzep4.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep4.setIndentationLeft(100);
                    document.add(czzep4);
                    
                    Paragraph czzep5 = new Paragraph("\n年         月             日                                           ",contentFont);
                    czzep4.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(czzep4);
                }
                
                //设置财务负责人信息(共用)
                Paragraph cwfzrTitle = new Paragraph("\n财务负责人信息",titleChinese);
                cwfzrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(cwfzrTitle);
                
                //设置TABLE格式
                Table cwfzrtable = new Table(4); 
                int cwfzrwidths[] = { 20, 30,20,30};  
                cwfzrtable.setWidths(cwfzrwidths);  
                cwfzrtable.setWidth(100);  
                cwfzrtable.setPadding(3);  
                cwfzrtable.setBorderWidth(1);
                cwfzrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Map<String,String> cwfzrMap = (Map<String,String>)dataMap.get("cwfzrMap");
                Cell cwfzr1 = new Cell(new Phrase("姓 名",contentFont));
                cwfzr1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr1);
                Cell cwfzr2 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("name"),contentFont));
                cwfzr2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr2);
                Cell cwfzr3 = new Cell(new Phrase("固定电话",contentFont));
                cwfzr3.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr3);
                Cell cwfzr4 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("tel"),contentFont));
                cwfzr4.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr4);
                
                Cell cwfzr5 = new Cell(new Phrase("移动电话",contentFont));
                cwfzr5.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr5);
                Cell cwfzr6 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("mobile"),contentFont));
                cwfzr6.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr6);
                Cell cwfzr7 = new Cell(new Phrase("电子邮箱",contentFont));
                cwfzr7.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr7);
                Cell cwfzr8 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("email"),contentFont));
                cwfzr8.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr8);
                
                Cell cwfzr9 = new Cell(new Phrase("身份证件类型",contentFont));
                cwfzr9.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr9);
                Cell cwfzr10 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("certype"),contentFont));
                cwfzr10.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr10);
                Cell cwfzr11 = new Cell(new Phrase("身份证件号码",contentFont));
                cwfzr11.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr11);
                Cell cwfzr12 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("cerno"),contentFont));
                cwfzr12.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr12);
                
                document.add(cwfzrtable);
                
                //设置联络员信息(共用)
                Paragraph llrTitle = new Paragraph("\n联络员信息",titleChinese);
                llrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(llrTitle);
                
                //设置TABLE格式
                Table llrtable = new Table(4); 
                int llrwidths[] = { 20, 30,20,30 };  
                llrtable.setWidths(llrwidths);  
                llrtable.setWidth(100);  
                llrtable.setPadding(3);  
                llrtable.setBorderWidth(1);
                llrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Map<String,String> llrMap = (Map<String,String>)dataMap.get("llrMap");
                Cell llr1 = new Cell(new Phrase("姓 名",contentFont));
                llr1.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr1);
                Cell llr2 = new Cell(new Phrase(llrMap==null?"":llrMap.get("name"),contentFont));
                llr2.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr2);
                Cell llr3 = new Cell(new Phrase("固定电话",contentFont));
                llr3.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr3);
                Cell llr4 = new Cell(new Phrase(llrMap==null?"":llrMap.get("tel"),contentFont));
                llr4.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr4);
                
                Cell llr5 = new Cell(new Phrase("移动电话",contentFont));
                llr5.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr5);
                Cell llr6 = new Cell(new Phrase(llrMap==null?"":llrMap.get("mobile"),contentFont));
                llr6.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr6);
                Cell llr7 = new Cell(new Phrase("电子邮箱",contentFont));
                llr7.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr7);
                Cell llr8 = new Cell(new Phrase(llrMap==null?"":llrMap.get("email"),contentFont));
                llr8.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr8);
                
                Cell llr9 = new Cell(new Phrase("身份证件类型",contentFont));
                llr9.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr9);
                Cell llr10 = new Cell(new Phrase(llrMap==null?"":llrMap.get("certype"),contentFont));
                llr10.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr10);
                Cell llr11 = new Cell(new Phrase("身份证件号码",contentFont));
                llr11.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr11);
                Cell llr12 = new Cell(new Phrase(llrMap==null?"":llrMap.get("cerno"),contentFont));
                llr12.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr12);
                
                document.add(llrtable);
                
                //设置委托人信息(共用)
                Paragraph wtrTitle = new Paragraph("\n指定代表或者共同委托代理人的证明",titleChinese);
                wtrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(wtrTitle);
                
                Map<String,String> wtrMap = (Map<String,String>)dataMap.get("wtrMap");
                
                String sqrText = "申 请 人 ：" + (wtrMap==null?"":wtrMap.get("sqr"));
                Paragraph sqr = new Paragraph(sqrText,contentFont);
                sqr.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(sqr);
                
                String wtrText = "指定代表或者委托代理人 ：" + (wtrMap==null?"":wtrMap.get("wtr"));
                Paragraph wtr = new Paragraph(wtrText,contentFont);
                wtr.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wtr);
                
                Paragraph wtsx = new Paragraph("委托事项及权限：\n",contentFont);
                wtsx.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wtsx);
                
                String wtText1 = "1、办理    " + (wtrMap==null?"":wtrMap.get("entname")) +  "     （企业名称）的";
                Paragraph wt1 = new Paragraph(wtText1,contentFont);
                //设置段落左缩进
                wt1.setIndentationLeft(60);
                document.add(wt1);
                
                Paragraph wt2 = new Paragraph("□ 名称预先核准 √ 设立 □ 变更 □ 注销 □ 备案 □ 撤销变更登记",contentFont);
                //设置段落左缩进
                wt2.setIndentationLeft(70);
                document.add(wt2);
                
                Paragraph wt3 = new Paragraph("□ 股权出质 （□设立 □变更 □ 注销 □撤销）□ 其他__________手续。",contentFont);
                //设置段落左缩进
                wt3.setIndentationLeft(70);
                document.add(wt3);
                
                Paragraph wt4 = new Paragraph("2." + (wtrMap==null?"":wtrMap.get("qx1")) + " 核对登记材料中的复印件并签署核对意见；",contentFont);
                //设置段落左缩进
                wt4.setIndentationLeft(60);
                document.add(wt4);
                
                Paragraph wt5 = new Paragraph("3." + (wtrMap==null?"":wtrMap.get("qx2")) + " 修改企业自备文件的错误； ",contentFont);
                //设置段落左缩进
                wt5.setIndentationLeft(60);
                document.add(wt5);
                
                Paragraph wt6 = new Paragraph("4." + (wtrMap==null?"":wtrMap.get("qx3")) + " 修改有关表格的填写错误；",contentFont);
                //设置段落左缩进
                wt6.setIndentationLeft(60);
                document.add(wt6);
                
                Paragraph wt7 = new Paragraph("5." + (wtrMap==null?"":wtrMap.get("qx4")) + "领取营业执照和有关文书。\n",contentFont);
                //设置段落左缩进
                wt7.setIndentationLeft(60);
                document.add(wt7);
                
                Paragraph wt8 = new Paragraph("指定或委托的有效期限：自    " + (wtrMap==null?"":wtrMap.get("confrom")) + "   至     " + (wtrMap==null?"":wtrMap.get("conto")) + " \n ",contentFont);
                wt8.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wt8);
                
                //设置TABLE格式
                Table wtrtable = new Table(2); 
                int[] wtrwidths = { 50,50 };  
                wtrtable.setWidths(wtrwidths);  
                wtrtable.setWidth(100);  
                wtrtable.setPadding(3);  
                wtrtable.setBorderWidth(1);
                wtrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Cell wtrc1 = new Cell(new Phrase("指定代表或委托代理人或者经办人信息",contentFont));
                wtrc1.setRowspan(3);
                wtrc1.setHorizontalAlignment(Element.ALIGN_CENTER);
                wtrtable.addCell(wtrc1);
                
                Cell wtrc2 = new Cell(new Phrase("签 字：",contentFont));
                wtrc2.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc2);
                
                String telText = "固定电话：" + (wtrMap==null?"":wtrMap.get("tel"));
                Cell wtrc3 = new Cell(new Phrase(telText,contentFont));
                wtrc3.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc3);
                
                String mobileText = "移动电话：" + (wtrMap==null?"":wtrMap.get("mobile"));
                Cell wtrc4 = new Cell(new Phrase(mobileText,contentFont));
                wtrc4.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc4);
                
                document.add(wtrtable);
                
                Paragraph wt9 = new Paragraph("\n（申请人盖章或签字） ",contentFont);
                wt9.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wt9);
                
                Paragraph wt10 = new Paragraph("\n" + (wtrMap==null?"":wtrMap.get("condate")) + " ",contentFont);
                wt10.setAlignment(Paragraph.ALIGN_RIGHT);
                document.add(wt10);
                
                //设置外商投资企业送达授权委托书
                if("WZGS".equals(opetype)||"WZHH".equals(opetype)||"WGJY".equals(opetype)){
                	Paragraph wtsTitle1 = new Paragraph("\n外商投资企业法律文件送达",titleChinese);
                	wtsTitle1.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(wtsTitle1);
                    Paragraph wtsTitle2 = new Paragraph("授权委托书",titleChinese);
                	wtsTitle2.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(wtsTitle2);
                    
                    Map<String, String> sdMap = (Map<String, String>)dataMap.get("sdMap");
                    
                    Paragraph sdsq = new Paragraph("授权人 ：",contentFont);
                    sdsq.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sdsq);
                    
                    String sdbsqText = "被授权人：    " + (sdMap==null?"":sdMap.get("name"));
                    Paragraph sdbsq = new Paragraph(sdbsqText,contentFont);
                    sdbsq.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sdbsq);
                    
                    String sqfwText = "授权范围：授予   " + (sdMap==null?"":sdMap.get("name")) + "     （被授权人名称或姓名）代表";
                    Paragraph sqfw = new Paragraph(sqfwText,contentFont);
                    sqfw.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sqfw);
                    
                    Paragraph sqfw2 = new Paragraph("_______（授权人名称或姓名）在中国境内接受企业登记机关法律文件送达，直至解除授权为止。",contentFont);
                    sqfw2.setAlignment(Paragraph.ALIGN_LEFT);
                    sqfw2.setIndentationLeft(60);
                    document.add(sqfw2);
                    
                  //设置TABLE格式
                    Table sdstable = new Table(4); 
                    int[] sdswidths = { 20,30,20,30 };  
                    sdstable.setWidths(sdswidths);  
                    sdstable.setWidth(100);  
                    sdstable.setPadding(3);  
                    sdstable.setBorderWidth(1);
                    sdstable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Cell sd1 = new Cell(new Phrase("被授权人地址",contentFont));
                    sd1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd1);
                    
                    Cell sd2 = new Cell(new Phrase(sdMap==null?"":sdMap.get("addr"),contentFont));
                    sd2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd2);
                    
                    Cell sd3 = new Cell(new Phrase("邮政编码",contentFont));
                    sd3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd3);
                    
                    Cell sd4 = new Cell(new Phrase(sdMap==null?"":sdMap.get("postalcode"),contentFont));
                    sd4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd4);
                    
                    Cell sd5 = new Cell(new Phrase("被授权人联系人",contentFont));
                    sd5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd5);
                    
                    Cell sd6 = new Cell(new Phrase(sdMap==null?"":sdMap.get("linkman"),contentFont));
                    sd6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd6);
                    
                    Cell sd7 = new Cell(new Phrase("电子邮件",contentFont));
                    sd7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd7);
                    
                    Cell sd8 = new Cell(new Phrase(sdMap==null?"":sdMap.get("email"),contentFont));
                    sd8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd8);
                    
                    Cell sd9 = new Cell(new Phrase("被授权人联系人\n联系电话",contentFont));
                    sd9.setRowspan(2);
                    sd9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd9);
                    
                    Cell sd10 = new Cell(new Phrase("固定：     " + (sdMap==null?"":sdMap.get("tel")),contentFont));
                    sd10.setColspan(3);
                    sd10.setHorizontalAlignment(Element.ALIGN_LEFT);
                    sdstable.addCell(sd10);
                    
                    Cell sd11 = new Cell(new Phrase("移动：     " + (sdMap==null?"":sdMap.get("mobtel")),contentFont));
                    sd11.setColspan(3);
                    sd11.setHorizontalAlignment(Element.ALIGN_LEFT);
                    sdstable.addCell(sd11);
                    
                    document.add(sdstable);
                    
                    Paragraph sds1 = new Paragraph("\n授权人签字或盖章                                                                           被授权人签字或盖章 ",contentFont);
                    sds1.setAlignment(Paragraph.ALIGN_LEFT);
                    sds1.setIndentationLeft(100);
                    document.add(sds1);
                    
                    Paragraph sds2 = new Paragraph("\n 年      月       日                                        ",contentFont);
                    sds2.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(sds2);
                    
                    Paragraph remark = new Paragraph(" 注：《外商投资企业法律文件送达授权委托书》由外国投资者（授权人）与境内法律文件送达接受人（被授权人）签署。被授权人可以是外国投资者设立的分支机构、拟设立的公司（被授权人为拟设立的公司的，公司设立后委托生效）或者其他境内有关单位或个人。被授权人、被授权人地址等事项发生变更的，应当签署新的《外商投资企业法律文件送达授权委托书》及时向企业登记机关备案。 ",contentFont);
                    remark.setIndentationLeft(60);
                    remark.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(remark);
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
            logger.debug(e);
        }  

        //关闭PDF输出
        document.close();  
	}
	
	public String getPdfUrlAndCreatePdf(String openo){
		QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
		QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
		QYDJ_RYXX_SQ lerep = new QYDJ_RYXX_SQ();
		QYDJ_CZXX_SQ czxx = new QYDJ_CZXX_SQ();
		QYDJ_RYXX_SQ ryxx = new QYDJ_RYXX_SQ();
		QYDJ_CWFZR_SQ cwfzr = new QYDJ_CWFZR_SQ();
		QYDJ_WZLLR_SQ llr = new QYDJ_WZLLR_SQ();
		QYDJ_SQWT_SQ sqwt = new QYDJ_SQWT_SQ();
		QYDJ_WZWJSD_SQ wjsd = new QYDJ_WZWJSD_SQ();
		GTDJ_JBXX_SQ gtxx = new GTDJ_JBXX_SQ();
		GTDJ_JYZXX_SQ jyzxx = new GTDJ_JYZXX_SQ();
		List<QYDJ_RYXX_SQ> ryxxs = new ArrayList<QYDJ_RYXX_SQ>(); 
		List<QYDJ_CZXX_SQ> czxxs = new ArrayList<QYDJ_CZXX_SQ>();
		List<QYDJ_SQWT_SQ> sqwts = new ArrayList<QYDJ_SQWT_SQ>();
		List<QYDJ_WZWJSD_SQ> wjsds = new ArrayList<QYDJ_WZWJSD_SQ>();
		try {
			ywsb.setOPENO(openo);
			ywsb.doSelect();
			jbxx.setOPENO(openo);
			jbxx.doSelect();
			lerep.setOPENO(openo);
			lerep.getDataByFr();
			ryxxs = ryxx.getList(" WHERE OPENO='"+openo+"'");
			czxxs = czxx.getList(" WHERE OPENO='"+openo+"'");
			cwfzr.setOPENO(openo);
			cwfzr.doSelect();
			llr.setOPENO(openo);
			llr.doSelect();
			sqwts = sqwt.getList(" WHERE OPENO='"+openo+"'");
			wjsds = wjsd.getList(" WHERE OPENO='"+openo+"'");
			gtxx.setOPENO(openo);
			gtxx.doSelect();
			jyzxx.setOPENO(openo);
			jyzxx.doSelect();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String checkBox = "□";
	    String selected = "√";
	    
		Map map = new HashMap();
		
		if(StringUtils.isEmpty(jbxx.getENTTYPE())&&StringUtils.isEmpty(gtxx.getTRANAME())){
			return null;
		}
		String opetype = "";
		if(StringUtils.isEmpty(gtxx.getTRANAME())){
			opetype = getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "2");
		}else{
			opetype = "GT";
		}
		
		//设置标题
		String title = "";
		if("GS".equals(opetype)){
			title = "公司登记（备案）申请书";
		}else if("FGS".equals(opetype)){
			title = "分公司登记申请书";
		}else if("NZFR".equals(opetype)){
			title = "非公司企业法人登记（备案）申请书";
		}else if("NZYY".equals(opetype)){
			title = "营业单位登记申请书";
		}else if("HHQY".equals(opetype)){
			title = "合伙企业登记（备案）申请书";
		}else if("HHFZ".equals(opetype)){
			title = "个人独资（合伙）企业分支机构登记申请书";
		}else if("GRDZ".equals(opetype)){
			title = "个人独资企业登记（备案）申请书";
		}else if("GRDZFZ".equals(opetype)){
			title = "个人独资（合伙）企业分支机构登记申请书";
		}else if("WZGS".equals(opetype)){
			title = "外资公司登记（备案）申请书";
		}else if("WZFZ".equals(opetype)){
			title = "外资企业分支机构登记申请书";
		}else if("WGDB".equals(opetype)){
			title = "外国（地区）企业常驻代表机构登记申请书";
		}else if("WGJY".equals(opetype)){
			title = "外国（地区）企业在中国境内从事生产经营活动登记申请书";
		}else if("WZHH".equals(opetype)){
			title = "外商投资合伙企业登记申请书";
		}else if("WZHHFZ".equals(opetype)){
			title = "外资企业分支机构登记申请书";
		}else if("HZS".equals(opetype)){
			title = "农民专业合作社登记（备案）申请书";
		}else if("HZSFZ".equals(opetype)){
			title = "农民专业合作社分支机构登记（备案）申请书";
		}else if("GT".equals(opetype)){
			title = "个体工商户开业登记申请书";
		}
		
		
		map.put("title", title);
		map.put("opetype", opetype);
		
		Map<String, String> jbxxMap = new HashMap<String, String>();
		jbxxMap.put("entname", jbxx.getENTNAME());
		jbxxMap.put("regno", jbxx.getNAMEAPPNO());
		jbxxMap.put("supentname", jbxx.getSUPENTNAME());
		jbxxMap.put("supregno", jbxx.getSUPREGNO());

		//设置住所
		StringBuilder dom = new StringBuilder();
		dom.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROVINCE().length()==6?jbxx.getPROVINCE():jbxx.getPROVINCE()+"00", "1")).append("  省（市/自治区）  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCITY(),"1")).append("  市（地区/盟/自治州）  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCOUNTY(),"1")).append("  县（自治县/旗/自治旗/市/区）  ");
		dom.append(jbxx.getTOWN()).append("  乡（民族乡/镇/街道）  ");
		dom.append(jbxx.getVILLAGE()).append("  村（路/社区）  ");
		dom.append(jbxx.getHOUSENUMBER()).append("  号");
		jbxxMap.put("dom", dom.toString());
		jbxxMap.put("depincha", jbxx.getDEPINCHA());
		
		//设置生产经营地
		StringBuilder oploc = new StringBuilder();
		oploc.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROPROVINCE().length()==6?jbxx.getPROPROVINCE():jbxx.getPROPROVINCE()+"00", "1")).append("  省（市/自治区）  ");
		oploc.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getPROCITY(),"1")).append("  市（地区/盟/自治州）  ");
		oploc.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getPROCOUNTY(),"1")).append("  县（自治县/旗/自治旗/市/区）  ");
		oploc.append(jbxx.getPROTOWN()).append("  乡（民族乡/镇/街道）  ");
		oploc.append(jbxx.getPROVILLAGE()).append("  村（路/社区）  ");
		oploc.append(jbxx.getPROHOUSENUMBER()).append("  号");
		jbxxMap.put("oploc", oploc.toString());
		
		jbxxMap.put("tel", jbxx.getTEL());
		jbxxMap.put("postalcode", jbxx.getPOSTALCODE());
		jbxxMap.put("lerep", jbxx.getLEREP());
		jbxxMap.put("houseadd", ryxx.getHOUSEADD());
		jbxxMap.put("cerno", ryxx.getCERNO());
		jbxxMap.put("yysj", "自   " + jbxx.getOPFROM() + "  至       " +jbxx.getOPTO());
		//设置职务
		StringBuilder position = new StringBuilder();
		String sl1=checkBox,sl2=checkBox,sl3=checkBox;
		if("431A".equals(jbxx.getPOSITION()) || "431B".equals(jbxx.getPOSITION())){
			sl1=selected;
		}else if("432K".equals(jbxx.getPOSITION())){
			sl2=selected;
		}else if("434Q".equals(jbxx.getPOSITION()) || "434R".equals(jbxx.getPOSITION()) || "436A".equals(jbxx.getPOSITION())){
			sl3=selected;
		}else if ("410A".equals(jbxx.getPOSITION())){
			sl1=selected;
			sl3=selected;
		}else if ("410C".equals(jbxx.getPOSITION())){
			sl2=selected;
			sl3=selected;
		}
		position.append(sl1).append("董事长");
		position.append(sl2).append("执行董事");
		position.append(sl3).append("经理");
		jbxxMap.put("position", position.toString());
		
		jbxxMap.put("regcap", jbxx.getREGCAP() + "万元");
		jbxxMap.put("regcapcur", getDmdzByTypeAndCode("CURRENCY", jbxx.getREGCAPCUR(), "1"));
		jbxxMap.put("enttype", getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "1"));
		//设置合伙企业类型
		String  hhlx = "";
		if("4531".equals(jbxx.getENTTYPE())){
			hhlx = selected + " 普通合伙   " + checkBox + "  特殊的普通合伙       " + checkBox + "   有限合伙";
		}else if("4532".equals(jbxx.getENTTYPE())){
			hhlx = checkBox + " 普通合伙   " + selected + "  特殊的普通合伙       " + checkBox + "   有限合伙";
		}else if("4533".equals(jbxx.getENTTYPE())){
			hhlx = checkBox + " 普通合伙   " + checkBox + "  特殊的普通合伙       " + selected + "   有限合伙";
		}
		jbxxMap.put("hhlx", hhlx);
		//设置合伙出资额
		String  hhcze = "其中：实缴    " + jbxx.getREGCAP() + "   万元，认缴   " + jbxx.getREGCAP() + "    万元 ";
		jbxxMap.put("hhcze", hhcze);
		
		jbxxMap.put("parnum", String.valueOf(jbxx.getPARNUM()));
		jbxxMap.put("exenum", String.valueOf(jbxx.getEXENUM()));
		jbxxMap.put("empnum", String.valueOf(jbxx.getEMPNUM()));
		//个人独资出资方式
		String grczfs = "";
		if("1".equals(jbxx.getSCONFORM())){
			grczfs = selected + " 1.以个人财产出资   "  + checkBox + " 2.以家庭共有财产作为个人出资。";
		}else if("2".equals(jbxx.getSCONFORM())){
			grczfs = checkBox + " 1.以个人财产出资   "  + selected + " 2.以家庭共有财产作为个人出资。";
		}
		//设置设立方式
		String insform;
		if("01".equals(jbxx.getINSFORM())){
			insform = selected + "发起设立" + "  " + checkBox + "募集设立";
		}else if("07".equals(jbxx.getINSFORM())){
			insform = checkBox + "发起设立" + "  " + selected + "募集设立";
		}else{
			insform = checkBox + "发起设立" + "  " + checkBox + "募集设立";
		}
		jbxxMap.put("insform", insform);
		//设置核算方式
		String calculationmethod;
		if("1".equals(jbxx.getCALCULATIONMETHOD())){
			calculationmethod = selected + " 独立核算       " + checkBox + " 非独立核算 ";
		}else if("2".equals(jbxx.getCALCULATIONMETHOD())){
			calculationmethod = checkBox + " 独立核算       " + selected + " 非独立核算 ";
		}else{
			calculationmethod = checkBox + " 独立核算       " + checkBox + " 非独立核算 ";
		}
		jbxxMap.put("calculationmethod", calculationmethod);
		
		jbxxMap.put("busscope", jbxx.getBUSSCOPE());
		//设置营业期限
		String opfyears;
		String yyqx=(String)jbxx.doPreProcess(jbxx.getOPDATETO());
		if("长期".equals(yyqx)||"".equals(yyqx)){
			opfyears = checkBox + "__年  " + selected + "长期"; 
		}else{
			opfyears = selected + yyqx + " 年   " + checkBox + "长期";
		}
		jbxxMap.put("opfyears", opfyears);
		
		jbxxMap.put("conum", String.valueOf(jbxx.getCOPYNUM()));
		jbxxMap.put("country", getDmdzByTypeAndCode("COUNTRY", jbxx.getCOUNTRY(), "1"));
		jbxxMap.put("congro", String.valueOf(jbxx.getCONGRO()));
		jbxxMap.put("congrocur", getDmdzByTypeAndCode("CURRENCY", jbxx.getCONGROCUR(), "1"));
		jbxxMap.put("congrousd", String.valueOf(jbxx.getCONGROUSD()));
		jbxxMap.put("exaauth", jbxx.getEXAAUTH());
		jbxxMap.put("sandate", jbxx.getSANDATE());
		jbxxMap.put("itemofoporcpro", jbxx.getITEMOFOPORCPRO());
		jbxxMap.put("forentname", jbxx.getFORENTNAME());
		jbxxMap.put("forentadd", jbxx.getFORENTADD());
		jbxxMap.put("forentscope", jbxx.getFORENTSCOPE());
		jbxxMap.put("regorg", getDmdzByTypeAndCode("REGORG", jbxx.getREGORG(), "1"));
		jbxxMap.put("sandocno", jbxx.getSANDOCNO());
		jbxxMap.put("forentforname",jbxx.getFORENTFORNAME());
		jbxxMap.put("cxqx", "自   " + jbxx.getFORENTOPFROM() + "  至     " + jbxx.getFORENTOPTO());
		jbxxMap.put("forentautsign", jbxx.getFORENTAUTSIGN());
		//企业责任形式
		String forenliafor = "";
		if("1".equals(jbxx.getFORENLIAFOR())){
			forenliafor = checkBox + " 有限责任   " + selected + " 无限责任";
		}else if("2".equals(jbxx.getFORENLIAFOR())){
			forenliafor = selected + " 有限责任   " + checkBox + " 无限责任";
		}else{
			forenliafor = checkBox + " 有限责任   " + checkBox + " 无限责任";
		}
		jbxxMap.put("forenliafor", forenliafor);
		jbxxMap.put("forentcap", jbxx.getFORENTCAP() + "万美元");
		jbxxMap.put("forentscope", jbxx.getFORENTSCOPE());
		
		map.put("jbxxMap", jbxxMap);
		
		//设置法定代表人
		Map<String,String> lerepMap = new HashMap<String,String>();
		lerepMap.put("name", lerep.getNAME());
		lerepMap.put("tel", lerep.getTEL());
		lerepMap.put("mobile", lerep.getMOBTEL());
		lerepMap.put("email", lerep.getEMAIL());
		lerepMap.put("certype", getDmdzByTypeAndCode("CERTYPE", lerep.getCERTYPE(), "1"));
		lerepMap.put("cerno", lerep.getCERNO());
		lerepMap.put("occstbeapp", lerep.getOCCSTBEAPP());
		lerepMap.put("sex", getDmdzByTypeAndCode("SEX", lerep.getSEX(), "1"));
		lerepMap.put("natdate", lerep.getNATDATE());
		lerepMap.put("nation", getDmdzByTypeAndCode("NATION", lerep.getNATION(), "1"));
		lerepMap.put("litedeg", getDmdzByTypeAndCode("LITEDEG", lerep.getLITEDEG(), "1"));
		lerepMap.put("polstand", getDmdzByTypeAndCode("POLSTAND", lerep.getPOLSTAND(), "1"));
		lerepMap.put("houseadd", lerep.getHOUSEADD());
		lerepMap.put("country", getDmdzByTypeAndCode("COUNTRY", lerep.getCOUNTRY(), "1"));
		lerepMap.put("entname", jbxx.getENTNAME());
		lerepMap.put("arrchdate", lerep.getARRCHDATE());
		lerepMap.put("houaddinchina", lerep.getHOUADDINCHINA());
		lerepMap.put("repdate", "自    " + lerep.getREPCARFROM() + "  至      " + lerep.getREPCARTO());
		lerepMap.put("position", getDmdzByTypeAndCode("POSITION", lerep.getPOSITION(), "1"));
		
		map.put("lerepMap", lerepMap);
		
		//设置董监事经理信息
		List ryxxList = new ArrayList();
		if(ryxxs!=null&&!ryxxs.isEmpty()){
			for(int i=0;i<ryxxs.size();i++){
				Map<String,String> rys = new HashMap<String,String>();
				QYDJ_RYXX_SQ rysq = ryxxs.get(i);
				rys.put("name",rysq.getNAME());
				rys.put("position",getDmdzByTypeAndCode("POSITION", rysq.getPOSITION(), "1"));
				rys.put("certype",getDmdzByTypeAndCode("CERTYPE", rysq.getCERTYPE(), "1"));
				rys.put("cerno",rysq.getCERNO());
				rys.put("country", getDmdzByTypeAndCode("COUNTRY", rysq.getCOUNTRY(), "1"));
				rys.put("posbrform", getDmdzByTypeAndCode("POSBRFORM", rysq.getPOSBRFORM(), "1"));
				ryxxList.add(rys);
			}
		}
		map.put("ryxxList", ryxxList);
		
		//设置股东信息
		List czxxList = new ArrayList();
		if(czxxs!=null&&!czxxs.isEmpty()){
			for(int i=0;i<czxxs.size();i++){
				List<String> rys = new ArrayList<String>();
				QYDJ_CZXX_SQ czsq = czxxs.get(i);
				if("GS".equals(opetype)){
					rys.add(czsq.getINV());
					String invtype = czsq.getINVTYPE();
					if("20".equals(invtype)|| "21".equals(invtype) || "22".equals(invtype) || "35".equals(invtype)||"36".equals(invtype)){
						rys.add(getDmdzByTypeAndCode("CERTYPE", czsq.getCERTYPE(), "1"));
						rys.add(czsq.getCERNO());
					}else{
						rys.add(getDmdzByTypeAndCode("BLICTYPE", czsq.getBLICTYPE(), "1"));
						rys.add(czsq.getBLICNO());
					}
					rys.add(czsq.getCONDATE());
					rys.add(getDmdzByTypeAndCode("CONFORM", czsq.getCONFORM(), "1"));
					rys.add(String.valueOf(czsq.getSUBCONAM()));
					rys.add(String.valueOf(czsq.getSUBCONPROP()));
					czxxList.add(rys);
				}else if("HHQY".equals(opetype)){
					rys.add(czsq.getINV());
					rys.add(czsq.getDOM());
					String typeAndCerno = "";
					if("20".equals(czsq.getINVTYPE())||"21".equals(czsq.getINVTYPE())||"22".equals(czsq.getINVTYPE())||"35".equals(czsq.getINVTYPE())||"36".equals(czsq.getINVTYPE())){
						typeAndCerno = getDmdzByTypeAndCode("CERTYPE", czsq.getCERTYPE(), "1") + "  " + czsq.getCERNO();
					}else{
						typeAndCerno = getDmdzByTypeAndCode("BLICTYPE", czsq.getBLICTYPE(), "1") + "  " + czsq.getBLICNO();
					}
					rys.add(typeAndCerno);
					rys.add(getDmdzByTypeAndCode("ONDUTYSTY", czsq.getONDUTYSTY(), "1"));
					rys.add(getDmdzByTypeAndCode("CONFORM", czsq.getCONFORM(), "1"));
					rys.add(getDmdzByTypeAndCode("EVALSTY", czsq.getEVALSTY(), "1"));
					rys.add(String.valueOf(czsq.getSUBCONAM()));
					rys.add(String.valueOf(czsq.getACCONAM()));
					rys.add(czsq.getBALDELTERM());
					czxxList.add(rys);
				}else if("WZGS".equals(opetype)||"WZHH".equals(opetype)){
					rys.add(czsq.getINV());
					rys.add(getDmdzByTypeAndCode("COUNTRY", czsq.getCOUNTRY(), "1"));
					String invtype = czsq.getINVTYPE();
					if("20".equals(invtype)|| "21".equals(invtype) || "22".equals(invtype) || "35".equals(invtype)||"36".equals(invtype)){
						rys.add(getDmdzByTypeAndCode("CERTYPE", czsq.getCERTYPE(), "1"));
						rys.add(czsq.getCERNO());
					}else{
						rys.add(getDmdzByTypeAndCode("BLICTYPE", czsq.getBLICTYPE(), "1"));
						rys.add(czsq.getBLICNO());
					}
					if("WZHH".equals(opetype)){
						rys.add(getDmdzByTypeAndCode("ONDUTYSTY", czsq.getONDUTYSTY(), "1"));
					}
					rys.add(czsq.getCONDATE());
					rys.add(getDmdzByTypeAndCode("CONFORM", czsq.getCONFORM(), "1"));
					rys.add(String.valueOf(czsq.getSUBCONAM()));
					rys.add(String.valueOf(czsq.getSUBCONPROP()));
					czxxList.add(rys);
				}else if("HZS".equals(opetype)){
					rys.add(String.valueOf(i+1));
					rys.add(czsq.getINV());
					rys.add(getDmdzByTypeAndCode("CONFORM", czsq.getCONFORM(), "1"));
					rys.add(String.valueOf(czsq.getSUBCONAM()));
					rys.add(" ");
					czxxList.add(rys);
				}
			}
		}
		map.put("czxxList", czxxList);
		
		//设置合作社成员名录
		List hzsList = new ArrayList();
		if(czxxs!=null&&!czxxs.isEmpty()){
			for(int i=0;i<czxxs.size();i++){
				List<String> rys = new ArrayList<String>();
				QYDJ_CZXX_SQ czsq = czxxs.get(i);
				rys.add(String.valueOf(i+1));
				rys.add(czsq.getINV());
				String typeAndCerno = "";
				if("20".equals(czsq.getINVTYPE())||"21".equals(czsq.getINVTYPE())||"22".equals(czsq.getINVTYPE())||"35".equals(czsq.getINVTYPE())||"36".equals(czsq.getINVTYPE())){
					typeAndCerno = getDmdzByTypeAndCode("CERTYPE", czsq.getCERTYPE(), "1") + "  " + czsq.getCERNO();
				}else{
					typeAndCerno = getDmdzByTypeAndCode("BLICTYPE", czsq.getBLICTYPE(), "1") + "  " + czsq.getBLICNO();
				}
				rys.add(typeAndCerno);
				rys.add(czsq.getDOM());
				rys.add(getDmdzByTypeAndCode("MEMTYPE", czsq.getMEMTYPE(), "1"));
				hzsList.add(rys);
			}
		}
		map.put("hzsList", hzsList);
		
		map.put("cyzs", jbxx.getMEMNUM());
		map.put("nmcy", jbxx.getPEAMEMNUM());
		map.put("nmcyrate", jbxx.getPEAMEMRATE());
		map.put("frcy", jbxx.getGROMEMNUM());
		map.put("frcyrate", jbxx.getGROMEMRATE());
		map.put("regcap", jbxx.getREGCAP());
		
		//设置财务负责人
		Map<String,String> cwfzrMap = new HashMap<String,String>();
		cwfzrMap.put("name", cwfzr.getNAME());
		cwfzrMap.put("tel", cwfzr.getTEL());
		cwfzrMap.put("mobile", cwfzr.getMOBTEL());
		cwfzrMap.put("email", cwfzr.getEMAIL());
		cwfzrMap.put("certype", getDmdzByTypeAndCode("CERTYPE", cwfzr.getCERTYPE(), "1"));
		cwfzrMap.put("cerno", cwfzr.getCERNO());
		map.put("cwfzrMap", cwfzrMap);
		
		//设置联络员
		Map<String,String> llrMap = new HashMap<String,String>();
		llrMap.put("name", llr.getNAME());
		llrMap.put("tel", llr.getTEL());
		llrMap.put("mobile", llr.getMOBTEL());
		llrMap.put("email", llr.getEMAIL());
		llrMap.put("certype", getDmdzByTypeAndCode("CERTYPE", llr.getCERTYPE(), "1"));
		llrMap.put("cerno", llr.getCERNO());
		map.put("llrMap", llrMap);
		
		//设置委托人
		if(sqwts!=null&&!sqwts.isEmpty()){
			QYDJ_SQWT_SQ wtr = sqwts.get(0);
		    Map<String, String> wtrMap = new HashMap<String, String>();
			wtrMap.put("sqr", wtr.getAPPPER());
			wtrMap.put("wtr", wtr.getCONSIGNER());
			wtrMap.put("entname", jbxx.getENTNAME());
			String qx1,qx2,qx3,qx4;
			if("1".equals(wtr.getIFLICENSE1())){
				qx1 = "同意" + selected + " 不同意" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE1())){
				qx1 = "同意" + checkBox + " 不同意" + selected;
			}else{
				qx1 = "同意" + checkBox + " 不同意" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE2())){
				qx2 = "同意" + selected + " 不同意" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE2())){
				qx2 = "同意" + checkBox + " 不同意" + selected;
			}else{
				qx2 = "同意" + checkBox + " 不同意" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE3())){
				qx3 = "同意" + selected + " 不同意" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE3())){
				qx3 = "同意" + checkBox + " 不同意" + selected;
			}else{
				qx3 = "同意" + checkBox + " 不同意" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE4())){
				qx4 = "同意" + selected + " 不同意" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE4())){
				qx4 = "同意" + checkBox + " 不同意" + selected;
			}else{
				qx4 = "同意" + checkBox + " 不同意" + checkBox;
			}
			wtrMap.put("qx1", qx1);
			wtrMap.put("qx2", qx2);
			wtrMap.put("qx3", qx3);
			wtrMap.put("qx4", qx4);
			
			wtrMap.put("confrom", wtr.getCONFROM());
			wtrMap.put("conto",wtr.getCONTO());
			wtrMap.put("tel", wtr.getTEL());
			wtrMap.put("mobile", wtr.getMOBTEL());
			wtrMap.put("condate", wtr.getCONDATE());
			
			wtrMap.put("unit", wtr.getUNIT());
			wtrMap.put("postalcode", wtr.getPOSTALCODE());
			
			map.put("wtrMap", wtrMap);
		}
		
		//设置文件送达书
		if(wjsds!=null&&wjsds.size()>0){
			QYDJ_WZWJSD_SQ wzwj = wjsds.get(0);
			Map<String,String> sdMap = new HashMap<String,String>();
			sdMap.put("name", wzwj.getNAME());
			sdMap.put("addr", wzwj.getADDR());
			sdMap.put("postalcode", wzwj.getPOSTALCODE());
			sdMap.put("linkman", wzwj.getLINKMAN());
			sdMap.put("email", wzwj.getEMAIL());
			sdMap.put("tel", wzwj.getTEL());
			sdMap.put("mobtel", wzwj.getMOBTEL());
			map.put("sdMap", sdMap);
		}
		
		//设置个体户信息
		Map<String, String> gtMap = new HashMap<String, String>();
		gtMap.put("traname", gtxx.getTRANAME());
		gtMap.put("sex", getDmdzByTypeAndCode("SEX", jyzxx.getSEX(), "1"));
		gtMap.put("name", jyzxx.getNAME());
		gtMap.put("cerno", jyzxx.getCERNO());
		gtMap.put("dom", jyzxx.getDOM());
		gtMap.put("postalcode", jyzxx.getPOSTALCODE());
		gtMap.put("tel", jyzxx.getTEL());
		gtMap.put("email", jyzxx.getEMAIL());
		gtMap.put("polstand", getDmdzByTypeAndCode("POLSTAND", jyzxx.getPOLSTAND(), "1"));
		gtMap.put("nation", getDmdzByTypeAndCode("NATION", jyzxx.getNATION(), "1"));
		gtMap.put("litedeg", getDmdzByTypeAndCode("LITEDEG", jyzxx.getLITEDEG(), "1"));
		gtMap.put("occstbeapp", jyzxx.getOCCSTBEAPP());
		//设置个人经营
		String grjy = "个人经营";
		if("1".equals(gtxx.getCOMPFORM())){
			grjy += selected;
		}else{
			grjy += checkBox;
		}
		gtMap.put("grjy", grjy);
		//设置家庭经营
		String jtjy = "家庭经营";
		if("2".equals(gtxx.getCOMPFORM())){
			jtjy += selected;
		}else{
			jtjy += checkBox;
		}
		gtMap.put("jtjy", jtjy);
		
		gtMap.put("fammember", gtxx.getFAMMEMBER());
		gtMap.put("busscoandform", gtxx.getBUSSCOANDFORM());
		gtMap.put("oploc", gtxx.getOPLOC());
		gtMap.put("empnum", gtxx.getEMPNUM() + "人");
		gtMap.put("capam", gtxx.getCAPAM() + "万元");
		
		map.put("gtMap", gtMap);
		
		
		//设置保存路径
		String enttype = jbxx.getENTTYPE();
		
		String sqsPath = PropertiesConfigUtil.getValue("SQS_PATH") + "/" + opetype + "/";
		String fileName = "gssqs_"+openo + ".pdf";
		
		createPdfByData(fileName, sqsPath, map);
		
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
		PDFCreator creator = new PDFCreator();
		System.out.println(creator.getPdfUrlAndCreatePdf("37020221607260001"));
	}
	
	
}
