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
     * ��Ȼ�˶����³�
     * @param openo
     * @throws DocumentException
     * @throws IOException
     * @throws ParseException 
     */
    public static void createDzGszcPdfByData(String fileName,String path,Map dataMap) throws DocumentException, IOException, ParseException {  
		//����PDF���·��
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

		Date date = new Date();
		 //ת�����ڸ�ʽ
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy��MM��dd��");
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
    		
    	// ������������
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// ����������
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "���޹�˾�³�";
		Paragraph title = new Paragraph(contextString, titleFont);
		// ���ñ����ʽ���뷽ʽ
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// ����������
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context11String ="��һ��    ��   ��";
		Paragraph context11 = new Paragraph(context11String,font);
	 	// ���ĸ�ʽ�����
	 	context11.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context11.setSpacingBefore(20);
	 	doc.add(context11);
	 	
		String context12String = "          ��һ��  Ϊ��Ӧ��������г����õ�Ҫ�󣬷�չ�����������ݡ��л����񹲺͹���˾���������¼�ơ���˾���������йط��ɡ������ƶ����³̡�";
		Paragraph context12 = new Paragraph(context12String,font);
	 	// ���ĸ�ʽ�����
	 	context12.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context12.setSpacingBefore(10);
	 	doc.add(context12);
	 	
		String context21String = "�ڶ���    	��˾���ƺ�ס��";
		Paragraph context21 = new Paragraph(context21String,font);
	 	// ���ĸ�ʽ�����
	 	context21.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context21.setSpacingBefore(10);
	 	doc.add(context21);
	 	
		String context22String = "          �ڶ���    ��˾���ƣ�"+entname+
		"\n"+
		"           ������    ��˾ס����"+dom;
		Paragraph context22 = new Paragraph(context22String,font);
		// ���ĸ�ʽ�����
		context22.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context22.setSpacingBefore(10);
		doc.add(context22);
	 	
		String context31String = "������	    ��˾��Ӫ��Χ";
		Paragraph context31 = new Paragraph(context31String,font);
	 	// ���ĸ�ʽ�����
	 	context31.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context31.setSpacingBefore(10);
	 	doc.add(context31);
	 	
	 	String context32String = "          ������	��˾��Ӫ��Χ��"+busscope;
		Paragraph context32 = new Paragraph(context32String,font);
		// ���ĸ�ʽ�����
		context32.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context32.setSpacingBefore(10);
		doc.add(context32);
	 	
		String context41String = "������    ��˾ע���ʱ����ɶ����������ơ����ʷ�ʽ�����ʶ����ʱ��";
		Paragraph context41 = new Paragraph(context41String,font);
	 	// ���ĸ�ʽ�����
	 	context41.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context41.setSpacingBefore(10);
	 	doc.add(context41);
	 	
	 	String context42String = "          ������  ��˾ע���ʱ� "+regcap+" ��Ԫ����ҡ�"+
	 		 	"\n"+
	 		 	"           ������  �ɶ����������ơ����ʶ���ʷ�ʽ�����ʱ������£�\n";
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
             context42String+="                             "+inv+"�Ի����Ͻɳ��� "+subconam+" ��Ԫ��ռ���ʱ��� "+subconprop+"%��\n"+
            		 "                             �ɶ��Ͻɵĳ����� "+condate+" ǰȫ�����塣\n";
		}
	 	
		Paragraph context42 = new Paragraph(context42String,font);
		// ���ĸ�ʽ�����
		context42.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context42.setSpacingBefore(10);
		doc.add(context42);
		
		String context51String = "������    �ɶ�ת�ó��ʵ�����";
		Paragraph context51 = new Paragraph(context51String,font);
	 	// ���ĸ�ʽ�����
	 	context51.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context51.setSpacingBefore(10);
	 	doc.add(context51);
	 	
	 	String context52String = "          ������  �ɶ�������ɶ��������ת����ȫ���򲿷ֳ��ʡ�"+
	 	"\n"+ 
	 	"          �ڰ���  �ɶ�����ת������ʺ��ɹ�˾�������˵����������ơ�סַ�Լ����õĳ��ʶ�����ڹɶ����ᡣ";
		Paragraph context52 = new Paragraph(context52String,font);
		// ���ĸ�ʽ�����
		context52.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context52.setSpacingBefore(10);
		doc.add(context52);
		
		String context61String = "������    ��˾��֯�����������취��ְȨ";
		Paragraph context61 = new Paragraph(context61String,font);
	 	// ���ĸ�ʽ�����
	 	context61.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context61.setSpacingBefore(10);
	 	doc.add(context61);
	 	
	 	String context62String = "          �ھ���    ��˾����ɶ��ᣬ�ɶ��ǹ�˾�����Ȩ��������\n �ɶ���ʹ����ְȨ��\n"+
	 	"          ��һ��������˾�ľ�Ӫ�����Ͷ�ʼƻ���\n"+
	 	"          ������ί�ɺͳ�������ְ�������ε�ִ�ж��¡����£������й�ִ�ж��¡����µı������\n	"+
	 	"          ������������׼ִ�ж��µı��棻\n"+
	 	"          ���ģ�������׼���µı��棻\n"+
	 	"          ���壩������׼��˾����Ȳ���Ԥ�㷽�������㷽����\n"+
	 	"          ������������׼��˾��������䷽�����ֲ����𷽰���\n"+
	 	"          ���ߣ��Թ�˾���ӻ��߼���ע���ʱ�����������\n"+
	 	"          ���ˣ��Է��й�˾ծȯ����������\n"+
	 	"          ���ţ��Թ�˾�ϲ��������������˾��ʽ����ɢ��������������������� \n"+
	 	"          ��ʮ���޸Ĺ�˾�³̣�\n"+
        "          ��ʮһ����˾�³̹涨������ְȨ��\n"+
	 	"          �ɶ������Ͽ����о���ʱ��Ӧ����ȡ������ʽ�����ɹɶ�ǩ�����ñ��ڹ�˾��"+
        "\n"+
	 	"          ��ʮ��  ��˾��ִ�ж���һ�ˣ��ɹɶ�ί�ɲ�����ִ�ж���ÿ������3�꣬���ڽ�������ί�ɿ����Ρ�ִ�ж��¶Թɶ�������ʹ����ְȨ��\n"+
	 	"          ��һ��������˾�ľ�Ӫ�ƻ���Ͷ�ʷ�����\n"+
	 	"          �������ƶ���˾����Ȳ���Ԥ�㷽�������㷽����\n"+
	 	"          �������ƶ���˾��������䷽�����ֲ����𷽰���\n"+
	 	"          ���ģ��ƶ���˾���ӻ��߼���ע���ʱ��ķ�����\n"+
	 	"          ���壩�ⶩ��˾�ϲ��������������˾��ʽ����ɢ�ķ�����\n"+
	 	"          ������������˾�ڲ�������������ã�\n"+
	 	"          ���ߣ�Ƹ�λ��߽�Ƹ��˾�߼�������Ա�������䱨�����\n"+
	 	"          ���ˣ��ƶ���˾�Ļ��������ƶȡ�"+
	 	"\n"+
	 	"          ��ʮһ��  ��˾�辭��һ������ִ�ж���Ƹ�λ��߽�Ƹ��"+
	 	"\n"+
	 	"          ��ʮ����  �����ִ�ж��¸�����ʹ����ְȨ��\n"+
	 	"          ��һ�����ֹ�˾��������Ӫ��������\n"+
	 	"          ��������֯ʵʩ��˾��Ⱦ�Ӫ�ƻ���Ͷ�ʷ�����\n"+
	 	"          �������ⶩ��˾�ڲ�����������÷�����\n"+
	 	"          ���ģ��ⶩ��˾�Ļ��������ƶȣ�\n"+
	 	"          ���壩�ƶ���˾�ľ�����£�\n"+
	 	"          ����������Ƹ�λ��߽�Ƹ��˾�������������ˣ�\n"+
	 	"          ���ߣ�Ƹ�λ��߽�Ƹ��Ӧ��ִ�ж���Ƹ�λ��߽�Ƹ����ĸ���������Ա��"+
	 	"\n"+
	 	"          ��ʮ����  ��˾�����һ�����ɹɶ�ί�ɲ�����ÿ���������꣬���ڽ��������ɶ�ί�ɿ������Ρ�"+
	 	"\n"+
	 	"          ��ʮ����  ������ʹ����ְȨ��\n"+
	 	"          ��һ��	��鹫˾����\n"+
	 	"          ��������ִ�ж��¡��߼�������Աִ�й�˾ְ��ʱΥ�����ɡ�������߹�˾�³̵���Ϊ���мල����Υ�����ɡ��������桢��˾�³̵�ִ�ж��¡��߼�������Ա�������Ľ��飻\n"+
	 	"          ��������ִ�ж��º͸߼�������Ա����Ϊ�𺦹�˾����ʱ��Ҫ��ִ�ж��º;������Ծ�����\n"+
	 	"          ���ģ���ɶ�����鰸��\n"+
	 	"          ���壩���ա���˾�����Ĺ涨���Թ�˾ִ�ж��¡��߼�������Ա�������ϡ�"+
	 	"\n"+
	 	"          ��ʮ����  ִ�ж��¡�����Ӧ�����ط��ɡ����������Լ���˾�³̣���ʵ����ְ��ά����˾���棬���������ڹ�˾�ĵ�λ��ְȨ��Ϊ�Լ�Ĳȡ˽����ִ�ж��¡�����ִ�й�˾ְ��ʱΥ�����ɡ�����������߹�˾�³̵Ĺ涨������˾����𺦵ģ�Ӧ���е��⳥���Ρ�";	 	
		Paragraph context62 = new Paragraph(context62String,font);
		// ���ĸ�ʽ�����
		context62.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context62.setSpacingBefore(10);
		doc.add(context62);
		
		String context71String = "������	��˾�ķ���������";
		Paragraph context71 = new Paragraph(context71String,font);
	 	// ���ĸ�ʽ�����
	 	context71.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context71.setSpacingBefore(10);
	 	doc.add(context71);
	 	
	 	String context72String = "          ��ʮ����  ִ�ж���Ϊ��˾�ķ��������ˣ�ÿ������Ϊ���꣬�ɹɶ�ί�ɲ�����"+
	 	"\n"+
	 	"          ��ʮ����  ��˾������������ʹ����ְȨ��\n"+
	 	"          ��һ������˾ǩ���й��ļ���\n"+
	 	"          ���������³̵�ʮ���涨��ְȨ��";
		Paragraph context72 = new Paragraph(context72String,font);
		// ���ĸ�ʽ�����
		context72.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context72.setSpacingBefore(10);
		doc.add(context72);
		
		String context81String = "�ڰ���	���񡢻�ơ�������估�Ͷ��ù��ƶ�";
		Paragraph context81 = new Paragraph(context81String,font);
	 	// ���ĸ�ʽ�����
	 	context81.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context81.setSpacingBefore(10);
	 	doc.add(context81);
	 	
	 	String context82String = "          ��ʮ����  ��˾Ӧ�����շ��ɡ���������͹���Ժ�������ŵĹ涨��������˾�Ĳ��񡢻���ƶȡ�"+
	 	"\n"+
	 	"          ��ʮ����  ��˾Ӧ����ÿһ�������ʱ���Ʋ����Ʊ��棬�����������ʦ��������ƣ��ڵڶ�������һ��ǰ�������Ʊ����ͽ��ɶ���"+
	 	"\n"+
	 	"          �ڶ�ʮ��  ��˾���䵱��˰������ʱ��Ӧ����ȡ����İٷ�֮ʮ���빫˾���������𣬹�˾�����������ۻ���Ϊ��˾ע���ʱ��İٷ�֮��ʮ���ϵģ��ɲ�����ȡ��\n"+
	 	"          ��˾�ķ��������������ֲ���ǰ��ȿ���ģ�������ǰ��涨��ȡ����������֮ǰ��Ӧ�����õ��������ֲ�����\n"+
	 	"          ��˾��˰����������ȡ����������󣬾��ɶ�ͬ�⣬�����Դ�˰����������ȡ���⹫����"+
	 	"\n"+
	 	"          �ڶ�ʮһ��  ��˾�Ĺ����������ֲ���˾�Ŀ�������˾������Ӫ����תΪ���ӹ�˾�ʱ���\n"+
	 	"          ����������תΪ�ʱ�ʱ��������ĸ�����𲻵�����ת��ǰע���ʱ��İٷ�֮��ʮ�塣"+
	 	"\n"+
	 	"          �ڶ�ʮ����  �Ͷ��ù��ƶȰ��չ��ҷ��ɡ����漰����Ժ�Ͷ����ŵ��йع涨ִ�С�\n";
		Paragraph context82 = new Paragraph(context82String,font);
		// ���ĸ�ʽ�����
		context82.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context82.setSpacingBefore(10);
		doc.add(context82);
		
		String context91String = "�ھ���	��˾��ɢ����������취";
		Paragraph context91 = new Paragraph(context91String,font);
	 	// ���ĸ�ʽ�����
	 	context91.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context91.setSpacingBefore(10);
	 	doc.add(context91);
	 	
	 	String yyqx="";
	    if("����".equals(opfyears)){
	    	yyqx="����";    	
	    }else{
	    	yyqx=opfyears+" ��";
	    }
	 	String context92String = "          �ڶ�ʮ����  ��˾��Ӫҵ����Ϊ"+yyqx+"���ӡ���ҵ����Ӫҵִ�ա�ǩ��֮������㡣"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾������ԭ���ɢ��\n"+
	 	"          ��һ����˾�³̹涨��Ӫҵ���޽�����\n"+
	 	"          �������ɶ�������ɢ��\n"+
	 	"          ��������˾�ϲ��������Ҫ��ɢ��\n"+
	 	"          ���ģ�����������Ӫҵִ�ա�����رջ��߱�������"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾��ɢʱ��Ӧ������˾�����Ĺ涨�ɹɶ��Թ�˾�������㡣���������Ӧ���������㱨�棬�����͹�˾�Ǽǻ��أ�����ע����˾�Ǽǣ����湫˾��ֹ��";
		Paragraph context92 = new Paragraph(context92String,font);
		// ���ĸ�ʽ�����
		context92.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context92.setSpacingBefore(10);
		doc.add(context92);
		
		String context101String = "��ʮ��  ��    ��";
		Paragraph context101 = new Paragraph(context101String,font);
	 	// ���ĸ�ʽ�����
	 	context101.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context101.setSpacingBefore(10);
	 	doc.add(context101);
	 	
	 	String context102String = "          �ڶ�ʮ����  ��˾�³̾��ɶ�ǩ�ֺ���Ч���漰�³��޸ĵģ����ɶ�ͬ����ɷ���������ǩ����Ч��"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾�³��ɹɶ�������ͣ��漰��˾�Ǽ�������Թ�˾�Ǽǻ��صǼ�Ϊ׼��"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ���³�һʽ���ݣ�������˾�Ǽǻ��ر���һ�ݡ�"+
	 	"\n\n\n\n"+
	 	"          �ɶ�ǩ��:"+
	 	"\n\n\n\n\n\n"+
	 	"                                                                                                                                                  "+createDate;
		Paragraph context102 = new Paragraph(context102String,font);
		// ���ĸ�ʽ�����
		context102.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context102.setSpacingBefore(10);
		doc.add(context102);
		
		
		doc.close();
    }
    
    /**
     * 2��������Ȼ��Ͷ�ʹ�˾�³�
     * @param openo
     * @throws DocumentException
     * @throws IOException
     * @throws ParseException 
     */
    public static void createGszcPdfByData(String fileName,String path,Map dataMap) throws DocumentException, IOException, ParseException {  
		//����PDF���·��
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

    	//ParameterSet pset = SysUtilities.changeRequestToParameterSet(request);
		Date date = new Date();
		 //ת�����ڸ�ʽ
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy��MM��dd��");
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
    		
    	// ������������
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// ����������
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "���޹�˾\n��              ��";
		Paragraph title = new Paragraph(contextString, titleFont);
		// ���ñ����ʽ���뷽ʽ
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// ����������
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context11String ="��һ��    ��  ּ";
		Paragraph context11 = new Paragraph(context11String,font);
	 	// ���ĸ�ʽ�����
	 	context11.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context11.setSpacingBefore(20);
	 	doc.add(context11);
	 	
		String context12String = "          ��һ��  Ϊ����Ӧ��������г����õķ�չ�ͽ����ִ���ҵ�ƶȵ���Ҫ���淶��˾����֯��Ϊ��������˾���ɶ���ְ���ĺϷ�Ȩ�棬�����ɶ�������𣬲����ݡ���˾�������ƶ����³̣���˾��Ϊ����ṩ����Ϊ���Ҵ���Ƹ���Ϊ�ɶ�������õľ���Ч��Ϊ��ּ����˾������Ӫ��������˰��";
		Paragraph context12 = new Paragraph(context12String,font);
	 	// ���ĸ�ʽ�����
	 	context12.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context12.setSpacingBefore(10);
	 	doc.add(context12);
	 	
		String context21String = "�ڶ���      ��˾���ƺ�ס��";
		Paragraph context21 = new Paragraph(context21String,font);
	 	// ���ĸ�ʽ�����
	 	context21.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context21.setSpacingBefore(10);
	 	doc.add(context21);
	 	
		String context22String = "          �ڶ���    ��˾���ƣ�"+entname+
		"\n"+
		"           ������    ��˾ס����"+dom;
		Paragraph context22 = new Paragraph(context22String,font);
		// ���ĸ�ʽ�����
		context22.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context22.setSpacingBefore(10);
		doc.add(context22);
	 	
		String context31String = "������	    ��˾��Ӫ��Χ";
		Paragraph context31 = new Paragraph(context31String,font);
	 	// ���ĸ�ʽ�����
	 	context31.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context31.setSpacingBefore(10);
	 	doc.add(context31);
	 	
	 	String context32String = "          ������    ��˾��Ӫ��Χ��"+busscope;
		Paragraph context32 = new Paragraph(context32String,font);
		// ���ĸ�ʽ�����
		context32.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context32.setSpacingBefore(10);
		doc.add(context32);
	 	
		String context41String = "������    ��˾ע���ʱ����ɶ����������ơ����ʷ�ʽ��\n���ʶ����ʱ��";
		Paragraph context41 = new Paragraph(context41String,font);
	 	// ���ĸ�ʽ�����
	 	context41.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context41.setSpacingBefore(10);
	 	doc.add(context41);
	 	
		String context42String = "          ������  ��˾ע���ʱ� "+regcap+" ����ҡ�"+
			 	"\n"+
			 	"           ������  �ɶ����������ơ����ʶ���ʷ�ʽ�����ʱ������£�\n";
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
             context42String+="                             "+inv+" �Ի����Ͻɳ��� "+subconam+" ��Ԫ����ң�ռ���ʱ��� "+subconprop+"%��\n"+
            		 "                             �ɶ��Ͻɵĳ����� "+condate+" ǰȫ�����塣\n";
		}
		 context42String+="\n"+
	 	"           ������  ��˾��������ɶ�ǩ������֤���顣�ɶ�����֤��һʽ������һ�����ùɶ���һ������˾������\n"+
	 	"          ����֤����Ӧ�������������\n"+
	 	"          ��һ����˾���ƣ�\n"+
	 	"          ��������˾�������ڣ�\n"+
	 	"          ��������˾ע���ʱ���\n"+
	 	"          ���ģ��ɶ��������������ơ����ɵĳ��ʶ�ͳ������ڣ�\n"+
	 	"          ���壩����֤����ı�źͺ˷����ڡ�";
		Paragraph context42 = new Paragraph(context42String,font);
		// ���ĸ�ʽ�����
		context42.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context42.setSpacingBefore(10);
		doc.add(context42);
		
		String context51String = "������   ��˾�Ĺ�Ȩת��";
		Paragraph context51 = new Paragraph(context51String,font);
	 	// ���ĸ�ʽ�����
	 	context51.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context51.setSpacingBefore(10);
	 	doc.add(context51);
	 	
	 	String context52String = "          �ڰ���  ��˾�Ĺɶ�֮������໥ת����ȫ�����߲��ֹ�Ȩ��"+
	 	"\n"+ 
	 	"           �ھ���  �ɶ���ɶ��������ת�ù�Ȩ,�뾭�����ɶ�������ͬ�⡣�ɶ�Ӧ�����Ȩת����������֪ͨ�����ɶ�����ͬ�⣬�����ɶ��Խӵ�����֪֮ͨ��������ʮ��δ�𸴵ģ���Ϊͬ��ת�á������ɶ��������ϲ�ͬ��ת�õģ���ͬ��Ĺɶ�Ӧ�������ת�õĹ�Ȩ��������ģ���Ϊͬ��ת�á����ɶ�ͬ��ת�õĹ�Ȩ����ͬ�������£������ɶ������ȹ���Ȩ���������Ϲɶ�������ʹ���ȹ���Ȩ�ģ�Э��ȷ�����ԵĹ��������Э�̲��ɵģ�����ת��ʱ���Եĳ��ʱ�����ʹ���ȹ���Ȩ��"+
	 	"\n"+
	 	"          ��ʮ��  ��Ȼ�˹ɶ���������Ϸ��̳��˼̳йɶ��ʸ�"+
	 	"\n"+
	 	"          ��ʮһ��  �ɶ�����ת�ù�Ȩ���ɹ�˾�������˵����������ơ�סַ�Լ����õĳ��ʶ�����ڹɶ����ᡣ";
	 	Paragraph context52 = new Paragraph(context52String,font);
		// ���ĸ�ʽ�����
		context52.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context52.setSpacingBefore(10);
		doc.add(context52);
		
		String context61String = "������  ��˾�Ļ�����������취��ְȨ�����¹���";
		Paragraph context61 = new Paragraph(context61String,font);
	 	// ���ĸ�ʽ�����
	 	context61.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context61.setSpacingBefore(10);
	 	doc.add(context61);
	 	
	 	String context62String = "          ��ʮ����  ��˾�ɶ�����ȫ��ɶ���ɡ��ɶ����ǹ�˾��Ȩ�����������ա���˾������ʹְȨ��"+
        "\n"+
	 	"          ��ʮ����  �ɶ�����ʹ����ְȨ��\n"+
	 	"          ��һ��������˾�ľ�Ӫ�����Ͷ�ʼƻ���\n"+
	 	"          ������ѡ�ٺ͸���ִ�ж��£������й�ִ�ж��µı������\n"+
	 	"          ������ѡ�ٺ͸�������ְ��������εļ��£������йؼ��µı������\n"+
	 	"          ���ģ�������׼ִ�ж��µı��棻\n"+
	 	"          ���壩������׼���µı��棻\n"+
	 	"          ������������׼��˾����Ȳ���Ԥ�㷽�������㷽����	\n"+
	 	"          ���ߣ�������׼��˾��������䷽�����ֲ�����ķ�����\n"+
	 	"          ���ˣ��Թ�˾���ӻ��߼���ע���ʱ��������飻\n"+
	 	"          ���ţ��Թ�˾�ϲ�����������ɢ��������߱����˾��ʽ�������飻\n"+
	 	"          ��ʮ���޸Ĺ�˾�³̡�\n"+
	 	"           ��ǰ����������ɶ���������ʽһ�±�ʾͬ��ģ����Բ��ٿ��ɶ�����飬ֱ����������������ȫ��ɶ��ھ����ļ���ǩ�������¡�"+
	 	"\n"+
	 	"          ��ʮ����  �״ιɶ�������ɳ������Ĺɶ��ټ������֣����ա���˾�����涨��ʹְȨ��"+
	 	"\n"+
	 	"          ��ʮ����  �ɶ�������Ϊ���ڻ������ʱ���顣\n"+
	 	"���ڻ������״ιɶ������ٿ�֮����ÿ6�����ٿ�һ�Ρ�����ʮ��֮һ���ϱ��Ȩ�Ĺɶ���ִ�ж��¡����������ٿ���ʱ����ģ�Ӧ���ٿ���ʱ���顣"+
	 	"\n"+
	 	"          ��ʮ����  �ɶ��������ִ�ж����ټ������֡�\n"+
	 	"ִ�ж��²������л��߲������ټ��ɶ������ְ��ģ��ɼ����ټ������֣����²��ټ������ֵģ�����ʮ��֮һ���ϱ��Ȩ�Ĺɶ����������ټ������֡�"+
	 	"\n"+
	 	"          ��ʮ����  �ٿ��ɶ�����飬Ӧ���ڻ����ٿ�ʮ����ǰ֪ͨȫ��ɶ���\n"+
	 	" �ɶ���Ӧ������������ľ������������¼����ϯ����Ĺɶ�Ӧ���ڻ����¼��ǩ����"+
	 	"\n"+
	 	"          ��ʮ����  �ɶ�������ɹɶ����ճ��ʱ�����ʹ���Ȩ��ÿ   ��Ԫ�����Ϊһ�����Ȩ��"+
	 	"\n"+
	 	"          ��ʮ����  �ɶ������Ӧ�����������������飬����Ӧ�ɴ������֮һ      ���ϱ��Ȩ�Ĺɶ����ͨ�������ǹɶ�����������޸Ĺ�˾�³̡����ӻ��߼���ע���ʱ��ľ��飬�Լ���˾�ϲ�����������ɢ���߱����˾��ʽ�ľ��飬���뾭��������֮�����ϱ��Ȩ�Ĺɶ�ͨ������˾�³����й涨�Ĵ���涨��  "+
	 	"\n"+
	 	"          �ڶ�ʮ��  ��˾��ִ�ж��£��ɹɶ���ѡ�ٲ�������������뾭�ɶ����������֮�����ϱ��Ȩ�Ĺɶ�ͨ����\n"+
	 	"          ִ�ж�������Ϊ���꣬���ڽ���������ѡ���Ρ�ִ�ж����������ڣ��ɶ��᲻���޹ʽ����ְ��\n"+
	 	"          ִ�ж��¶Թɶ��Ḻ����ʹ����ְȨ��\n"+
	 	"          ��һ���ټ��ɶ�����飬����ɶ��ᱨ�湤����\n"+
	 	"          ������ִ�йɶ���ľ��飻\n"+
	 	"          ������������˾�ľ�Ӫ�ƻ���Ͷ�ʷ����� \n"+
	 	"          ���ģ��ƶ���˾����Ȳ���Ԥ�㷽�������㷽���� \n"+
	 	"          ���壩�ƶ���˾��������䷽�����ֲ����𷽰���\n"+
	 	"          �������ƶ���˾���ӻ��߼���ע���ʱ��ķ�����\n"+
	 	"          ���ߣ��ƶ���˾�ϲ�����������ɢ���߱����˾��ʽ�ķ�����\n"+
	 	"          ���ˣ�������˾�ڲ�������������ã�	\n"+
	 	"          ���ţ�����Ƹ�λ��߽�Ƹ��˾�����䱨����������ݾ������������Ƹ�λ��߽�Ƹ��˾�������������˼��䱨�����\n"+
	 	"          ��ʮ���ƶ���˾�Ļ��������ƶȡ�\n"+
	 	"          ��ʮһ����˾�³̹涨������ְȨ��"+
	 	"\n"+
	 	"          �ڶ�ʮһ��  ��˾�辭��1�ˣ���ִ�ж���Ƹ�λ��߽�Ƹ��\n"+
	 	"          ������ʹ����ְȨ��\n"+
	 	"          ��һ�����ֹ�˾��������Ӫ����������֯ʵʩִ�ж��¾��飻\n"+
	 	"          ��������֯ʵʩ��˾��Ⱦ�Ӫ�ƻ���Ͷ�ʷ�����\n"+
	 	"          �������ⶩ��˾�ڲ�����������÷�����\n"+
	 	"          ���ģ��ⶩ��˾�Ļ��������ƶȣ�\n"+
	 	"          ���壩�ƶ���˾�ľ�����£�\n"+
	 	"          ����������Ƹ�λ��߽�Ƹ��˾�������������ˣ�\n"+
	 	"          ���ߣ�Ƹ�λ��߽�Ƹ��Ӧ��ִ�ж���Ƹ�λ��߽�Ƹ����ĸ��������Ա��"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾�����1�ˣ��ɹɶ���ѡ�ٲ�������������ÿ�����꣬���ڽ�������ѡ�������Ρ���˾ִ�ж��¡��߼�������Ա���ü��μ��¡�"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ������ʹ����ְȨ��\n"+
	 	"          ��һ����鹫˾����\n"+
	 	"          ��������ִ�ж��¡��߼�������Աִ�й�˾ְ�����Ϊ���мල����Υ�����ɡ��������桢��˾�³̻��߹ɶ�������ִ�ж��¡��߼�������Ա�������Ľ��飻 \n"+
	 	"          ��������ִ�ж��¡��߼�������Ա����Ϊ�𺦹�˾������ʱ��Ҫ��ִ�ж��¡��߼�������Ա���Ծ����� \n"+
	 	"          ���ģ������ٿ���ʱ�ɶ�����飬��ִ�ж��²����С���˾�����涨���ټ������ֹɶ������ְ��ʱ�ټ������ֹɶ�����飻\n"+
	 	"          ���壩��ɶ����������᰸�� \n"+
	 	"          ���������ա���˾������һ����ʮ�������йع涨����ִ�ж��¡��߼�������Ա�������ϣ�"+
	 	"\n"+
	 	"          �ڶ�ʮ���� ִ�ж��¡����¡��߼�������ԱӦ�����ط��ɡ����������Լ���˾�³̣���ʵ����ְ��ά����˾���棬���������ڹ�˾�ĵ�λ��ְȨ��Ϊ�Լ�Ĳȡ˽����ִ�ж��¡����¡��߼�������Աִ�й�˾ְ��ʱΥ�����ɡ�����������߹�˾�³̵Ĺ涨������˾����𺦵ģ�Ӧ���е��⳥���Ρ�"
	 	;	 	
		Paragraph context62 = new Paragraph(context62String,font);
		// ���ĸ�ʽ�����
		context62.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context62.setSpacingBefore(10);
		doc.add(context62);
		
		String context71String = "������	��˾����������";
		Paragraph context71 = new Paragraph(context71String,font);
	 	// ���ĸ�ʽ�����
	 	context71.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context71.setSpacingBefore(10);
	 	doc.add(context71);
	 	
	 	String context72String = "          �ڶ�ʮ����  ִ�ж���Ϊ��˾�ķ��������ˡ�"+
	 	"\n"+
	 	"           �ڶ�ʮ���� ��˾���������˾���˾�Ǽǻ���������׼�Ǽǣ�ȡ�÷����������ʸ񡣷��������˵�ǩ��Ӧ���ڹ�˾�Ǽǻ��ر�����";
		Paragraph context72 = new Paragraph(context72String,font);
		// ���ĸ�ʽ�����
		context72.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context72.setSpacingBefore(10);
		doc.add(context72);
		
		String context81String = "�ڰ���  ��˾���񡢻�ơ�������估�Ͷ��ù��ƶ�";
		Paragraph context81 = new Paragraph(context81String,font);
	 	// ���ĸ�ʽ�����
	 	context81.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context81.setSpacingBefore(10);
	 	doc.add(context81);
	 	
	 	String context82String = "          �ڶ�ʮ����  ��˾Ӧ�����շ��ɡ���������͹���Ժ�������ŵĹ涨��������˾�Ĳ��񡢻���ƶȡ�"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾Ӧ����ÿһ�������ʱ���Ʋ����Ʊ��棬�����������ʦ��������ƣ��ڵڶ�������һ��ǰ�������Ʊ����ͽ����ɶ���"+
	 	"\n"+
	 	"          �ڶ�ʮ����  ��˾���䵱��˰������ʱ��Ӧ����ȡ����İٷ�֮ʮ���빫˾���������𣬹�˾�����������ۻ���Ϊ��˾ע���ʱ��İٷ�֮��ʮ���ϵģ��ɲ�����ȡ��	\n"+
	 	"          ��˾�ķ��������������ֲ���ǰ��ȿ���ģ�������ǰ��涨��ȡ����������֮ǰ��Ӧ�����õ��������ֲ�����\n"+
	 	"          ��˾��˰����������ȡ����������󣬾��ɶ�����飬�����Դ�˰����������ȡ���⹫����\n"+
	 	"          ��˾�ֲ��������ȡ�����������˰�����󣬹�˾���չɶ���ʵ�ɵĳ��ʱ������䡣"+
	 	"\n"+
	 	"          ����ʮ��  ��˾�Ĺ����������ֲ���˾�Ŀ�������˾������Ӫ����תΪ���ӹ�˾�ʱ���\n"+
	 	"          ����������תΪ�ʱ�ʱ��������ĸ�����𲻵�����ת��ǰע���ʱ��İٷ�֮��ʮ�塣"+
	 	"\n"+
	 	"          ����ʮһ��  �Ͷ��ù��ƶȰ��չ��ҷ��ɡ����漰����Ժ�Ͷ����ŵ��йع涨ִ�С�";
		Paragraph context82 = new Paragraph(context82String,font);
		// ���ĸ�ʽ�����
		context82.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context82.setSpacingBefore(10);
		doc.add(context82);
		
		String context91String = "�ھ���  ��˾�Ľ�ɢ����������취";
		Paragraph context91 = new Paragraph(context91String,font);
	 	// ���ĸ�ʽ�����
	 	context91.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context91.setSpacingBefore(10);
	 	doc.add(context91);
	 	
	 	String yyqx="";
	    if("����".equals(opfyears)){
	    	yyqx="���ڡ�";    	
	    }else{
	    	yyqx=opfyears+" �ꡣ";
	    }
	 	String context92String = "          ����ʮ����  ��˾Ӫҵ���� "+yyqx+
	 	"\n"+
	 	"           ����ʮ����  ��˾������ԭ���ɢ��\n"+
	 	"          ��һ��	��˾�³̹涨��Ӫҵ���޽�����\n"+
	 	"          �������ɶ�������ɢ��\n"+
	 	"          ��������˾�ϲ��������Ҫ��ɢ��\n"+
	 	"          ���ģ�����������Ӫҵִ�ա�����رջ��߱�������\n"+
	 	"          ���壩��˾��Ӫ�������������ѣ�����������ʹ�ɶ������ܵ��ش���ʧ��ͨ������;�����ܽ���ģ����й�˾ȫ���ɶ����Ȩ�ٷ�֮ʮ���ϵĹɶ���������������Ժ��ɢ��˾��"+
	 	"\n"+
	 	"          ����ʮ����  ��˾��ɢʱ��Ӧ���ݡ���˾�����Ĺ涨����������Թ�˾�������㡣���������������Ӧ���������㱨�棬���ɶ�������йز���ȷ�ϡ������͹�˾�Ǽǻ�������ע���Ǽǣ����湫˾��ֹ��";
		Paragraph context92 = new Paragraph(context92String,font);
		// ���ĸ�ʽ�����
		context92.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context92.setSpacingBefore(10);
		doc.add(context92);
		
		String context101String = "��ʮ��  �ɶ���Ϊ��Ҫ�涨����������";
		Paragraph context101 = new Paragraph(context101String,font);
	 	// ���ĸ�ʽ�����
	 	context101.setAlignment(Element.ALIGN_CENTER);
	 	// ����һ���䣨���⣩�յ�����
	 	context101.setSpacingBefore(10);
	 	doc.add(context101);
	 	
	 	String context102String = "          ����ʮ����  ��˾������Ҫ���޸Ĺ�˾�³̣��޸Ĺ�˾�³̵ľ�����뾭��������֮�����ϱ��Ȩ�Ĺɶ�ͨ������˾�³����������޸ĺ�Ĺ�˾�³�Ӧ�͵Ǽǻ��ر������漰����Ǽ�����ģ�ͬʱӦ��˾�Ǽǻ����������Ǽǡ�"+
	 	"\n"+
	 	"          ����ʮ����  ��˾�³̵Ľ���Ȩ���ڹɶ��ᡣ"+
	 	"\n"+
	 	"          ����ʮ����  ��˾�Ǽ������Թ�˾�Ǽǻ��غ�׼��Ϊ׼��"+
	 	"\n"+
	 	"          ����ʮ����  ���³̾��ɶ���ͬЭ�̶�������ǩ��֮������Ч��"+
	 	"\n"+
	 	"          ����ʮ����  ���³�һʽ  �ݣ���˾�浵һ�ݣ��ɶ�����һ�ݣ�������˾�Ǽǻ��ر���һ�ݡ�"+
	 	"\n\n\n\n"+
	 	"          ȫ��ɶ�ǩ�֣�"+
	 	"\n\n\n\n\n\n"+
	 	"                                                                                                                                                      "+createDate;
		Paragraph context102 = new Paragraph(context102String,font);
		// ���ĸ�ʽ�����
		context102.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context102.setSpacingBefore(10);
		doc.add(context102);
		
		
		doc.close();
    }
    
    /**
     * ��ŵ��
     * @param openo
     * @throws DocumentException
     * @throws IOException
     */
    public static void createCnsPdfByData(String fileName,String path) throws DocumentException, IOException {  
		//����PDF���·��
        File file = new File(path);  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
    	String filePath = path+fileName;	

		Date date = new Date();
		 //ת�����ڸ�ʽ
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy��MM��dd��");
	    String createDate = formatter.format(date);
    	Rectangle rect = new Rectangle(PageSize.A4);  
        Document doc = new Document(rect, 50.0F, 50.0F, 50.0F, 50.0F); 
    	PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(filePath));
    	doc.open();
    		
    	// ������������
		BaseFont bfChinese = BaseFont.createFont("STSongStd-Light","UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);

		// ����������
		Font titleFont = new Font(bfChinese, 18, Font.BOLD);
    	String contextString = "��   ŵ   ��";
		Paragraph title = new Paragraph(contextString, titleFont);
		// ���ñ����ʽ���뷽ʽ
		title.setAlignment(Element.ALIGN_CENTER);
		doc.add(title);
		
		// ����������
	 	Font font = new Font(bfChinese, 13, Font.NORMAL);
		String context1String = "һ����(�����)��˾��ȫ��ɶ���ŵ������������г��ල������ṩ����������Ǽ�ע����ϣ������������ڹɶ������¡����³���ִ�ж��µ�ǩ�֣����۴���ʽ�ϻ���ʵ�������ϣ�������ٳɷ֣���������ʵ�ԡ���Ч�ԡ��Ϸ��Ը��𣬰���ԸΪ�˳е���Ӧ�������Ρ�";
		Paragraph context1 = new Paragraph(context1String,font);
	 	// ���ĸ�ʽ�����
	 	context1.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context1.setSpacingBefore(15);
	    // ���õ�һ�пյ�����
		context1.setFirstLineIndent(20);
	 	doc.add(context1);
		
		String context2String = "��������˾���¡����¡��������ְ�ǰ��ա���˾�����ȷ��ɷ������ߺ͡���˾�³̡��Ĺ涨���������ģ������ɶ���ȫ�������ϵǼ�ϵͳ�Զ����ɵġ���˾�Ǽǣ������������顷�������ݡ�����ǩ���������е���ǩ��ȷ�ϣ���˾���¡����¡������ṩ��������Ա�����Ϣ��ʵ����Ч�Ϸ���";
		Paragraph context2 = new Paragraph(context2String,font);
	 	// ���ĸ�ʽ�����
	 	context2.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context2.setSpacingBefore(10);
	    // ���õ�һ�пյ�����
		context2.setFirstLineIndent(20);
	 	doc.add(context2);
	 	
	 	String context3String = " ��������˾ȫ����Ա��֤���ع��Ҽƻ������й����߹涨������Υ�����Ҽƻ��������ߺ͹涨��������ɴ˲�����һ�к�����ɹ�˾�������˸���е���";
		Paragraph context3 = new Paragraph(context3String,font);
	 	// ���ĸ�ʽ�����
	 	context3.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context3.setSpacingBefore(10);
	    // ���õ�һ�пյ�����
		context3.setFirstLineIndent(20);
	 	doc.add(context3);
	 	
        String context4String = "�ġ���Ȼ�˹ɶ����ǹ��ҹ���Ա�����ɷ�������߹涨��������뾭Ӫ��������Ȩ������������Ա��";
        Paragraph context4 = new Paragraph(context4String,font);
	 	// ���ĸ�ʽ�����
	 	context4.setAlignment(Element.ALIGN_LEFT);
	 	// ����һ���䣨���⣩�յ�����
	 	context4.setSpacingBefore(10);
	    // ���õ�һ�пյ�����
		context4.setFirstLineIndent(20);
	 	doc.add(context4);    
	 	
	   String context5String = "�塢����˾���������ˡ����¡����¡���������йط��ɡ�����涨����ְ�ʸ񣬲��������������\n"+
	   "        1��	��������Ϊ������������������Ϊ�����ģ�\n"+
	   "        2��	���ڱ�ִ���̷��������ڱ�ִ������ǿ�ƴ�ʩ�ģ�\n"+
	   "        3��	���ڱ��������ػ��߹��Ұ�ȫ����ͨ���ģ�\n"+
	   "        4��	����̰�ۻ�¸��ַ��Ʋ�������ƻ���������г�������������д��̷���ִ������δ������ģ�������������д��̷���ִ������δ������ģ��������ﱻ�д���������Ȩ����ִ������δ������ģ�\n"+
	   "        5��	������Ӫ�����Ʋ��������ҵ�ķ��������˻��߶��¡��������Ը���ҵ���Ʋ����и������Σ��Ը���ҵ�Ʋ��������֮����δ������ģ�\n"+
	   "        6��	������Υ��������Ӫҵִ�յ���ҵ�ķ��������ˣ����Ը���ҵΥ����Ϊ���и������Σ��Ը���ҵ������Ӫҵִ��֮����δ������ģ�\n"+
	   "        7��	���˸�ծ����ϴ󣬵���δ�峥�ģ�\n"+
	   "        8��	���ɡ�������¡����߹涨���������ܵ�����ҵ���������ˡ����¡����¡�����ġ�";
	   Paragraph context5 = new Paragraph(context5String,font);
		// ���ĸ�ʽ�����
	   context5.setAlignment(Element.ALIGN_LEFT);
	// ����һ���䣨���⣩�յ�����
	   context5.setSpacingBefore(10);
		    // ���õ�һ�пյ�����
	   context5.setFirstLineIndent(20);
	   doc.add(context5);    
		 	
	   String context6String = "������˾Ϊ��Ȼ�˶��ʵ�һ�����޹�˾�ģ����ɶ�����ǩ��ȷ�ϣ����˳�ŵֻ������˾һ��һ�����޹�˾�����ٳ��ʰ�������һ�����޹�˾�����˳��������ĸ�һ�����޹�˾���ٳ��ʰ�������һ�����޹�˾�����˱�֤����������ʵ�Բ����为��";
	   Paragraph context6 = new Paragraph(context6String,font);
		// ���ĸ�ʽ�����
		context6.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context6.setSpacingBefore(10);
		 // ���õ�һ�пյ�����
		context6.setFirstLineIndent(20);
		doc.add(context6);    
	 	
		String context7String = "�ߡ��ɶ�֣�س�ŵ�����̲����Ѹ�֪�������������������š�����ȡӪҵִ�պ��ң�����ҵ/ũ��רҵ������/���幤�̻��������չ涨��ʱ������������Ű�����������ɡ���������������δȡ�����������������ɡ�������ǰ��������أ�Ӧ����ɱ����ģ���Ӫ������г����ǼǾ�Ӫ��Χ���º����������Ӫ����Ҫ��Ҳ�����а���Ӫ��Χ����ǼǺ���Ӧ����������δȡ���������ǰ��������ؾ�Ӫ���\n"+
        "        ����ŵ�龭�ɶ�����ǩ������Ч��"+
		"\n\n\n\n\n"+
        "                                                                                                                                                    "+createDate;
		Paragraph context7 = new Paragraph(context7String,font);
		// ���ĸ�ʽ�����
		context7.setAlignment(Element.ALIGN_LEFT);
		// ����һ���䣨���⣩�յ�����
		context7.setSpacingBefore(10);
		 // ���õ�һ�пյ�����
		context7.setFirstLineIndent(20);
		doc.add(context7);    

        doc.close();        
    }
    
    /**
     * ��˾������Ϣ/��������Ϣ
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
		//��ҵ����
		jbxxMap.put("entname", jbxx.getENTNAME());
		jbxxMap.put("regno", jbxx.getNAMEAPPNO());
	
		//����ס��
		StringBuilder dom = new StringBuilder();
		dom.append(getDmdzByTypeAndCode("DISCOUS", jbxx.getPROVINCE().length()==6?jbxx.getPROVINCE():jbxx.getPROVINCE()+"00", "1")).append("  ʡ����/��������  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCITY(),"1")).append("  �У�����/��/�����ݣ�  ");
		dom.append(getDmdzByTypeAndCode("DISCOUS",jbxx.getCOUNTY(),"1")).append("  �أ�������/��/������/��/����  ");
		dom.append(jbxx.getTOWN()).append("  �磨������/��/�ֵ���  ");
		dom.append(jbxx.getVILLAGE()).append("  �壨·/������  ");
		dom.append(jbxx.getHOUSENUMBER()).append("  ��");
		jbxxMap.put("dom", dom.toString());
		//���þ�Ӫ��Χ
		jbxxMap.put("busscope", jbxx.getBUSSCOPE());
        //ע���ʱ�
		jbxxMap.put("regcap", jbxx.getREGCAP() + "��Ԫ");

		//����Ӫҵ����
		String opfyears;
		String yyqx=(String)jbxx.doPreProcess(jbxx.getOPDATETO());
		jbxxMap.put("opfyears", yyqx);
		map.put("jbxxMap", jbxxMap);		
		//���ùɶ���Ϣ	
		map.put("czxxList", czxxs);
		
		//���ñ���·��
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
     * ��ŵ����Ϣ
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

