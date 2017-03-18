package jsonUse;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

public class ReadBookInfoJson {
	
	//�������ַ�������
	//������������ȡͼ��ļ��
	public static String[] ReadJsonFile(String parh){
		
		try {
			JsonParser parser = new JsonParser();
			FileReader fileReader = new FileReader(parh);
			JsonObject object = (JsonObject) parser.parse(fileReader);
			String[] info_list = new String[2];
			info_list[0] = object.get("Book_Id").getAsString();
			info_list[1] = object.get("Book_Info").getAsString();
			
			try {
				fileReader.close();
			} catch (IOException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
			return info_list;
			
			
		} catch (JsonIOException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (JsonSyntaxException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return null;
		
		
		
	}

}
