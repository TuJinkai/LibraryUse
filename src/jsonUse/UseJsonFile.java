package jsonUse;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.google.gson.JsonObject;

public class UseJsonFile {
	public static void CreatJsonFile(String fileName,String path,String[] string){
		
		JsonObject object = new JsonObject();
		object.addProperty("Book_Id", string[0]);
		object.addProperty("Book_Info", string[1]);
		
		File f = new File(path);//path��ʾ�������ļ���·��
		File file = new File(f, fileName);
		if(!file.exists()){
			try {
				file.createNewFile();
				FileWriter writer = new FileWriter(file);
				writer.write(object.toString());
				writer.flush();
				writer.close();
				System.out.println("�ļ��������");
			} catch (IOException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
			
		}else{
			file.delete();
			CreatJsonFile(fileName, path, string);
		}
		
		
	}
	
	public static void UpdateJsonFile(String fileName,String path,String[] string){
		
		JsonObject object = new JsonObject();
		object.addProperty("Book_Id", string[0]);
		object.addProperty("Book_Info", string[1]);
		
		File f = new File(path);
		File file = new File(f, fileName);
		if(file.exists()){
			boolean result = file.delete();//�ж��Ƿ�ɾ�����
			if(!result) {
				System.out.println("ɾ��ʧ�ܣ�");
			}else {
				FileWriter writer=null;
				try {
					file.createNewFile();
					writer= new FileWriter(file);
					System.out.println(object.toString());
					writer.write(object.toString());
					writer.flush();
					System.out.println("�ļ��������");
				} catch (IOException e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}finally {
					try {
						writer.close();
					}catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
			
		}
		
		
	}
}
