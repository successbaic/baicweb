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
        	//����PDF���·��
            File file = new File(path);  
            if (!file.exists()) {  
                file.mkdirs();  
            }  
            PdfWriter.getInstance(document, new FileOutputStream(path + fileName));  
  
            //��ʼ�༭PDF����
            document.open();  

            //����������������ʽ
            BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);  
            Font titleChinese = new Font(bfChinese, 30, Font.BOLD);
            //����table�ڵ��ı���ʽ
            Font contentFont = new Font(bfChinese, 16, Font.NORMAL);
          //����table�ڵı�����ʽ
            Font tblTitleFont = new Font(bfChinese, 16, Font.BOLD);
            //���ø�PDF�ı���
            Paragraph title = new Paragraph((String)dataMap.get("title"),titleChinese);
            title.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(title);
            
            Paragraph attionTitle = new Paragraph("ע������ϸ�Ķ��������顶��д˵��������Ҫ����д��",contentFont);
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
                
                Cell cell = new Cell(new Phrase("�� ��",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("traname"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell =  new Cell(new Phrase("��Ӫ��",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setRowspan(7);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("name"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("�Ա�",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("sex"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("���֤����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("cerno"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("ס��",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("dom"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��������",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("postalcode"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��ϵ�绰",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("tel"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��������",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("email"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(3);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("������ò",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("polstand"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("nation"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("�Ļ��̶�",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("litedeg"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("ְҵ״��",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("occstbeapp"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("�����ʽ",contentFont));
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
                cell = new Cell(new Phrase("�μӾ�Ӫ�ļ�ͥ��Ա���������֤����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("fammember"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(2);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��Ӫ��Χ",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("busscoandform"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��Ӫ����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("oploc"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(4);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("��ҵ��Ա",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("empnum"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase("�ʽ�����",contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                gtxxtable.addCell(cell);
                cell = new Cell(new Phrase(gtMap==null?"":gtMap.get("capam"),contentFont));
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                cell.setColspan(2);
                gtxxtable.addCell(cell);
                
                Paragraph p1 = new Paragraph("\n    �������ա����幤�̻�����������Ǽ�Ϊ���幤�̻����ύ�ļ�������ʵ��Ч��������ʵ�Գе����Ρ�",contentFont);
                Paragraph p2 = new Paragraph("��Ӫ��ǩ���� ",contentFont);
                p2.setIndentationLeft(500);
                Paragraph p3 = new Paragraph("��          ��              �� ",contentFont);
                p3.setIndentationLeft(500);
                cell = new Cell();
                cell.add(p1);
                cell.add(p2);
                cell.add(p3);
                cell.setColspan(5);
                gtxxtable.addCell(cell);
                
                document.add(gtxxtable);
                
                Paragraph wtitle = new Paragraph("\nί�д�����֤��",titleChinese);
                wtitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(wtitle);
                
                Map<String, String> wtrMap = (Map<String, String>)dataMap.get("wtrMap");
                Paragraph wtr = new Paragraph("\nί�������� :" + (wtrMap==null?"":wtrMap.get("sqr")),contentFont);
                document.add(wtr);
                wtr = new Paragraph("ί�д��������� ��" + (wtrMap==null?"":wtrMap.get("wtr")),contentFont);
                document.add(wtr);
                wtr = new Paragraph("ί�д���Ȩ�ޣ�  \n",contentFont);
                document.add(wtr);
                wtr = new Paragraph("1. " + (wtrMap==null?"ͬ��� ��ͬ���":wtrMap.get("qx1")) +  " �˶ԵǼǲ����еĸ�ӡ����ǩ��˶������ ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("2. " + (wtrMap==null?"ͬ��� ��ͬ���":wtrMap.get("qx2")) +  " �޸��йر�����д���� ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("3. " + (wtrMap==null?"ͬ��� ��ͬ���":wtrMap.get("qx3")) +  " ��ȡ����֪ͨ�飻 ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                wtr = new Paragraph("4. " + (wtrMap==null?"ͬ��� ��ͬ���":wtrMap.get("qx4")) +  " ��ȡ���幤�̻�Ӫҵִ�ա� ",contentFont);
                wtr.setIndentationLeft(100);
                document.add(wtr);
                
                wtr = new Paragraph("\nί����Ч���ޣ���   " + (wtrMap==null?"":wtrMap.get("confrom")) + "  ��       " + (wtrMap==null?"":wtrMap.get("conto")) + "\n",contentFont);
                document.add(wtr);
                
                Table t = new Table(4);
                int twidths[] = {20,30,20,30};  
                t.setWidths(twidths);  
                t.setWidth(100);  
                t.setPadding(3);  
                t.setBorderWidth(1);
                t.setAlignment(Cell.ALIGN_CENTER);
                
                Cell tCell = new Cell(new Phrase("ί�д�����ס��",contentFont));
                tCell.setColspan(2);
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("unit"),contentFont));
                tCell.setColspan(2);
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase("��������",contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("postalcode"),contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase("��ϵ�绰",contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                tCell = new Cell(new Phrase(wtrMap==null?"":wtrMap.get("tel"),contentFont));
                tCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                t.addCell(tCell);
                document.add(t);
                
                Paragraph pp = new Paragraph("\nί����ǩ����",contentFont);
                document.add(pp);
                pp = new Paragraph("��            ��                   ��                                      ",contentFont);
                pp.setAlignment(Paragraph.ALIGN_RIGHT);
                document.add(pp);
                
            }else{
            	//���û�����Ϣ��������Ϣ�������������������������������
                //������Ϣ������
            	Table jbxxtable = new Table(4); 
                int jbxxwidths[] = {20,30,20,30};  
                jbxxtable.setWidths(jbxxwidths);  
                jbxxtable.setWidth(100);  
                jbxxtable.setPadding(3);  
                jbxxtable.setBorderWidth(1);
                jbxxtable.setAlignment(Cell.ALIGN_CENTER);
                
                //������Ϣ
                Cell jbxxTitle = new Cell(new Phrase("�̻�����Ϣ",tblTitleFont));
                jbxxTitle.setColspan(4);
                jbxxTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTitle);
                
                Map<String, String> jbxxMap = (Map<String, String>)dataMap.get("jbxxMap");
                
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"HHQY".equals(opetype)||"GRDZ".equals(opetype)||"WZGS".equals(opetype)||"WZHH".equals(opetype)||"HZS".equals(opetype)||"HZSFZ".equals(opetype)){
                	 Cell jbxxName = new Cell(new Phrase("�� ��",contentFont));
                     jbxxName.setHorizontalAlignment(Element.ALIGN_CENTER);
                     jbxxtable.addCell(jbxxName);
                     
                     Cell jbxxNameValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                     jbxxNameValue.setColspan(3);
                     jbxxtable.addCell(jbxxNameValue);
                     
                     Cell jbxxRegno = new Cell(new Phrase("����Ԥ�Ⱥ�׼�ĺ�ע���/\nͳһ������ô���",contentFont));
                     jbxxRegno.setHorizontalAlignment(Element.ALIGN_CENTER);
                     jbxxtable.addCell(jbxxRegno);
                     if("WZGS".equals(opetype)){
                    	 Cell jbxxRegnoValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                    	 jbxxtable.addCell(jbxxRegnoValue);
                    	 Cell gbc = new Cell(new Phrase("���𣨵�����",contentFont));
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
                	String lsdw = "��˾����";
                	if("NZYY".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                		lsdw = "������λ����ҵ��";
                	}
                	Cell cell = null;
                	if(!"HHFZ".equals(opetype)&&!"GRDZFZ".equals(opetype)){
                		cell = new Cell(new Phrase(lsdw,contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(cell);
                        cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("supentname"),contentFont));
                        jbxxtable.addCell(cell);
                        
                        cell = new Cell(new Phrase("ע���/ͳһ������ô���",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(cell);
                        cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("supregno"),contentFont));
                        jbxxtable.addCell(cell);
                	}
                    
                    String fgsname = "�ֹ�˾����";
                    if("NZYY".equals(opetype)){
                    	fgsname = "Ӫҵ��λ����";
                    }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	fgsname = "��֧��������";
                    }
                    cell = new Cell(new Phrase(fgsname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(cell);
                    cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                    jbxxtable.addCell(cell);
                    
                    String regname = "�ֹ�˾����Ԥ�Ⱥ�׼�ĺ�/ע���/ͳһ������ô���";
                    if("NZYY".equals(opetype)){
                    	regname = "Ӫҵ��λ����Ԥ�Ⱥ�׼�ĺ�/ע���/ͳһ������ô���";
                    }else if("NZYY".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)){
                    	regname = "��֧��������Ԥ�Ⱥ�׼�ĺ�/ע���/ͳһ������ô���";
                    }
                    cell = new Cell(new Phrase(regname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(cell);
                    cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                    jbxxtable.addCell(cell);
                }
                if("WGJY".equals(opetype)){
                	Cell cell = new Cell(new Phrase("�� ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("����Ԥ�Ⱥ�׼�ĺ�ע���/ͳһ������ô���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�� ַ��Ӫҵ������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WGDB".equals(opetype)){
                	Cell cell = new Cell(new Phrase("�����������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("entname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�Ǽ�֤ע���/ͳһ������ô���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("פ�ڳ���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else{
                	String domname = "ס��";
                    if("FGS".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	domname = "Ӫҵ����";
                    }else if("GRDZ".equals(opetype)){
                    	domname = "��ҵס��";
                    }else if("GRDZFZ".equals(opetype)||"HHFZ".equals(opetype)||"HZSFZ".equals(opetype)){
                    	domname = "��Ӫ����";
                    }else if("WZHH".equals(opetype)||"HHQY".equals(opetype)){
                    	domname = "��Ҫ��Ӫ����";
                    }
                    Cell jbxxDom = new Cell(new Phrase(domname,contentFont));
                    jbxxDom.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxDom);
                    
                    Cell jbxxDomValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("dom"),contentFont));
                    jbxxDomValue.setColspan(3);
                    jbxxtable.addCell(jbxxDomValue);
                    
                    Cell jbxxOploc = new Cell(new Phrase("������Ӫ��",contentFont));
                    jbxxOploc.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOploc);
                    
                    Cell jbxxOplocValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("oploc"),contentFont));
                    jbxxOplocValue.setColspan(3);
                    jbxxtable.addCell(jbxxOplocValue);
                }
                
                Cell jbxxTel = new Cell(new Phrase("��ϵ�绰",contentFont));
                jbxxTel.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTel);
                
                Cell jbxxTelValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                jbxxTelValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxTelValue);
                
                Cell jbxxEmail = new Cell(new Phrase("��������",contentFont));
                jbxxEmail.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxEmail);
                
                Cell jbxxEmailValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("postalcode"),contentFont));
                jbxxEmailValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(jbxxEmailValue);
                
                //����
                String slname = "������ ";
                if("NZFR".equals(opetype)||"NZYY".equals(opetype)||"WGJY".equals(opetype)){
                	slname = "�̿�ҵ";
                }
                Cell slTitle = new Cell(new Phrase(slname,tblTitleFont));
                slTitle.setColspan(4);
                slTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                jbxxtable.addCell(slTitle);
                
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"WZGS".equals(opetype)){
                	Cell jbxxLerep = new Cell(new Phrase("��������������",contentFont));
                    jbxxLerep.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxLerep);
                    
                    Cell jbxxLerepValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    jbxxLerepValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxLerepValue);
                    
                    if("WZGS".equals(opetype)){
                    	Cell cell = new Cell(new Phrase("���𣨵�����",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("ְ��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("position"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("Ͷ���ܶ��Ԫ��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congro"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("����",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congrocur"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("����Ԫ����Ԫ��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("congrousd"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("ע���ʱ�����Ԫ��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��˾����",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("������ʽ���ɷݹ�˾��д��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("insform"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                    }else{
                    	Cell jbxxPosition = new Cell(new Phrase("ְ ��",contentFont));
                        jbxxPosition.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxPosition);
                        
                        Cell jbxxPositionValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("position"),contentFont));
                        jbxxPositionValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxPositionValue);
                        
                        String regcapname = "ע���ʱ�";
                        if("NZFR".equals(opetype)){
                        	regcapname = "ע���ʽ�";
                        }
                        Cell jbxxRegcap = new Cell(new Phrase(regcapname,contentFont));
                        jbxxRegcap.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxRegcap);
                        
                        Cell jbxxRegcapValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                        jbxxRegcapValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxRegcapValue);
                        
                        String enttypename = "��˾����";
                        if("NZFR".equals(opetype)){
                        	enttypename = "��������";
                        }
                        Cell jbxxEnttype = new Cell(new Phrase(enttypename,contentFont));
                        jbxxEnttype.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxEnttype);
                        
                        Cell jbxxEnttypeValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                        jbxxEnttypeValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxEnttypeValue);
                    }
                    
                    if("GS".equals(opetype)){
                    	Cell jbxxInsform = new Cell(new Phrase("������ʽ\n���ɷݹ�˾��д��",contentFont));
                        jbxxInsform.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxInsform);
                        
                        Cell jbxxInsformValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("insform"),contentFont));
                        jbxxInsformValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxInsformValue.setColspan(3);
                        jbxxtable.addCell(jbxxInsformValue);
                        
                        Cell jbxxBusscope = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                        jbxxBusscope.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxtable.addCell(jbxxBusscope);
                        
                        Cell jbxxBusscopeValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                        jbxxBusscopeValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                        jbxxBusscopeValue.setColspan(3);
                        jbxxtable.addCell(jbxxBusscopeValue);
                    }
                    
                    Cell jbxxOpfyears = new Cell(new Phrase("Ӫҵ����",contentFont));
                    jbxxOpfyears.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOpfyears);
                    
                    Cell jbxxOpfyearsValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("opfyears"),contentFont));
                    jbxxOpfyearsValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxOpfyearsValue);
                    
                    Cell jbxxConum = new Cell(new Phrase("���븱������",contentFont));
                    jbxxConum.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxConum);
                    
                    Cell jbxxConumValue = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                    jbxxConumValue.setHorizontalAlignment(Element.ALIGN_CENTER);
                    jbxxtable.addCell(jbxxConumValue);
                    
                    if("NZFR".equals(opetype)){
                    	Cell jbxxBusscope = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
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
                		cell = new Cell(new Phrase("����������",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("�����˾���",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("houseadd"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("���������֤��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("cerno"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��ҵ����",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empno"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��ϵ�绰",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��������",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("postalcode"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase("��Ӫ���ޣ����ϻ���ҵ��д��",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(3);
                    	jbxxtable.addCell(cell);
                	}else{
                		cell = new Cell(new Phrase("������",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                    	jbxxtable.addCell(cell);
                    	if("NZYY".equals(opetype)){
                    		cell = new Cell(new Phrase("��ϵ�绰",contentFont));
                        	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("tel"),contentFont));
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase("�ʽ�����",contentFont));
                        	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	jbxxtable.addCell(cell);
                        	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                        	jbxxtable.addCell(cell);
                    	}
                    	cell = new Cell(new Phrase("����ִ�ո�������",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	jbxxtable.addCell(cell);
                    	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                    	jbxxtable.addCell(cell);
                	}
                	
                	String bussname = "��Ӫ��Χ";
                	if("FGS".equals(opetype)){
                		bussname = "�ֹ�˾��Ӫ��Χ";
                	}else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                		bussname = "��֧������Ӫ��Χ";
                	}
                	cell = new Cell(new Phrase(bussname,contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	
                	cell = new Cell(new Phrase("���㷽ʽ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("calculationmethod"),contentFont));
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("HHQY".equals(opetype)){
                	Cell hhcell = new Cell(new Phrase("ִ������ϻ���",contentFont));
                	hhcell.setRowspan(2);
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("����������",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(2);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("ί�ɴ�������ִ������ϻ���Ϊ���˻�������֯ʱ��д��",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(2);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("�ϻ���ҵ����",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("hhlx"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("���ʶ��Ԫ��",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("hhcze"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("Ӫҵ����",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(" ��_________��_______��_______�յ�_________��_______��_______��",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("�ϻ�����",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("parnum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("���У����޺ϻ��������������޺ϻ���д��",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("exenum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase("��ҵ����",contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(hhcell);
                	hhcell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empnum"),contentFont));
                	hhcell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	hhcell.setColspan(3);
                	jbxxtable.addCell(hhcell);
                }else if("GRDZ".equals(opetype)){
                	Cell cell = new Cell(new Phrase("���ʶ�",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��ҵ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("empnum"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("���ʷ�ʽ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("grczfs"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WZHH".equals(opetype)){
                	Cell cell = new Cell(new Phrase("ִ������ϻ��˻�ί�ɴ���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�� �𣨵� ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�Ͻɳ��ʶ��Ԫ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("ʵ�ɳ��ʶ��Ԫ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("reccap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcapcur"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��ҵ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�ϻ�����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("opfyears"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("����ִ�ո�������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("conum"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                }else if("WGJY".equals(opetype)){
                	Cell cell = new Cell(new Phrase("��ҵ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("enttype"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("���ܲ���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("depincha"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("exaauth"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��׼����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandate"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("���й����ھ�Ӫ��Χ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�ʽ������Ԫ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcapcur"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("Ӫҵ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("�а����̻�Ӫ������Ŀ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("itemofoporcpro"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("�������������ҵ����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("�������������ҵ����ס��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentadd"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	cell = new Cell(new Phrase("�������������ҵ��Ӫ��Χ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("WGDB".equals(opetype)){
                	Cell cell = new Cell(new Phrase("��ϯ��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("ҵ��Χ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("פ������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��׼������������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regorg"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��׼פ������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("yysj"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��׼����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandate"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��׼�ĺ�",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("sandocno"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	
                	cell = new Cell(new Phrase("�������������ҵ���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(4);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentforname"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("ס ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentadd"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("cxqx"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��Ȩǩ��������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentautsign"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��ҵ������ʽ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forenliafor"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("�ʱ����ʲ���",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("���𣨵�����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("country"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��Ӫ��Χ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("forentscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }else if("HZS".equals(opetype)){
                	Cell cell = new Cell(new Phrase("����������",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("lerep"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��Ա�����ܶԪ��",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("regcap"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                	Paragraph p1 = new Paragraph("��Ա������    " + dataMap.get("cyzs") + "     ������",contentFont);
                	Paragraph p2 = new Paragraph("���У�ũ���Ա    " + dataMap.get("nmcy") + "     ������ ��ռ����    " + dataMap.get("nmcyrate") +"   %",contentFont);
                	p2.setIndentationLeft(60);
                	Paragraph p3 = new Paragraph("��ҵ����ҵ��λ����������Ա��     " + dataMap.get("frcy") +"    ������ ��ռ����     " + dataMap.get("frcyrate") + "   %",contentFont);
                	p3.setIndentationLeft(120);
                	
                	cell = new Cell();
                	cell.add(p1);
                	cell.add(p2);
                	cell.add(p3);
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(4);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase("��\nӪ\n��\nΧ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	jbxxtable.addCell(cell);
                	cell = new Cell(new Phrase(jbxxMap==null?"":jbxxMap.get("busscope"),contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(3);
                	jbxxtable.addCell(cell);
                }
                
                document.add(jbxxtable);
                
                //���������������������
                //����TABLE��ʽ
                Table remarktable = new Table(6); 
                int remarkwidths[] = { 15,10,20,15,20,20};  
                remarktable.setWidths(remarkwidths);  
                remarktable.setWidth(100);  
                remarktable.setPadding(3);  
                remarktable.setBorderWidth(1);
                remarktable.setAlignment(Cell.ALIGN_CENTER);
                if("GS".equals(opetype)||"NZFR".equals(opetype)||"HHQY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZGS".equals(opetype)||"WZHH".equals(opetype)||"HZS".equals(opetype)){
                    Cell bgTitle = new Cell(new Phrase("�����",tblTitleFont));
                    bgTitle.setColspan(6);
                    bgTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bgTitle);
                    
                    Cell bg1 = new Cell(new Phrase("�����Ŀ",contentFont));
                    bg1.setColspan(2);
                    bg1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg1);
                    
                    Cell bg2 = new Cell(new Phrase("ԭ�Ǽ�����",contentFont));
                    bg2.setColspan(2);
                    bg2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg2);
                    
                    Cell bg3 = new Cell(new Phrase("��������",contentFont));
                    bg3.setColspan(2);
                    bg3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(bg3);
                    
                    for(int i=0;i<5;i++){
                    	Cell bg11 = new Cell("����֧�Ÿ߶�");
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
                    	Cell baTitle = new Cell(new Phrase("������ ",tblTitleFont));
                        baTitle.setColspan(6);
                        baTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(baTitle);
                        
                        Cell fgsCell = new Cell(new Phrase("�ֹ�˾\n�������ע��",contentFont));
                        fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        fgsCell.setRowspan(2);
                        remarktable.addCell(fgsCell);
                        
                        Cell nameCell = new Cell(new Phrase("����",contentFont));
                        nameCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(nameCell);
                        
                        Cell nameValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(nameValueCell);
                        
                        Cell regnoCell = new Cell(new Phrase("ע���/ͳһ������ô���",contentFont));
                        regnoCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        regnoCell.setColspan(2);
                        remarktable.addCell(regnoCell);
                        
                        Cell regnoValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(regnoValueCell);
                        
                        Cell djjgCell = new Cell(new Phrase("�Ǽǻ���",contentFont));
                        djjgCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(djjgCell);
                        
                        Cell djjgValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(djjgValueCell);
                        
                        Cell djrqCell = new Cell(new Phrase("�Ǽ�����",contentFont));
                        djrqCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        djrqCell.setColspan(2);
                        remarktable.addCell(djrqCell);
                        
                        Cell djrqValueCell = new Cell(new Phrase("",contentFont));
                        remarktable.addCell(djrqValueCell);
                        
                        if("GRDZ".equals(opetype)){
                        	Cell qtc = new Cell(new Phrase("����",contentFont));
                        	qtc.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	remarktable.addCell(qtc);
                        	qtc = new Cell(new Phrase("����������   ������Ա  ",contentFont));
                        	qtc.setHorizontalAlignment(Element.ALIGN_CENTER);
                        	qtc.setColspan(5);
                        	remarktable.addCell(qtc);
                        }else{
                        	Cell qszCell = new Cell(new Phrase("������",contentFont));
                            qszCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qszCell.setRowspan(2);
                            remarktable.addCell(qszCell);
                            
                            Cell cyCell = new Cell(new Phrase("��Ա",contentFont));
                            cyCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(cyCell);
                            
                            Cell cyValueCell = new Cell(new Phrase("",contentFont));
                            cyValueCell.setColspan(4);
                            remarktable.addCell(cyValueCell);
                            
                            Cell fzrCell = new Cell(new Phrase("������",contentFont));
                            fzrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(fzrCell);
                            
                            Cell fzrValueCell = new Cell(new Phrase("",contentFont));
                            remarktable.addCell(fzrValueCell);
                            
                            Cell lxdhCell = new Cell(new Phrase("��ϵ�绰",contentFont));
                            lxdhCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            lxdhCell.setColspan(2);
                            remarktable.addCell(lxdhCell);
                            
                            Cell lxdhValueCell = new Cell(new Phrase("",contentFont));
                            remarktable.addCell(lxdhValueCell);
                        }
                        
                        if("GS".equals(opetype)||"WZGS".equals(opetype)){
                        	Cell qtCell = new Cell(new Phrase("����",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	Cell qtValueCell = new Cell(new Phrase("������   ������   ������   ���³�   ���³�������   ����������   ������Ա  ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                        }else if("HHQY".equals(opetype)){
                        	Cell qtCell = new Cell(new Phrase("�ϻ�Э��",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	Cell qtValueCell = new Cell(new Phrase("�����α���     ���漰��������   ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                            qtCell = new Cell(new Phrase("����",contentFont));
                            qtCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            remarktable.addCell(qtCell);
                        	qtValueCell = new Cell(new Phrase("������Ա     ����������    ",contentFont));
                            qtValueCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            qtValueCell.setColspan(5);
                            remarktable.addCell(qtValueCell);
                        }
                        
                    }else if("NZFR".equals(opetype)){
                    	Cell nzfrCell = new Cell(new Phrase("��֧����",contentFont));
                    	nzfrCell.setRowspan(2);
                    	nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("����",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("����",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("�Ǽǻ���",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("�Ǽ�����",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("  ",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("������  ���Ƿ���",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("�Ǽǻ���",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("������  ������",contentFont));
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("������ ",tblTitleFont));
                    	nzfrCell.setColspan(6);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(nzfrCell);
                        
                        nzfrCell = new Cell(new Phrase("���ܲ���\n�������ˣ�",contentFont));
                        nzfrCell.setRowspan(4);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("����",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("��������",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("�Ǽǻ���",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("֤�պ���",contentFont));
                        nzfrCell.setColspan(2);
                    	nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase(" ",contentFont));
                        nzfrCell.setColspan(3);
                    	remarktable.addCell(nzfrCell);
                    	
                    	nzfrCell = new Cell(new Phrase("�³�",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("���³�   ���³������� ",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        nzfrCell.setColspan(2);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("����",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	remarktable.addCell(nzfrCell);
                    	nzfrCell = new Cell(new Phrase("����������   ������Ա  ",contentFont));
                        nzfrCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        nzfrCell.setColspan(2);
                    	remarktable.addCell(nzfrCell);
                    }
                }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)||"WGDB".equals(opetype)||"HZSFZ".equals(opetype)){
                	 Cell fgsCell = new Cell(new Phrase("�����/����",tblTitleFont));
                	 fgsCell.setColspan(6);
                	 fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("���/������Ŀ",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("ԭ�Ǽ�/��������",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     fgsCell = new Cell(new Phrase("�������Ǽ�/��������",contentFont));
                     fgsCell.setColspan(2);
                     fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                     remarktable.addCell(fgsCell);
                     
                     for(int i=0;i<3;i++){
                    	 fgsCell = new Cell("����֧�Ÿ߶�");
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
                    	 fgsCell = new Cell(new Phrase("��ע�� ",tblTitleFont));
                         fgsCell.setColspan(6);
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                    	 fgsCell = new Cell(new Phrase("ע��ԭ��",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" �� 1���ֹ�˾����˾����;     �� 2���ֹ�˾����������ر�;\n �� 3���ֹ�˾������Ӫҵִ��; �� 4������ԭ��",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("��˰���",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("  �� ���������   �� δ�漰��˰����",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                     }else if("NZYY".equals(opetype)){
                    	 fgsCell = new Cell(new Phrase("��ע�� ",tblTitleFont));
                         fgsCell.setColspan(6);
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                    	 fgsCell = new Cell(new Phrase("ע��ԭ��",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" �� 1��������ҵ����Ъҵ;    �� 2��������λ��������;\n �� 3���� 3�����Ǽǻ���������������;�� 4������ԭ��",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("ծȨծ������",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("�����ܲ��Ż���������֯��������ծȨծ�� �� ծ��������� ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase("��˰���",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" �� ���������   �� δ�漰��˰���� ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                         
                         fgsCell = new Cell(new Phrase("�ɻع������",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                         remarktable.addCell(fgsCell);
                         fgsCell = new Cell(new Phrase(" �� �ѽɻ�        �� δ�ɻ� ",contentFont));
                         fgsCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                         fgsCell.setColspan(5);
                         remarktable.addCell(fgsCell);
                     }
                }
                
                if("HHFZ".equals(opetype)||"GRDZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	Cell cell = null;
                	cell = new Cell(new Phrase("��ע�� ",tblTitleFont));
                	cell.setColspan(6);
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    
                    cell = new Cell(new Phrase("ע��ԭ�� ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                    	cell = new Cell(new Phrase("�� 1.��֧�������ϼ���ҵ������      �� 2.��֧��������������رա�\n�� 3.��֧����������Ӫҵִ�ա�      �� 4.����ԭ�� ",contentFont));	
                    }else if("GRDZ".equals(opetype)){
                    	cell = new Cell(new Phrase("�� Ͷ���˾�����ɢ\n�� Ͷ�����������߱������������޼̳��˻��߼̳��˾��������̳�\n�� ����������Ӫҵִ��\n�� ���ɡ���������涨����������__________________ ",contentFont));
                    }
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(5);
                    remarktable.addCell(cell);
                    if("GRDZ".equals(opetype)){
                    	cell = new Cell(new Phrase("��֧����ע����� ",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                        remarktable.addCell(cell);
                        cell = new Cell(new Phrase(" ",contentFont));
                    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	cell.setColspan(5);
                        remarktable.addCell(cell);
                    }
                    cell = new Cell(new Phrase("��˰��� ",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    remarktable.addCell(cell);
                    cell = new Cell(new Phrase(" �� ���������   �� δ�漰��˰����",contentFont));
                	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                	cell.setColspan(5);
                    remarktable.addCell(cell);
                }
                
                //����������
                Cell sqrTitle = new Cell(new Phrase("������������",tblTitleFont));
                sqrTitle.setColspan(6);
                sqrTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
                remarktable.addCell(sqrTitle);
                
                String sqrtext = "";
                if("GS".equals(opetype)||"WZGS".equals(opetype)){
                	sqrtext = "\n      ����˾���ա���˾����������˾�Ǽǹ�����������ع涨����Ǽǡ��������ύ������ʵ��Ч�� ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("FGS".equals(opetype)){
                	sqrtext = "\n      ����˾���ա���˾����������˾�Ǽǹ�������������ع涨����ֹ�˾�Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("NZFR".equals(opetype)){
                	sqrtext = "\n      ����ҵ���ա���ҵ���˵Ǽǹ���������������ҵ���˵Ǽǹ�������ʩ��ϸ�򡷼���ع涨����Ǽǡ��������ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("NZYY".equals(opetype)){
                	sqrtext = "\n      ����ҵ���ա���ҵ���˵Ǽǹ���������������ҵ���˵Ǽǹ�������ʩ��ϸ�򡷼���ع涨����Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч�� \n";
                }else if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                	sqrtext = "\n      ����ҵ������ط��ɷ���涨����Ǽǡ��������ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	sqrtext = "\n      ����ҵ������ط��ɷ���涨�����֧�����Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("GRDZ".equals(opetype)){
                	sqrtext = "\n      ����ҵ������ط��ɷ���涨����Ǽǡ��������������ע�����ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("WGJY".equals(opetype)){
                	sqrtext = "\n      ����ҵ������ط��ɷ����йع涨���뿪ҵ�Ǽǣ��ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ҵ��ϢΪ����ҵ�ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }else if("WGDB".equals(opetype)){
                	sqrtext = "\n      ������������ط��ɷ���涨����Ǽǡ��������ύ������ʵ��Ч�� \n";
                }else if("HZS".equals(opetype)||"HZSFZ".equals(opetype)){
                	sqrtext = "\n      ������������Ǽǡ��������ύ������ʵ��Ч��ͨ������Ա��¼��ҵ������Ϣ��ʾϵͳ��Ǽǻ��ر��͡�����ṫʾ����ϢΪ�����ṩ����������Ϣ����Ϣ��ʵ����Ч��\n";
                }
                Paragraph sqrp = new Paragraph(sqrtext,contentFont);
                String fdbdrname = "����������ǩ�֣�";
                if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                	fdbdrname = "ִ������ϻ��ˣ���ί�ɴ���ǩ�֣�";
                }else if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)){
                	fdbdrname = "\n  ������ҵͶ����\n  ���ϻ���ҵִ������ϻ��˻�ί�ɴ���ǩ�֣�";
                }else if("GRDZ".equals(opetype)){
                	fdbdrname = "Ͷ����ǩ�֣�";
                }else if("WGJY".equals(opetype)||"WGDB".equals(opetype)){
                	fdbdrname = "�������������ҵ��Ȩǩ����ǩ��:";
                }
                Paragraph fdbdr = new Paragraph("      " + fdbdrname + "                                                                                                      ���£�  ",contentFont);
                fdbdr.setFirstLineIndent(40);
                Paragraph fzrqz = new Paragraph("    " + (("GS".equals(opetype)||"HHQY".equals(opetype)||"WZHH".equals(opetype)||"GRDZ".equals(opetype)||"WZGS".equals(opetype)||"HZS".equals(opetype))?"�������鸺���ˣ�ǩ�֣�":"") +"                                                                                                                         ��        ��          ��   ",contentFont);
                fzrqz.setFirstLineIndent(40);
                Cell allCell = new Cell();
                allCell.add(sqrp);
                allCell.add(fdbdr);
                allCell.add(fzrqz);
                allCell.setColspan(6);
                remarktable.addCell(allCell);
                
                document.add(remarktable);
                
                
            	 //���÷�����������Ϣ
                if("GRDZ".equals(opetype)){
                	Paragraph lerepTitle =  new Paragraph("\nͶ������Ϣ",titleChinese);
                    lerepTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle);
                    
                    //����TABLE��ʽ
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("�� ��",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("�� ��",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("sex"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("��������",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("natdate"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("�� ��",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("nation"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("�Ļ��̶�",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("litedeg"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("������ò",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("polstand"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    
                    Cell lerep13 = new Cell(new Phrase("�ƶ��绰",contentFont));
                    lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep13);
                    Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("mobile"),contentFont));
                    lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep14);
                    Cell lerep15 = new Cell(new Phrase("��������",contentFont));
                    lerep15.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep15);
                    Cell lerep16 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("email"),contentFont));
                    lerep16.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep16);
                    
                    Cell lerep17 = new Cell(new Phrase("���֤������",contentFont));
                    lerep17.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep17);
                    Cell lerep18 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep18.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep18);
                    Cell lerep19 = new Cell(new Phrase("���֤������",contentFont));
                    lerep19.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep19);
                    Cell lerep20 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep20.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep20);
                    
                    Cell lerep21 = new Cell(new Phrase("�ӡ� ��",contentFont));
                    lerep21.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep21);
                    Cell lerep22 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("houseadd"),contentFont));
                    lerep22.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep22);
                    Cell lerep23 = new Cell(new Phrase("��������",contentFont));
                    lerep23.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep23);
                    Cell lerep24 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("postalcode"),contentFont));
                    lerep24.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep24);
                    
                    Cell lerep25 = new Cell(new Phrase("����ǰְҵ״��",contentFont));
                    lerep25.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep25);
                    Cell lerep26 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("occstbeapp"),contentFont));
                    lerep26.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lerep26.setColspan(3);
                    lereptable.addCell(lerep26);
                    
                    document.add(lereptable);
                }else if("WGDB".equals(opetype)){
                	Paragraph lerepTitle1 =  new Paragraph("\n�������������ҵ��פ�������",titleChinese);
                    lerepTitle1.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle1);
                    Paragraph lerepTitle2 =  new Paragraph("��ϯ����/������Ϣ",titleChinese);
                    lerepTitle2.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle2);
                    
                    
                    //����TABLE��ʽ
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("��������",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("entname"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("��������",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("ְ��",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("position"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("����",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("country"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("�뾳ʱ��",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("arrchdate"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("��ϵ�绰",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("tel"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    
                    Cell lerep13 = new Cell(new Phrase("֤������",contentFont));
                    lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep13);
                    Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep14);
                    Cell lerep15 = new Cell(new Phrase("֤������",contentFont));
                    lerep15.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep15);
                    Cell lerep16 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep16.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep16);
                    
                    Cell lerep17 = new Cell(new Phrase("���ھ�ס��ַ",contentFont));
                    lerep17.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep17);
                    Cell lerep18 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("houaddinchina"),contentFont));
                    lerep18.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep18);
                    Cell lerep19 = new Cell(new Phrase("����֤��Ч����",contentFont));
                    lerep19.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep19);
                    Cell lerep20 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("repdate"),contentFont));
                    lerep20.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep20);
                    
                    Paragraph rep1 = new Paragraph("���˳�ŵ�������ڲ��õ�����ϯ����������������Σ�",contentFont);
                    rep1.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep2 = new Paragraph("1�������й����Ұ�ȫ������ṫ�����棬���д��̷��ģ�",contentFont);
                    rep2.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep3 = new Paragraph("2����������й����Ұ�ȫ������ṫ�������Υ��������������������Ǽǡ������Ǽ�֤���߱��йز�����������رյĴ����������ϯ���������Ա�������������������ر�֮����δ��5��ģ�",contentFont);
                    rep3.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep4 = new Paragraph("3�����ҹ������������ֹܾ涨���������Ρ�",contentFont);
                    rep4.setAlignment(Paragraph.ALIGN_LEFT);
                    Paragraph rep5 = new Paragraph("��ϯ����/����ǩ��",contentFont);
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
                    	lerepTitle = new Paragraph("\n������������Ϣ",titleChinese);
                    }else if("FGS".equals(opetype)||"NZYY".equals(opetype)||"HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)||"WZFZ".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)||"HZSFZ".equals(opetype)){
                    	lerepTitle = new Paragraph("\n��������Ϣ",titleChinese);
                    }else if("HHQY".equals(opetype)||"WZHH".equals(opetype)){
                    	lerepTitle = new Paragraph("\nִ������ϻ��ˣ���ί�ɴ�����Ϣ",titleChinese);
                    }
                    lerepTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(lerepTitle);
                    
                    //����TABLE��ʽ
                    Table lereptable = new Table(4); 
                    int lerepwidths[] = { 20, 30,20,30};  
                    lereptable.setWidths(lerepwidths);  
                    lereptable.setWidth(100);  
                    lereptable.setPadding(3);  
                    lereptable.setBorderWidth(1);
                    lereptable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Map<String,String> lerepMap = (Map<String,String>)dataMap.get("lerepMap");
                    Cell lerep1 = new Cell(new Phrase("�� ��",contentFont));
                    lerep1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep1);
                    Cell lerep2 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("name"),contentFont));
                    lerep2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep2);
                    Cell lerep3 = new Cell(new Phrase("�̶��绰",contentFont));
                    lerep3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep3);
                    Cell lerep4 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("tel"),contentFont));
                    lerep4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep4);
                    
                    Cell lerep5 = new Cell(new Phrase("�ƶ��绰",contentFont));
                    lerep5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep5);
                    Cell lerep6 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("mobile"),contentFont));
                    lerep6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep6);
                    Cell lerep7 = new Cell(new Phrase("��������",contentFont));
                    lerep7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep7);
                    Cell lerep8 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("email"),contentFont));
                    lerep8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep8);
                    
                    Cell lerep9 = new Cell(new Phrase("���֤������",contentFont));
                    lerep9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep9);
                    Cell lerep10 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("certype"),contentFont));
                    lerep10.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep10);
                    Cell lerep11 = new Cell(new Phrase("���֤������",contentFont));
                    lerep11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep11);
                    Cell lerep12 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("cerno"),contentFont));
                    lerep12.setHorizontalAlignment(Element.ALIGN_CENTER);
                    lereptable.addCell(lerep12);
                    if("HHFZ".equals(opetype)||"GRDZFZ".equals(opetype)){
                    	Cell lerep13 = new Cell(new Phrase("����ǰְҵ״��",contentFont));
                        lerep13.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lereptable.addCell(lerep13);
                        Cell lerep14 = new Cell(new Phrase(lerepMap==null?"":lerepMap.get("occstbeapp"),contentFont));
                        lerep14.setHorizontalAlignment(Element.ALIGN_CENTER);
                        lerep14.setColspan(3);
                        lereptable.addCell(lerep14);
                    }else if("WZFZ".equals(opetype)||"WZHH".equals(opetype)||"WZHHFZ".equals(opetype)||"WGJY".equals(opetype)){
                    	Cell lerep13 = new Cell(new Phrase("���𣨵�����",contentFont));
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
                	Paragraph hzsp = new Paragraph("\n���л����񹲺͹�ũ��רҵ�����編������ʮ���涨����ũ��רҵ����������³������¡������ü���ҵ��������ͬ������ũ��רҵ����������³������¡����¡�����������ʮһ���涨����ִ����ũ��רҵ������ҵ���йصĹ������Ա�����õ���ũ��רҵ����������³������¡����¡�������߲�������Ա����  ���˷��ϡ��л����񹲺͹�ũ��רҵ�����編������ʮ��������ʮһ���Ĺ涨�����Դ˳�ŵ����ʵ�Գе����Ρ�",contentFont);
                	document.add(hzsp);
                	Paragraph hzsp1 = new Paragraph("\n����������ǩ����",contentFont);
                	hzsp1.setIndentationLeft(200);
                	document.add(hzsp1);
                	Paragraph hzsp2 = new Paragraph("\n��        ��          ��                               ",contentFont);
                	hzsp2.setAlignment(Paragraph.ALIGN_RIGHT);
                	document.add(hzsp2);
                }
                
                if("GS".equals(opetype)||"WZGS".equals(opetype)){
                	//���ö�������Ϣ(����)
                    Paragraph ryxxTitle = new Paragraph("\n���¡����¡�������Ϣ",titleChinese);
                    ryxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(ryxxTitle);
                    
                    //����TABLE��ʽ
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
                    			Phrase p1 = new Phrase("������" + (ryxxs==null?"":ryxxs.get("name")) + "     ",contentFont);
                    			p.add(p1);
                    			Phrase p2 = new Phrase("ְ��" + (ryxxs==null?"":ryxxs.get("position")) + "     ",contentFont);
                    			p.add(p2);
                    			Phrase p3 = new Phrase("���֤�����ͣ�" + (ryxxs==null?"":ryxxs.get("certype")) + "     ",contentFont);
                    			p.add(p3);
                    			Phrase p4 = new Phrase("���֤�����룺" + (ryxxs==null?"":ryxxs.get("cerno")) + "     ",contentFont);
                    			p.add(p4);
                    		}else if("WZGS".equals(opetype)){
                    			Phrase p1 = new Phrase("������" + (ryxxs==null?"":ryxxs.get("name")) + "     ",contentFont);
                    			p.add(p1);
                    			Phrase p2 = new Phrase("���𣨵�������" + (ryxxs==null?"":ryxxs.get("country")) + "     ",contentFont);
                    			p.add(p2);
                    			Phrase p3 = new Phrase("���֤�����ͣ�" + (ryxxs==null?"":ryxxs.get("certype")) + "     ",contentFont);
                    			p.add(p3);
                    			Phrase p4 = new Phrase("���֤�����룺" + (ryxxs==null?"":ryxxs.get("cerno")) + "     ",contentFont);
                    			p.add(p4);
                    			Phrase p5 = new Phrase("ְ��" + (ryxxs==null?"":ryxxs.get("position")) + "     ",contentFont);
                    			p.add(p5);
                    			Phrase p6 = new Phrase("������ʽ��" + (ryxxs==null?"":ryxxs.get("posbrform")) + "     ",contentFont);
                    			p.add(p6);
                    		}
                    		Cell cell = new Cell(p);
                    		ryxxtable.addCell(cell);
                    	}
                    }
                    document.add(ryxxtable); 
                }
                
                if("GS".equals(opetype)){
                	//���ùɶ���������Ϣ(����)
                    Paragraph czxxTitle = new Paragraph("\n��˾�ɶ�(������)������Ϣ",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //����TABLE��ʽ
                    Table czxxtable = new Table(7); 
                    int czxxwidths[] = { 20, 20,15,10,10,15,10 };  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("Ͷ��������\n������",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("֤������",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("֤������",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("����ʱ��",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("���ʷ�ʽ",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("�Ͻɳ��ʶ�\n����Ԫ��",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("���ʱ���",contentFont));
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
                	//���ùɶ���������Ϣ(����)
                    Paragraph czxxTitle = new Paragraph("\nͶ���ߣ��ɶ�/�����ˣ��������",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //����TABLE��ʽ
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
                    		ct1text = "Ͷ��������\n������";
                    	}else if("WZHH".equals(opetype)){
                    		ct1text = "�ϻ�������\n������";
                    	}
                    	Cell ct1 = new Cell(new Phrase(ct1text,contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct11 = new Cell(new Phrase("���𣨵�����",contentFont));
                    	ct11.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct11);
                    	Cell ct2 = new Cell(new Phrase("֤������",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("֤������",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct31 = new Cell(new Phrase("�е����η�ʽ",contentFont)); 
                    	ct31.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct31);
                    	Cell ct4 = new Cell(new Phrase("����ʱ��",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("���ʷ�ʽ",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("�Ͻɳ��ʶ�\n����Ԫ��",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("���ʱ���",contentFont));
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
                	//ȫ��ϻ�����¼���������
                    Paragraph czxxTitle = new Paragraph("\nȫ��ϻ�����¼���������",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //����TABLE��ʽ
                    Table czxxtable = new Table(9); 
                    int czxxwidths[] = { 12, 11,11,11,11,11,11,11,11 };  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("�ϻ������ƻ�����",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("ס��",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("֤�����ͼ�����",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("�е����η�ʽ",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("���ʷ�ʽ",contentFont));
                    	ct5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct5);
                    	Cell ct6 = new Cell(new Phrase("������ʽ",contentFont));
                    	ct6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct6);
                    	Cell ct7 = new Cell(new Phrase("�Ͻɳ��ʶ��Ԫ��",contentFont));
                    	ct7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct7);
                    	Cell ct8 = new Cell(new Phrase("ʵ�ɳ��ʶ��Ԫ��",contentFont));
                    	ct8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct8);
                    	Cell ct9 = new Cell(new Phrase("�ɸ�����",contentFont));
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
                	//ũ��רҵ�������Ա�����嵥
                    Paragraph czxxTitle = new Paragraph("\nũ��רҵ�������Ա�����嵥",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //����TABLE��ʽ
                    Table czxxtable = new Table(5); 
                    int czxxwidths[] = {10, 30,20,20,20};  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("czxxList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("���",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("���ʳ�Ա����������",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("���ʷ�ʽ",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("���ʶԪ��",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("���ʳ�Աǩ�������",contentFont));
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
                    
                    Paragraph czzep = new Paragraph("\n��Ա�����ܶ�:    " + dataMap.get("regcap") + "   (Ԫ)  ",contentFont);
                    czzep.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep.setIndentationLeft(100);
                    document.add(czzep);
                    Paragraph czzep1 = new Paragraph("\n����������ǩ����  ",contentFont);
                    czzep1.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep1.setIndentationLeft(100);
                    document.add(czzep1);
                    Paragraph czzep2 = new Paragraph("\n��          ��           ��                                   ",contentFont);
                    czzep2.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(czzep2);
                }
                
                
                if("HZS".equals(opetype)){
                	//ũ��רҵ�������Ա����
                    Paragraph czxxTitle = new Paragraph("\nũ��רҵ�������Ա����",titleChinese);
                    czxxTitle.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(czxxTitle);
                    
                    //����TABLE��ʽ
                    Table czxxtable = new Table(5); 
                    int czxxwidths[] = {10, 20,30,25,15};  
                    czxxtable.setWidths(czxxwidths);  
                    czxxtable.setWidth(100);  
                    czxxtable.setPadding(3);  
                    czxxtable.setBorderWidth(1);
                    czxxtable.setAlignment(Cell.ALIGN_CENTER);
                    
                    List<List<String>> czxxList = (List<List<String>>)dataMap.get("hzsList");
                    if(czxxList!=null&&!czxxList.isEmpty()){
                    	Cell ct1 = new Cell(new Phrase("���",contentFont));
                    	ct1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct1);
                    	Cell ct2 = new Cell(new Phrase("��Ա����������",contentFont));
                    	ct2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct2);
                    	Cell ct3 = new Cell(new Phrase("֤�����Ƽ�����",contentFont));
                    	ct3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct3);
                    	Cell ct4 = new Cell(new Phrase("ס��",contentFont));
                    	ct4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    	czxxtable.addCell(ct4);
                    	Cell ct5 = new Cell(new Phrase("��Ա����",contentFont));
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
                    
                    Paragraph czzep = new Paragraph("\n��Ա����:    " + dataMap.get("cyzs") + "   (��)   ���У� ",contentFont);
                    czzep.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep.setIndentationLeft(40);
                    document.add(czzep);
                    Paragraph czzep1 = new Paragraph("ũ���Ա�� " + dataMap.get("nmcy") + "   (��)��ռ������  " + dataMap.get("nmcyrate") + "    % ",contentFont);
                    czzep1.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep1.setIndentationLeft(100);
                    document.add(czzep1);
                    Paragraph czzep2 = new Paragraph("��ҵ����ҵ��λ����������Ա��   " + dataMap.get("frcy") + "   (��)��ռ������ " + dataMap.get("frcyrate") + "  %",contentFont);
                    czzep2.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep2.setIndentationLeft(100);
                    document.add(czzep2);
                    
                    Paragraph czzep3 = new Paragraph("��ũ��רҵ������ĳ�Ա���ϡ�ũ��רҵ������Ǽǹ�����������ʮ��������ʮ�����Ĺ涨�����Դ˳�ŵ����ʵ�Գе����Ρ� ",contentFont);
                    czzep3.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep3.setIndentationLeft(40);
                    document.add(czzep3);
                    
                    Paragraph czzep4 = new Paragraph("\n����������ǩ���� ",contentFont);
                    czzep4.setAlignment(Paragraph.ALIGN_LEFT);
                    czzep4.setIndentationLeft(100);
                    document.add(czzep4);
                    
                    Paragraph czzep5 = new Paragraph("\n��         ��             ��                                           ",contentFont);
                    czzep4.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(czzep4);
                }
                
                //���ò���������Ϣ(����)
                Paragraph cwfzrTitle = new Paragraph("\n����������Ϣ",titleChinese);
                cwfzrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(cwfzrTitle);
                
                //����TABLE��ʽ
                Table cwfzrtable = new Table(4); 
                int cwfzrwidths[] = { 20, 30,20,30};  
                cwfzrtable.setWidths(cwfzrwidths);  
                cwfzrtable.setWidth(100);  
                cwfzrtable.setPadding(3);  
                cwfzrtable.setBorderWidth(1);
                cwfzrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Map<String,String> cwfzrMap = (Map<String,String>)dataMap.get("cwfzrMap");
                Cell cwfzr1 = new Cell(new Phrase("�� ��",contentFont));
                cwfzr1.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr1);
                Cell cwfzr2 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("name"),contentFont));
                cwfzr2.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr2);
                Cell cwfzr3 = new Cell(new Phrase("�̶��绰",contentFont));
                cwfzr3.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr3);
                Cell cwfzr4 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("tel"),contentFont));
                cwfzr4.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr4);
                
                Cell cwfzr5 = new Cell(new Phrase("�ƶ��绰",contentFont));
                cwfzr5.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr5);
                Cell cwfzr6 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("mobile"),contentFont));
                cwfzr6.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr6);
                Cell cwfzr7 = new Cell(new Phrase("��������",contentFont));
                cwfzr7.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr7);
                Cell cwfzr8 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("email"),contentFont));
                cwfzr8.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr8);
                
                Cell cwfzr9 = new Cell(new Phrase("���֤������",contentFont));
                cwfzr9.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr9);
                Cell cwfzr10 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("certype"),contentFont));
                cwfzr10.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr10);
                Cell cwfzr11 = new Cell(new Phrase("���֤������",contentFont));
                cwfzr11.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr11);
                Cell cwfzr12 = new Cell(new Phrase(cwfzrMap==null?"":cwfzrMap.get("cerno"),contentFont));
                cwfzr12.setHorizontalAlignment(Element.ALIGN_CENTER);
                cwfzrtable.addCell(cwfzr12);
                
                document.add(cwfzrtable);
                
                //��������Ա��Ϣ(����)
                Paragraph llrTitle = new Paragraph("\n����Ա��Ϣ",titleChinese);
                llrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(llrTitle);
                
                //����TABLE��ʽ
                Table llrtable = new Table(4); 
                int llrwidths[] = { 20, 30,20,30 };  
                llrtable.setWidths(llrwidths);  
                llrtable.setWidth(100);  
                llrtable.setPadding(3);  
                llrtable.setBorderWidth(1);
                llrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Map<String,String> llrMap = (Map<String,String>)dataMap.get("llrMap");
                Cell llr1 = new Cell(new Phrase("�� ��",contentFont));
                llr1.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr1);
                Cell llr2 = new Cell(new Phrase(llrMap==null?"":llrMap.get("name"),contentFont));
                llr2.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr2);
                Cell llr3 = new Cell(new Phrase("�̶��绰",contentFont));
                llr3.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr3);
                Cell llr4 = new Cell(new Phrase(llrMap==null?"":llrMap.get("tel"),contentFont));
                llr4.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr4);
                
                Cell llr5 = new Cell(new Phrase("�ƶ��绰",contentFont));
                llr5.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr5);
                Cell llr6 = new Cell(new Phrase(llrMap==null?"":llrMap.get("mobile"),contentFont));
                llr6.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr6);
                Cell llr7 = new Cell(new Phrase("��������",contentFont));
                llr7.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr7);
                Cell llr8 = new Cell(new Phrase(llrMap==null?"":llrMap.get("email"),contentFont));
                llr8.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr8);
                
                Cell llr9 = new Cell(new Phrase("���֤������",contentFont));
                llr9.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr9);
                Cell llr10 = new Cell(new Phrase(llrMap==null?"":llrMap.get("certype"),contentFont));
                llr10.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr10);
                Cell llr11 = new Cell(new Phrase("���֤������",contentFont));
                llr11.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr11);
                Cell llr12 = new Cell(new Phrase(llrMap==null?"":llrMap.get("cerno"),contentFont));
                llr12.setHorizontalAlignment(Element.ALIGN_CENTER);
                llrtable.addCell(llr12);
                
                document.add(llrtable);
                
                //����ί������Ϣ(����)
                Paragraph wtrTitle = new Paragraph("\nָ��������߹�ͬί�д����˵�֤��",titleChinese);
                wtrTitle.setAlignment(Paragraph.ALIGN_CENTER);
                document.add(wtrTitle);
                
                Map<String,String> wtrMap = (Map<String,String>)dataMap.get("wtrMap");
                
                String sqrText = "�� �� �� ��" + (wtrMap==null?"":wtrMap.get("sqr"));
                Paragraph sqr = new Paragraph(sqrText,contentFont);
                sqr.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(sqr);
                
                String wtrText = "ָ���������ί�д����� ��" + (wtrMap==null?"":wtrMap.get("wtr"));
                Paragraph wtr = new Paragraph(wtrText,contentFont);
                wtr.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wtr);
                
                Paragraph wtsx = new Paragraph("ί�����Ȩ�ޣ�\n",contentFont);
                wtsx.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wtsx);
                
                String wtText1 = "1������    " + (wtrMap==null?"":wtrMap.get("entname")) +  "     ����ҵ���ƣ���";
                Paragraph wt1 = new Paragraph(wtText1,contentFont);
                //���ö���������
                wt1.setIndentationLeft(60);
                document.add(wt1);
                
                Paragraph wt2 = new Paragraph("�� ����Ԥ�Ⱥ�׼ �� ���� �� ��� �� ע�� �� ���� �� ��������Ǽ�",contentFont);
                //���ö���������
                wt2.setIndentationLeft(70);
                document.add(wt2);
                
                Paragraph wt3 = new Paragraph("�� ��Ȩ���� �������� ����� �� ע�� ���������� ����__________������",contentFont);
                //���ö���������
                wt3.setIndentationLeft(70);
                document.add(wt3);
                
                Paragraph wt4 = new Paragraph("2." + (wtrMap==null?"":wtrMap.get("qx1")) + " �˶ԵǼǲ����еĸ�ӡ����ǩ��˶������",contentFont);
                //���ö���������
                wt4.setIndentationLeft(60);
                document.add(wt4);
                
                Paragraph wt5 = new Paragraph("3." + (wtrMap==null?"":wtrMap.get("qx2")) + " �޸���ҵ�Ա��ļ��Ĵ��� ",contentFont);
                //���ö���������
                wt5.setIndentationLeft(60);
                document.add(wt5);
                
                Paragraph wt6 = new Paragraph("4." + (wtrMap==null?"":wtrMap.get("qx3")) + " �޸��йر�����д����",contentFont);
                //���ö���������
                wt6.setIndentationLeft(60);
                document.add(wt6);
                
                Paragraph wt7 = new Paragraph("5." + (wtrMap==null?"":wtrMap.get("qx4")) + "��ȡӪҵִ�պ��й����顣\n",contentFont);
                //���ö���������
                wt7.setIndentationLeft(60);
                document.add(wt7);
                
                Paragraph wt8 = new Paragraph("ָ����ί�е���Ч���ޣ���    " + (wtrMap==null?"":wtrMap.get("confrom")) + "   ��     " + (wtrMap==null?"":wtrMap.get("conto")) + " \n ",contentFont);
                wt8.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wt8);
                
                //����TABLE��ʽ
                Table wtrtable = new Table(2); 
                int[] wtrwidths = { 50,50 };  
                wtrtable.setWidths(wtrwidths);  
                wtrtable.setWidth(100);  
                wtrtable.setPadding(3);  
                wtrtable.setBorderWidth(1);
                wtrtable.setAlignment(Cell.ALIGN_CENTER);
                
                Cell wtrc1 = new Cell(new Phrase("ָ�������ί�д����˻��߾�������Ϣ",contentFont));
                wtrc1.setRowspan(3);
                wtrc1.setHorizontalAlignment(Element.ALIGN_CENTER);
                wtrtable.addCell(wtrc1);
                
                Cell wtrc2 = new Cell(new Phrase("ǩ �֣�",contentFont));
                wtrc2.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc2);
                
                String telText = "�̶��绰��" + (wtrMap==null?"":wtrMap.get("tel"));
                Cell wtrc3 = new Cell(new Phrase(telText,contentFont));
                wtrc3.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc3);
                
                String mobileText = "�ƶ��绰��" + (wtrMap==null?"":wtrMap.get("mobile"));
                Cell wtrc4 = new Cell(new Phrase(mobileText,contentFont));
                wtrc4.setHorizontalAlignment(Element.ALIGN_LEFT);
                wtrtable.addCell(wtrc4);
                
                document.add(wtrtable);
                
                Paragraph wt9 = new Paragraph("\n�������˸��»�ǩ�֣� ",contentFont);
                wt9.setAlignment(Paragraph.ALIGN_LEFT);
                document.add(wt9);
                
                Paragraph wt10 = new Paragraph("\n" + (wtrMap==null?"":wtrMap.get("condate")) + " ",contentFont);
                wt10.setAlignment(Paragraph.ALIGN_RIGHT);
                document.add(wt10);
                
                //��������Ͷ����ҵ�ʹ���Ȩί����
                if("WZGS".equals(opetype)||"WZHH".equals(opetype)||"WGJY".equals(opetype)){
                	Paragraph wtsTitle1 = new Paragraph("\n����Ͷ����ҵ�����ļ��ʹ�",titleChinese);
                	wtsTitle1.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(wtsTitle1);
                    Paragraph wtsTitle2 = new Paragraph("��Ȩί����",titleChinese);
                	wtsTitle2.setAlignment(Paragraph.ALIGN_CENTER);
                    document.add(wtsTitle2);
                    
                    Map<String, String> sdMap = (Map<String, String>)dataMap.get("sdMap");
                    
                    Paragraph sdsq = new Paragraph("��Ȩ�� ��",contentFont);
                    sdsq.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sdsq);
                    
                    String sdbsqText = "����Ȩ�ˣ�    " + (sdMap==null?"":sdMap.get("name"));
                    Paragraph sdbsq = new Paragraph(sdbsqText,contentFont);
                    sdbsq.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sdbsq);
                    
                    String sqfwText = "��Ȩ��Χ������   " + (sdMap==null?"":sdMap.get("name")) + "     ������Ȩ�����ƻ�����������";
                    Paragraph sqfw = new Paragraph(sqfwText,contentFont);
                    sqfw.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(sqfw);
                    
                    Paragraph sqfw2 = new Paragraph("_______����Ȩ�����ƻ����������й����ڽ�����ҵ�Ǽǻ��ط����ļ��ʹֱ�������ȨΪֹ��",contentFont);
                    sqfw2.setAlignment(Paragraph.ALIGN_LEFT);
                    sqfw2.setIndentationLeft(60);
                    document.add(sqfw2);
                    
                  //����TABLE��ʽ
                    Table sdstable = new Table(4); 
                    int[] sdswidths = { 20,30,20,30 };  
                    sdstable.setWidths(sdswidths);  
                    sdstable.setWidth(100);  
                    sdstable.setPadding(3);  
                    sdstable.setBorderWidth(1);
                    sdstable.setAlignment(Cell.ALIGN_CENTER);
                    
                    Cell sd1 = new Cell(new Phrase("����Ȩ�˵�ַ",contentFont));
                    sd1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd1);
                    
                    Cell sd2 = new Cell(new Phrase(sdMap==null?"":sdMap.get("addr"),contentFont));
                    sd2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd2);
                    
                    Cell sd3 = new Cell(new Phrase("��������",contentFont));
                    sd3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd3);
                    
                    Cell sd4 = new Cell(new Phrase(sdMap==null?"":sdMap.get("postalcode"),contentFont));
                    sd4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd4);
                    
                    Cell sd5 = new Cell(new Phrase("����Ȩ����ϵ��",contentFont));
                    sd5.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd5);
                    
                    Cell sd6 = new Cell(new Phrase(sdMap==null?"":sdMap.get("linkman"),contentFont));
                    sd6.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd6);
                    
                    Cell sd7 = new Cell(new Phrase("�����ʼ�",contentFont));
                    sd7.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd7);
                    
                    Cell sd8 = new Cell(new Phrase(sdMap==null?"":sdMap.get("email"),contentFont));
                    sd8.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd8);
                    
                    Cell sd9 = new Cell(new Phrase("����Ȩ����ϵ��\n��ϵ�绰",contentFont));
                    sd9.setRowspan(2);
                    sd9.setHorizontalAlignment(Element.ALIGN_CENTER);
                    sdstable.addCell(sd9);
                    
                    Cell sd10 = new Cell(new Phrase("�̶���     " + (sdMap==null?"":sdMap.get("tel")),contentFont));
                    sd10.setColspan(3);
                    sd10.setHorizontalAlignment(Element.ALIGN_LEFT);
                    sdstable.addCell(sd10);
                    
                    Cell sd11 = new Cell(new Phrase("�ƶ���     " + (sdMap==null?"":sdMap.get("mobtel")),contentFont));
                    sd11.setColspan(3);
                    sd11.setHorizontalAlignment(Element.ALIGN_LEFT);
                    sdstable.addCell(sd11);
                    
                    document.add(sdstable);
                    
                    Paragraph sds1 = new Paragraph("\n��Ȩ��ǩ�ֻ����                                                                           ����Ȩ��ǩ�ֻ���� ",contentFont);
                    sds1.setAlignment(Paragraph.ALIGN_LEFT);
                    sds1.setIndentationLeft(100);
                    document.add(sds1);
                    
                    Paragraph sds2 = new Paragraph("\n ��      ��       ��                                        ",contentFont);
                    sds2.setAlignment(Paragraph.ALIGN_RIGHT);
                    document.add(sds2);
                    
                    Paragraph remark = new Paragraph(" ע��������Ͷ����ҵ�����ļ��ʹ���Ȩί���顷�����Ͷ���ߣ���Ȩ�ˣ��뾳�ڷ����ļ��ʹ�����ˣ�����Ȩ�ˣ�ǩ�𡣱���Ȩ�˿��������Ͷ���������ķ�֧�������������Ĺ�˾������Ȩ��Ϊ�������Ĺ�˾�ģ���˾������ί����Ч���������������йص�λ����ˡ�����Ȩ�ˡ�����Ȩ�˵�ַ�����������ģ�Ӧ��ǩ���µġ�����Ͷ����ҵ�����ļ��ʹ���Ȩί���顷��ʱ����ҵ�Ǽǻ��ر����� ",contentFont);
                    remark.setIndentationLeft(60);
                    remark.setAlignment(Paragraph.ALIGN_LEFT);
                    document.add(remark);
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
            logger.debug(e);
        }  

        //�ر�PDF���
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
		String checkBox = "��";
	    String selected = "��";
	    
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
		
		//���ñ���
		String title = "";
		if("GS".equals(opetype)){
			title = "��˾�Ǽǣ�������������";
		}else if("FGS".equals(opetype)){
			title = "�ֹ�˾�Ǽ�������";
		}else if("NZFR".equals(opetype)){
			title = "�ǹ�˾��ҵ���˵Ǽǣ�������������";
		}else if("NZYY".equals(opetype)){
			title = "Ӫҵ��λ�Ǽ�������";
		}else if("HHQY".equals(opetype)){
			title = "�ϻ���ҵ�Ǽǣ�������������";
		}else if("HHFZ".equals(opetype)){
			title = "���˶��ʣ��ϻ��ҵ��֧�����Ǽ�������";
		}else if("GRDZ".equals(opetype)){
			title = "���˶�����ҵ�Ǽǣ�������������";
		}else if("GRDZFZ".equals(opetype)){
			title = "���˶��ʣ��ϻ��ҵ��֧�����Ǽ�������";
		}else if("WZGS".equals(opetype)){
			title = "���ʹ�˾�Ǽǣ�������������";
		}else if("WZFZ".equals(opetype)){
			title = "������ҵ��֧�����Ǽ�������";
		}else if("WGDB".equals(opetype)){
			title = "�������������ҵ��פ��������Ǽ�������";
		}else if("WGJY".equals(opetype)){
			title = "�������������ҵ���й����ڴ���������Ӫ��Ǽ�������";
		}else if("WZHH".equals(opetype)){
			title = "����Ͷ�ʺϻ���ҵ�Ǽ�������";
		}else if("WZHHFZ".equals(opetype)){
			title = "������ҵ��֧�����Ǽ�������";
		}else if("HZS".equals(opetype)){
			title = "ũ��רҵ������Ǽǣ�������������";
		}else if("HZSFZ".equals(opetype)){
			title = "ũ��רҵ�������֧�����Ǽǣ�������������";
		}else if("GT".equals(opetype)){
			title = "���幤�̻���ҵ�Ǽ�������";
		}
		
		
		map.put("title", title);
		map.put("opetype", opetype);
		
		Map<String, String> jbxxMap = new HashMap<String, String>();
		jbxxMap.put("entname", jbxx.getENTNAME());
		jbxxMap.put("regno", jbxx.getNAMEAPPNO());
		jbxxMap.put("supentname", jbxx.getSUPENTNAME());
		jbxxMap.put("supregno", jbxx.getSUPREGNO());

		//����ס��
		StringBuilder dom = new StringBuilder();
		dom.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROVINCE().length()==6?jbxx.getPROVINCE():jbxx.getPROVINCE()+"00", "1")).append("  ʡ����/��������  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCITY(),"1")).append("  �У�����/��/�����ݣ�  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCOUNTY(),"1")).append("  �أ�������/��/������/��/����  ");
		dom.append(jbxx.getTOWN()).append("  �磨������/��/�ֵ���  ");
		dom.append(jbxx.getVILLAGE()).append("  �壨·/������  ");
		dom.append(jbxx.getHOUSENUMBER()).append("  ��");
		jbxxMap.put("dom", dom.toString());
		jbxxMap.put("depincha", jbxx.getDEPINCHA());
		
		//����������Ӫ��
		StringBuilder oploc = new StringBuilder();
		oploc.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROPROVINCE().length()==6?jbxx.getPROPROVINCE():jbxx.getPROPROVINCE()+"00", "1")).append("  ʡ����/��������  ");
		oploc.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getPROCITY(),"1")).append("  �У�����/��/�����ݣ�  ");
		oploc.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getPROCOUNTY(),"1")).append("  �أ�������/��/������/��/����  ");
		oploc.append(jbxx.getPROTOWN()).append("  �磨������/��/�ֵ���  ");
		oploc.append(jbxx.getPROVILLAGE()).append("  �壨·/������  ");
		oploc.append(jbxx.getPROHOUSENUMBER()).append("  ��");
		jbxxMap.put("oploc", oploc.toString());
		
		jbxxMap.put("tel", jbxx.getTEL());
		jbxxMap.put("postalcode", jbxx.getPOSTALCODE());
		jbxxMap.put("lerep", jbxx.getLEREP());
		jbxxMap.put("houseadd", ryxx.getHOUSEADD());
		jbxxMap.put("cerno", ryxx.getCERNO());
		jbxxMap.put("yysj", "��   " + jbxx.getOPFROM() + "  ��       " +jbxx.getOPTO());
		//����ְ��
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
		position.append(sl1).append("���³�");
		position.append(sl2).append("ִ�ж���");
		position.append(sl3).append("����");
		jbxxMap.put("position", position.toString());
		
		jbxxMap.put("regcap", jbxx.getREGCAP() + "��Ԫ");
		jbxxMap.put("regcapcur", getDmdzByTypeAndCode("CURRENCY", jbxx.getREGCAPCUR(), "1"));
		jbxxMap.put("enttype", getDmdzByTypeAndCode("ENTTYPE", jbxx.getENTTYPE(), "1"));
		//���úϻ���ҵ����
		String  hhlx = "";
		if("4531".equals(jbxx.getENTTYPE())){
			hhlx = selected + " ��ͨ�ϻ�   " + checkBox + "  �������ͨ�ϻ�       " + checkBox + "   ���޺ϻ�";
		}else if("4532".equals(jbxx.getENTTYPE())){
			hhlx = checkBox + " ��ͨ�ϻ�   " + selected + "  �������ͨ�ϻ�       " + checkBox + "   ���޺ϻ�";
		}else if("4533".equals(jbxx.getENTTYPE())){
			hhlx = checkBox + " ��ͨ�ϻ�   " + checkBox + "  �������ͨ�ϻ�       " + selected + "   ���޺ϻ�";
		}
		jbxxMap.put("hhlx", hhlx);
		//���úϻ���ʶ�
		String  hhcze = "���У�ʵ��    " + jbxx.getREGCAP() + "   ��Ԫ���Ͻ�   " + jbxx.getREGCAP() + "    ��Ԫ ";
		jbxxMap.put("hhcze", hhcze);
		
		jbxxMap.put("parnum", String.valueOf(jbxx.getPARNUM()));
		jbxxMap.put("exenum", String.valueOf(jbxx.getEXENUM()));
		jbxxMap.put("empnum", String.valueOf(jbxx.getEMPNUM()));
		//���˶��ʳ��ʷ�ʽ
		String grczfs = "";
		if("1".equals(jbxx.getSCONFORM())){
			grczfs = selected + " 1.�Ը��˲Ʋ�����   "  + checkBox + " 2.�Լ�ͥ���вƲ���Ϊ���˳��ʡ�";
		}else if("2".equals(jbxx.getSCONFORM())){
			grczfs = checkBox + " 1.�Ը��˲Ʋ�����   "  + selected + " 2.�Լ�ͥ���вƲ���Ϊ���˳��ʡ�";
		}
		//����������ʽ
		String insform;
		if("01".equals(jbxx.getINSFORM())){
			insform = selected + "��������" + "  " + checkBox + "ļ������";
		}else if("07".equals(jbxx.getINSFORM())){
			insform = checkBox + "��������" + "  " + selected + "ļ������";
		}else{
			insform = checkBox + "��������" + "  " + checkBox + "ļ������";
		}
		jbxxMap.put("insform", insform);
		//���ú��㷽ʽ
		String calculationmethod;
		if("1".equals(jbxx.getCALCULATIONMETHOD())){
			calculationmethod = selected + " ��������       " + checkBox + " �Ƕ������� ";
		}else if("2".equals(jbxx.getCALCULATIONMETHOD())){
			calculationmethod = checkBox + " ��������       " + selected + " �Ƕ������� ";
		}else{
			calculationmethod = checkBox + " ��������       " + checkBox + " �Ƕ������� ";
		}
		jbxxMap.put("calculationmethod", calculationmethod);
		
		jbxxMap.put("busscope", jbxx.getBUSSCOPE());
		//����Ӫҵ����
		String opfyears;
		String yyqx=(String)jbxx.doPreProcess(jbxx.getOPDATETO());
		if("����".equals(yyqx)||"".equals(yyqx)){
			opfyears = checkBox + "__��  " + selected + "����"; 
		}else{
			opfyears = selected + yyqx + " ��   " + checkBox + "����";
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
		jbxxMap.put("cxqx", "��   " + jbxx.getFORENTOPFROM() + "  ��     " + jbxx.getFORENTOPTO());
		jbxxMap.put("forentautsign", jbxx.getFORENTAUTSIGN());
		//��ҵ������ʽ
		String forenliafor = "";
		if("1".equals(jbxx.getFORENLIAFOR())){
			forenliafor = checkBox + " ��������   " + selected + " ��������";
		}else if("2".equals(jbxx.getFORENLIAFOR())){
			forenliafor = selected + " ��������   " + checkBox + " ��������";
		}else{
			forenliafor = checkBox + " ��������   " + checkBox + " ��������";
		}
		jbxxMap.put("forenliafor", forenliafor);
		jbxxMap.put("forentcap", jbxx.getFORENTCAP() + "����Ԫ");
		jbxxMap.put("forentscope", jbxx.getFORENTSCOPE());
		
		map.put("jbxxMap", jbxxMap);
		
		//���÷���������
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
		lerepMap.put("repdate", "��    " + lerep.getREPCARFROM() + "  ��      " + lerep.getREPCARTO());
		lerepMap.put("position", getDmdzByTypeAndCode("POSITION", lerep.getPOSITION(), "1"));
		
		map.put("lerepMap", lerepMap);
		
		//���ö����¾�����Ϣ
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
		
		//���ùɶ���Ϣ
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
		
		//���ú������Ա��¼
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
		
		//���ò�������
		Map<String,String> cwfzrMap = new HashMap<String,String>();
		cwfzrMap.put("name", cwfzr.getNAME());
		cwfzrMap.put("tel", cwfzr.getTEL());
		cwfzrMap.put("mobile", cwfzr.getMOBTEL());
		cwfzrMap.put("email", cwfzr.getEMAIL());
		cwfzrMap.put("certype", getDmdzByTypeAndCode("CERTYPE", cwfzr.getCERTYPE(), "1"));
		cwfzrMap.put("cerno", cwfzr.getCERNO());
		map.put("cwfzrMap", cwfzrMap);
		
		//��������Ա
		Map<String,String> llrMap = new HashMap<String,String>();
		llrMap.put("name", llr.getNAME());
		llrMap.put("tel", llr.getTEL());
		llrMap.put("mobile", llr.getMOBTEL());
		llrMap.put("email", llr.getEMAIL());
		llrMap.put("certype", getDmdzByTypeAndCode("CERTYPE", llr.getCERTYPE(), "1"));
		llrMap.put("cerno", llr.getCERNO());
		map.put("llrMap", llrMap);
		
		//����ί����
		if(sqwts!=null&&!sqwts.isEmpty()){
			QYDJ_SQWT_SQ wtr = sqwts.get(0);
		    Map<String, String> wtrMap = new HashMap<String, String>();
			wtrMap.put("sqr", wtr.getAPPPER());
			wtrMap.put("wtr", wtr.getCONSIGNER());
			wtrMap.put("entname", jbxx.getENTNAME());
			String qx1,qx2,qx3,qx4;
			if("1".equals(wtr.getIFLICENSE1())){
				qx1 = "ͬ��" + selected + " ��ͬ��" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE1())){
				qx1 = "ͬ��" + checkBox + " ��ͬ��" + selected;
			}else{
				qx1 = "ͬ��" + checkBox + " ��ͬ��" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE2())){
				qx2 = "ͬ��" + selected + " ��ͬ��" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE2())){
				qx2 = "ͬ��" + checkBox + " ��ͬ��" + selected;
			}else{
				qx2 = "ͬ��" + checkBox + " ��ͬ��" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE3())){
				qx3 = "ͬ��" + selected + " ��ͬ��" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE3())){
				qx3 = "ͬ��" + checkBox + " ��ͬ��" + selected;
			}else{
				qx3 = "ͬ��" + checkBox + " ��ͬ��" + checkBox;
			}
			if("1".equals(wtr.getIFLICENSE4())){
				qx4 = "ͬ��" + selected + " ��ͬ��" + checkBox;
			}else if("2".equals(wtr.getIFLICENSE4())){
				qx4 = "ͬ��" + checkBox + " ��ͬ��" + selected;
			}else{
				qx4 = "ͬ��" + checkBox + " ��ͬ��" + checkBox;
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
		
		//�����ļ��ʹ���
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
		
		//���ø��廧��Ϣ
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
		//���ø��˾�Ӫ
		String grjy = "���˾�Ӫ";
		if("1".equals(gtxx.getCOMPFORM())){
			grjy += selected;
		}else{
			grjy += checkBox;
		}
		gtMap.put("grjy", grjy);
		//���ü�ͥ��Ӫ
		String jtjy = "��ͥ��Ӫ";
		if("2".equals(gtxx.getCOMPFORM())){
			jtjy += selected;
		}else{
			jtjy += checkBox;
		}
		gtMap.put("jtjy", jtjy);
		
		gtMap.put("fammember", gtxx.getFAMMEMBER());
		gtMap.put("busscoandform", gtxx.getBUSSCOANDFORM());
		gtMap.put("oploc", gtxx.getOPLOC());
		gtMap.put("empnum", gtxx.getEMPNUM() + "��");
		gtMap.put("capam", gtxx.getCAPAM() + "��Ԫ");
		
		map.put("gtMap", gtMap);
		
		
		//���ñ���·��
		String enttype = jbxx.getENTTYPE();
		
		String sqsPath = PropertiesConfigUtil.getValue("SQS_PATH") + "/" + opetype + "/";
		String fileName = "gssqs_"+openo + ".pdf";
		
		createPdfByData(fileName, sqsPath, map);
		
		return sqsPath+fileName;
	}
	
	/**
	 * ����type��code��ȡdmdz���е�content����remark
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
