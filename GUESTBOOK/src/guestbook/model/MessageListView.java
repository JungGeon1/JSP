package guestbook.model;

import java.util.List;

import com.sun.javafx.css.CalculatedValue;

public class MessageListView {
	private int messageTotalCount;
	private int currentPageNumber;
	private List<Message>messageList;
	private int pageTotalCount;
	private int messageCountPerpage;
	private int firstRow;
	private int endRow;
	public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList,
			int messageCountPerpage, int firstRow, int endRow) {
		super();
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerpage = messageCountPerpage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		CalculatePageTotalCount();
	}
	private void CalculatePageTotalCount() {
		if(messageTotalCount==0) {
			pageTotalCount=0;
		}else {
			pageTotalCount=messageTotalCount/messageCountPerpage;
			if(messageTotalCount%messageCountPerpage>0) {
				pageTotalCount++;
			}
		}
	}
	public int getMessageTotalCount() {
		return messageTotalCount;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public List<Message> getMessageList() {
		return messageList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public int getMessageCountPerpage() {
		return messageCountPerpage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public boolean isEmpty() {
		return messageTotalCount==0;
	}
	
}
