package jsonUse;

import com.google.gson.JsonObject;

public class Main_JsonRead {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		String path = "WebRoot/book_info/Book_Info_2014001201.json";
		String[] info = new String[2];
		ReadBookInfoJson r = new ReadBookInfoJson();
		info = r.ReadJsonFile(path);
		

		UseJsonFile usjf = new UseJsonFile();
		usjf.CreatJsonFile("666.json", "F:\\",info);
		System.out.print(Thread.currentThread().getContextClassLoader().getResource(".").getPath());
		
		String[] infos = new String[2];
		infos[0] = "000000";
		infos[1] = "asdjasjkndjhdna";
		usjf.UpdateJsonFile("Book_Info_2014002011.json", "F:\\The Files\\My Project\\MyEclipse Project\\.metadata\\.me_tcat7\\webapps\\LibraryUse\\book_info", infos);
		

	}

}
