package com.ashwin.server;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.codec.binary.Hex;

public class UrlShortner {
	
	public HashMap <String,String> UrlMap = new HashMap<String,String>();
	static UrlShortner object;
	public UrlShortner() throws IOException, ClassNotFoundException {
		FileInputStream fileInputStream  = new FileInputStream("myMap.content");
		ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);

		UrlMap = (HashMap) objectInputStream.readObject();
		objectInputStream.close();
	}
	public String shorten(String x) throws NoSuchAlgorithmException, IOException
	{
		String shortVersion ;
		MessageDigest messageDigest = MessageDigest.getInstance("MD2");
		messageDigest.update(x.getBytes());
		byte[] byteArray = messageDigest.digest();
		shortVersion = javax.xml.bind.DatatypeConverter.printHexBinary(byteArray);
		shortVersion = shortVersion.substring(0, 7);
		UrlMap.put(shortVersion, x);
		writeToFile();
		return shortVersion;
	}
	
	public void printMap()
	{
		Set set= UrlMap.entrySet();
		Iterator i = set.iterator();
		while(i.hasNext())
		{
			Map.Entry me = (Map.Entry) i.next();
			System.out.println("<tr><td>Key : " + me.getKey()+"</td> " + "<td>Value: "+me.getValue()+"</td></tr>");
		}
		
	  

	  
	}
	/*public static void main(String[] arg) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{
		UrlShortner u = new UrlShortner();
		u.shorten("hello");
		u.shorten("world");
		System.out.println(u.lengthen("BB37795"));
		u.printMap();
	
	}*/
	public static UrlShortner getInstance() throws ClassNotFoundException, IOException //singleton object to use
	{
		if(object==null)
		{
			object = new UrlShortner();
		}
		return object;
	}
	
	public String lengthen(String test)
	{
		for(Entry<String,String> entry: UrlMap.entrySet())
		{
			if(entry.getKey().equals(test))
				return entry.getValue();
		}
		return null;
	}
	public void writeToFile() throws IOException
	{
		FileOutputStream fileOutputStream = new FileOutputStream("myMap.content");
		ObjectOutputStream objectOutputStream= new ObjectOutputStream(fileOutputStream);

		objectOutputStream.writeObject(UrlMap);
		objectOutputStream.close();
	}
}
