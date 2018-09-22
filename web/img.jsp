<%@page language="java" pageEncoding="UTF-8"%>
<%@page contentType="image/jpeg"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>

<%!
	// 随机生成颜色
	public Color getColor(){
		Random random = new Random();
		int r = random.nextInt(256);
		int g = random.nextInt(256);
		int b = random.nextInt(256);
		
		return new Color(r,g,b);
	}
	// 生成验证码
	public String getNum(){
		int ran = (int)(Math.random()*9000) + 1000;
		
		return String.valueOf(ran);
	}
%>
<%
	// 禁止浏览器缓存，防止验证码不及时被加载
	response.setHeader("pragma","mo-cache");
	response.setHeader("cache-control","no-cache");
	response.setDateHeader("expires",0);
	// 设置验证码的 宽：80px  高：30px 颜色类型 RGB
	BufferedImage image = new BufferedImage(80,30,BufferedImage.TYPE_INT_RGB);
	
	// 创建画笔对象  graphics
	Graphics graphics = image.getGraphics();
	// 填充验证码图片的背景色  从（0,0）开始 到（80,30）
	graphics.fillRect(0,0,80,30);
	
//	再验证码图片上 随机生成60条干扰线段
//	线段的起始位置是（xBegin,yBegin）  终止是 （xEnd,yEnd）
	for(int i = 0; i < 60; i++){
		Random random = new Random();
		int xBegin = random.nextInt(80);
		int yBegin = random.nextInt(30);
		int xEnd = random.nextInt(xBegin + 10);
		int yEnd = random.nextInt(yBegin + 10);
		// 设置线条颜色
		graphics.setColor(getColor());
		// 绘制线条
		graphics.drawLine(xBegin,yBegin,xBegin + xEnd,yBegin + yEnd);
	}
	// 设置验证码的字体格式   字体：serif  粗体  18像素
	graphics.setFont(new Font("serif",Font.BOLD,18));
	// 设置验证码字体颜色为黑色
	graphics.setColor(Color.BLACK);
	// 获取验证码
	String checkCode = getNum();
	// 在验证码的各个数字之间 增加一些间隔
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i < checkCode.length(); i++){
		sb.append(checkCode.charAt(i)+"");
	}
	// 从坐标（15,20） 开始回执验证码
	graphics.drawString(sb.toString(),15,20);
	// 将验证码的值放入session 供后续使用
	session.setAttribute("CHECKCODE",checkCode);
	// 将验证码绘制成jpeg格式
	ImageIO.write(image,"jpeg",response.getOutputStream());
	out.clear();
	// 表示验证码会被其他页面引用
	// jpeg格式的验证码生成后 会作为<img/> 元素的src属性被其他页面引用
	out=pageContext.pushBody();
%>