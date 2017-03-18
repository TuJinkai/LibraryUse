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
		
		File f = new File(path);//path表示所创建文件的路径
		File file = new File(f, fileName);
		if(!file.exists()){
			try {
				file.createNewFile();
				FileWriter writer = new FileWriter(file);
				writer.write(object.toString());
				writer.flush();
				writer.close();
				System.out.println("文件创建完毕");
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
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
			boolean result = file.delete();//判断是否删除完毕
			if(!result) {
				System.out.println("删除失败！");
			}else {
				FileWriter writer=null;
				try {
					file.createNewFile();
					writer= new FileWriter(file);
					System.out.println(object.toString());
					writer.write(object.toString());
					writer.flush();
					System.out.println("文件更新完毕");
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
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
