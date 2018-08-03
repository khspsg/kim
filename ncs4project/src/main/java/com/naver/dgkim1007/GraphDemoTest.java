package com.naver.dgkim1007;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JFrame;

public class GraphDemoTest extends JFrame implements MouseListener{
	private int x=50;   // leftmost pixel in circle has this x-coordinate
	private int y=50;   // topmost  pixel in circle has this y-coordinate
	public GraphDemoTest(){
		setSize(800,800);
	    setLocation(100,100);
	    addMouseListener(this); 
	    setVisible(true);
	}

	public static void main(String[] args) {
		GraphDemoTest c = new GraphDemoTest();

	}

	@Override
	public void mouseClicked(MouseEvent e) {
		 x = e.getX();   // x-coordinate of the mouse click
		    y = e.getY();   // y-coordinate of the mouse click
		    repaint();    //calls paint()
		
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}
