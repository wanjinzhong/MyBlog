package com.blog.util;

public class PageUtil {

	// 数据总条数
	private long dataTotal;
	// 当前页码
	private int curPage;
	// 每页条数
	private int pageCapacity;
	// 总页数
	private int totalPage;
	// 请求数据的地址
	private String url;

	public PageUtil(){
		
	}

	public PageUtil(long dataTotal, int curPage, int pageCapacity, String url) {
		super();
		this.dataTotal = dataTotal;
		this.curPage = curPage;
		this.pageCapacity = pageCapacity;
		this.url = url;
	}

	/**
	 * 返回整个分页页面
	 * 
	 * @return
	 */
	public String pcontroller() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul id='PageNum'>");
		buffer.append(firstPage());
		buffer.append(prePage());
		buffer.append(preTwoPage());
		buffer.append(curPage());
		buffer.append(nextTwoPage());
		buffer.append(nextPage());
		buffer.append(lastPage());
		buffer.append("</ul>");
		return buffer.toString();

	}

	public long getDataTotal() {
		return dataTotal;
	}

	public void setDataTotal(long dataTotal) {
		this.dataTotal = dataTotal;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String Controller() {
		String result = "";
		return result;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageCapacity() {
		return pageCapacity;
	}

	public void setPageCapacity(int pageCapacity) {
		this.pageCapacity = pageCapacity;
	}

	/**
	 * 计算页数
	 * 
	 * @return 页数
	 */
	public int getTotalPage() {
		if (totalPage == 0)
			totalPage = (int) ((dataTotal % pageCapacity == 0) ? dataTotal / pageCapacity
					: dataTotal / pageCapacity + 1);
		return totalPage;
	}

	/**
	 * 获取第一页（首页）
	 * 
	 * @return 首页的链接
	 */
	private String firstPage() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<li><a href='" + url + "curPage=1'>");
		buffer.append("首页");
		buffer.append("</a></li>");
		return buffer.toString();

	}

	/**
	 * 获取最后一页（尾页）
	 * 
	 * @return 最后一页的链接
	 */
	private String lastPage() {
		StringBuffer buffer = new StringBuffer();

		buffer.append("<li><a href='" + url + "curPage=" + getTotalPage() + "'>");
		buffer.append("尾页");
		buffer.append("</a></li>");
		return buffer.toString();
	}

	/**
	 * 上一页
	 * 
	 * @return 上一页的链接
	 */
	private String prePage() {
		int tmpPage = 0;
		StringBuffer buffer = new StringBuffer();
		if (curPage == 1) {
			tmpPage = 1;
		} else {
			tmpPage = curPage - 1;
		}
		buffer.append("<li><a href='" + url + "curPage=" + tmpPage + "'>");
		buffer.append("前一页");
		buffer.append("</a></li>");
		return buffer.toString();
	}

	/**
	 * 下一页
	 * 
	 * @return 下一页的链接
	 */
	private String nextPage() {
		int tmpPage = 0;
		StringBuffer buffer = new StringBuffer();
		if (curPage == getTotalPage()) {
			tmpPage = getTotalPage();
		} else {
			tmpPage = curPage + 1;
		}
		buffer.append("<li><a href='" + url + "curPage=" + tmpPage + "'>");
		buffer.append("后一页");
		buffer.append("</a></li>");
		return buffer.toString();
	}

	/**
	 * 当前页
	 * 
	 * @return 当前页的链接
	 */
	private String curPage() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<li><a href='javascript:void(0);' id='curPage'>" + curPage + "</a></li>");
		return buffer.toString();
	}

	/**
	 * 前两页
	 * 
	 * @return 前两页的链接
	 */
	private String preTwoPage() {
		StringBuffer buffer = new StringBuffer();
		if (curPage == 2) {
			buffer.append("<li><a href='" + url + "curPage=1'>1</a></li>");
		} else if (curPage > 1) {
			buffer.append("<li><a href='" + url + "curPage=" + (curPage - 2) + "'>");
			buffer.append(curPage - 2);
			buffer.append("</a></li>");
			buffer.append("<li><li><a href='" + url + "curPage=" + (curPage - 1) + "'>");
			buffer.append(curPage - 1);
			buffer.append("</a></li>");
		}
		return buffer.toString();
	}
	/**
	 * 后两页
	 * @return 后两页的链接
	 */
	private String nextTwoPage() {
		StringBuffer buffer = new StringBuffer();
		if (getTotalPage() - curPage == 1) {
			buffer.append("<li><a href='" + url + "curPage=" + getTotalPage() + "'>");
			buffer.append(getTotalPage());
			buffer.append("</a></li>");
		} else if (getTotalPage() - curPage > 1) {
			buffer.append("<li><a href='" + url + "curPage=" + (curPage + 1) + "'>");
			buffer.append(curPage + 1);
			buffer.append("</a></li>");
			buffer.append("<li><a href='" + url + "curPage=" + (curPage + 2) + "'>");
			buffer.append(curPage + 2);
			buffer.append("</a></li>");
		}
		return buffer.toString();
	}
}